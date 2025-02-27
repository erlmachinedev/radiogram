-module(radiogram_SUITE).

-export([suite/0]).

-export([all/0]).

-export([init_per_suite/1, end_per_suite/1]).

-export([test/1]).

-include_lib("common_test/include/ct.hrl").

-export([]).

%%--------------------------------------------------------------------
%% COMMON TEST CALLBACK FUNCTIONS
%%--------------------------------------------------------------------

suite() ->
    [{timetrap, _Time = {seconds, 10}}].


all() -> [test].

init_per_suite(Config) ->
    Res = Config,
    Res.

end_per_suite(_Config) ->
    ok.

%%--------------------------------------------------------------------
%% TEST CASES
%%--------------------------------------------------------------------

test(_Config) ->
    meck:new(test, [passthrough, non_strict, no_link]),

    %% TODO Inspect the validity of URI
    %% NOTE Transport configuration is managed by Ranch

    %% NOTE API to manage transmission (optional)
    meck:expect(test, radiate, fun (Wave) -> Wave end),

    %% NOTE API to inspect connection URI
    meck:expect(test, connect, fun (Wave) -> Wave end),

    %% NOTE API to manage AMQP
    meck:expect(test, exec, fun (_Cmd) -> ok end),

    %% TODO Investigate AMQP protocol header File
    %% TODO In-memory DB (radiogram) and configuration Module (test)
    %% TODO Investigate backing queue API implementation 

    Command = #'exchange.declare'{ exchange = <<"X">>, type = <<"topic">> },

    meck:expect(radiogram, exec, fun (Command) -> Command end),

    %% TODO Decorated report implemented as observer_cli Plug-in

    radiogram:intercept(_Port = 5672, test, []),
    
    meck:unload(test).