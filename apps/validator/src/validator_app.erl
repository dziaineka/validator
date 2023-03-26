%%%-------------------------------------------------------------------
%% @doc validator public API
%% @end
%%%-------------------------------------------------------------------

-module(validator_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    validator_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
