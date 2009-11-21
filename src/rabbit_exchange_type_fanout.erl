-module(rabbit_exchange_type_fanout).
-include("rabbit.hrl").

-behaviour(rabbit_exchange_behaviour).

-export([description/0, route/3]).
-export([recover/1, init/1, delete/1, add_binding/2, delete_binding/2]).

description() ->
    [{name, <<"fanout">>},
     {description, <<"AMQP fanout exchange, as per the AMQP specification">>}].

route(#exchange{name = Name}, _RoutingKey, _Content) ->
    rabbit_router:match_routing_key(Name, '_').

recover(_X) -> ok.
init(_X) -> ok.
delete(_X) -> ok.
add_binding(_X, _B) -> ok.
delete_binding(_X, _B) -> ok.
