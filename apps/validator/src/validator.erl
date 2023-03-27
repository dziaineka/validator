-module(validator).
-on_load(init/0).

-export([
    validate/2
]).

init() ->
    PrivFolder =
        case code:priv_dir(?MODULE) of
            {error, bad_name} ->
                Dir = code:which(?MODULE),
                filename:join([filename:dirname(Dir), "..", "priv"]);
            Dir ->
                Dir
        end,
    LibPath = filename:join(PrivFolder, "xml_validator"),
    SchemaPath = filename:join(PrivFolder, "xml-schemas/template.xsd"),
    ok = erlang:load_nif(LibPath, SchemaPath).

-spec validate(integer(), integer()) -> integer().
validate(_Number1, _Number2)->
    erlang:nif_error({nif_not_loaded, ?MODULE}).
