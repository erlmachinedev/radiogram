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

    radiogram:intercept(_Mod = test, _Opt = []),
    
    meck:unload(test).