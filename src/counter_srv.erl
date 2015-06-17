-module(counter_srv).
-behaviour(gen_server).

%% ------------------------------------------------------------------
%% API Function Exports
%% ------------------------------------------------------------------

-export([start_link/0, start_link/1, stop/1]).

-export([incr/2, get_count/1]).


%% ------------------------------------------------------------------
%% gen_server Function Exports
%% ------------------------------------------------------------------

-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).

%% ------------------------------------------------------------------
%% API Function Definitions
%% ------------------------------------------------------------------

-spec start_link() -> {ok, pid()} | ignore | {error, _}.
start_link() ->
    start_link(0).

-spec start_link(StartFrom::integer()) -> {ok, pid()} | ignore | {error, _}.
start_link(StartFrom) ->
    gen_server:start_link(?MODULE, [StartFrom], []).

-spec stop(Ref::pid()) -> ok.
stop(Ref) ->
    gen_server:cast(Ref, stop).

-spec incr(Ref::pid(), By::integer()) -> ok.
incr(Ref, By) ->
	gen_server:cast(Ref, {incr, By}).

-spec get_count(Ref::pid()) -> integer().
get_count(Ref) ->
	gen_server:call(Ref, get_count).


%% ------------------------------------------------------------------
%% gen_server Function Definitions
%% ------------------------------------------------------------------

init([StartFrom]) ->
    {ok, StartFrom}.

handle_call(get_count, _From, State) ->
    {reply, State, State};
handle_call(Request, _From, State) ->
	io:format("Unexpected call: ~p\n", [Request]),
    {reply, ok, State}.

handle_cast({incr, By}, State) ->
    {noreply, State+By};
handle_cast(stop, State) ->
    {stop, normal, State};
handle_cast(Msg, State) ->
	io:format("Unexpected cast: ~p\n", [Msg]),
    {noreply, State}.

handle_info(Info, State) ->
    io:format("Unexpected info: ~p\n", [Info]),
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%% ------------------------------------------------------------------
%% Internal Function Definitions
%% ------------------------------------------------------------------

