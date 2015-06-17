-module(counter).

-export([start/0, stop/0, new/1, stop/1, incr/1, incr/2, get_count/1]).

-define(APPLICATION, counter).

%% @doc start counter app
start() -> 
    application:start(?APPLICATION).

%% @doc stop counter app
stop() -> 
    application:stop(?APPLICATION).

-type counter() :: pid().

%% @doc create a new counter
-spec new(StartFrom::integer()) -> {ok, counter()}.
new(StartFrom) ->
	counter_srv:start_link(StartFrom).

%% @doc stop a counter server
-spec stop(Counter::counter()) -> ok.
stop(Counter) ->
	counter_srv:stop(Counter).	

%% @doc increment counter by one
-spec incr(Counter::counter()) -> ok.
incr(Counter) ->
	incr(Counter, 1).

%% @doc increment counter by arbitrary integer number
-spec incr(Counter::counter(), By::integer()) -> ok.
incr(Counter, By) ->
	counter_srv:incr(Counter, By).

%% @doc get current value of the counter
-spec get_count(Counter::counter()) -> integer().
get_count(Counter) ->
	counter_srv:get_count(Counter).
