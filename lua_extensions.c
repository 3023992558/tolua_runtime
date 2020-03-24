#include "lua_extensions.h"
#include "cjson/lua_cjson.h"
#include "lfs/lfs.h"
#include "struct.h"
#include "lpeg/lpeg.h"
#include "lua_zlib/lua_zlib.h"
#include "lpack/lpack.h"
#include "lyaml/lyaml.h"
#include "pb/pb.h"
#include "bit.h"
#include "struct.h"

static luaL_Reg lua_exts[] = {
    {"lfs", luaopen_lfs},
    { "struct", luaopen_struct},
    { "cjson", luaopen_cjson_safe},
    { "lpeg", luaopen_lpeg},
    { "pack", luaopen_pack},
    { "zlib", luaopen_zlib},
    { "yaml", luaopen_yaml},
    { "pb", luaopen_pb},
    { "bit", luaopen_bit},
    { "struct", luaopen_struct},
    {NULL, NULL}
};

LUALIB_API int luaopen_lua_extensions(lua_State *L)
{
    // load extensions
    luaL_Reg* lib = lua_exts;
    lua_getglobal(L, "package");
    lua_getfield(L, -1, "preload");
    for (; lib->func; lib++)
    {
        lua_pushcfunction(L, lib->func);
        lua_setfield(L, -2, lib->name);
    }
    lua_pop(L, 2);
    
    return 1;
}
