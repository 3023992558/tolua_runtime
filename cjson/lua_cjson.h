
#ifndef __LUA_CJSON_H_
#define __LUA_CJSON_H_


#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"

int luaopen_cjson(lua_State *l);
int luaopen_cjson_safe(lua_State *l);

#endif
