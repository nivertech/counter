-module(counter_srv).
-behaviour(gen_server).

-define(SERVER, {global, ?MODULE}).

%% ------------------------------------------------------------------
%% API Function Exports
%% ------------------------------------------------------------------

-export([start_link/0]).

-export([incr/1, get_count/0]).


%% ------------------------------------------------------------------
%% gen_server Function Exports
%% ------------------------------------------------------------------

-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).

%% ------------------------------------------------------------------
%% API Function Definitions
%% ------------------------------------------------------------------

start_link() ->
    gen_server:start_link(?SERVER, ?MODULE, [], []).

incr(By) ->
	gen_server:cast(?SERVER, {incr, By}).

get_count() ->
	gen_server:call(?SERVER, get_count).


%% ------------------------------------------------------------------
%% gen_server Function Definitions
%% ------------------------------------------------------------------

init([]) ->
    {ok, 0}.

handle_call(get_count, _From, State) ->
    {reply, State, State};
handle_call(Request, _From, State) ->
	io:format("Unexpected request: ~p\n", [Request]),
    {reply, ok, State}.

handle_cast({incr, By}, State) ->
    {noreply, State+By};
handle_cast(Msg, State) ->
	io:format("Unexpected message: ~p\n", [Msg]),
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%% ------------------------------------------------------------------
%% Internal Function Definitions
%% ------------------------------------------------------------------

