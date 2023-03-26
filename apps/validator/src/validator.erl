-module(validator).
-on_load(init/0).

-export([
    validate/1
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
    LibPath = filename:join(PrivFolder, atom_to_list(?MODULE)),
    SchemaPath = filename:join(PrivFolder, "xml-schemas/template.xsd"),
    ok = erlang:load_nif(LibPath, SchemaPath).

-spec validate(binary()) -> ok | {error, [binary()]}.
validate(XmlBinary) when is_binary(XmlBinary) ->
    erlang:nif_error({nif_not_loaded, ?MODULE}).
