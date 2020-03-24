
#ifndef __LUA_EXTRA_H_
#define __LUA_EXTRA_H_


#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>


// 注册lua扩展
LUALIB_API int luaopen_lua_extensions(lua_State *L);



#endif
