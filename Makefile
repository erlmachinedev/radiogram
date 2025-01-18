PROJECT = radiogram
PROJECT_DESCRIPTION = "Embedded AMQP transmission device"
PROJECT_VERSION = 0.0.1

DEPS = erlbox rabbit_common 

dep_erlbox = git https://github.com/erlmachinedev/erlbox.git
dep_rabbit_common = hex 4.0.3

TEST_DEPS = meck amqp_client

dep_meck = git https://github.com/eproxus/meck.git
dep_amqp_client = hex 4.0.3

include erlang.mk
