-module(counter).

-export([start/0, stop/0, incr/0, incr/1, get_count/0]).

-define(APPLICATION, counter).

%% @doc start counter app
start() -> 
    application:start(?APPLICATION).

%% @doc stop counter app
stop() -> 
    application:stop(?APPLICATION).

%% @doc increment counter by one
-spec incr() -> ok.
incr() ->
	incr(1).

%% @doc increment counter by arbitrary integer number
-spec incr(By::integer()) -> ok.
incr(By) ->
	counter_srv:incr(By).

%% @doc get current value of the counter
-spec get_count() -> integer().
get_count() ->
	counter_srv:get_count().
