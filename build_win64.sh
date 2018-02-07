#!/bin/bash
# 64 Bit Version
mkdir -p window/x86_64

cd luajit-2.1
mingw32-make clean

mingw32-make BUILDMODE=static CC="gcc -m64 -O2" XCFLAGS=-DLUAJIT_ENABLE_GC64
cp src/libluajit.a ../window/x86_64/libluajit.a
mingw32-make clean

cd ..

gcc -m64 -O2 -std=gnu99 -shared \
 tolua.c \
 int64.c \
 uint64.c \
 lua_extensions/lpeg.c \
 lua_extensions/struct.c \
 lua_extensions/cjson/strbuf.c \
 lua_extensions/cjson/lua_cjson_jit.c \
 lua_extensions/cjson/fpconv.c \
 lua_extensions/lfs/lfs.c \
 lua_extensions/lpack/lpack.c \
 lua_extensions/lua_zlib/lua_zlib.c \
 lua_extensions/lua_extensions_jit.c \
 -o Plugins/x86_64/tolua.dll \
 -I./ \
 -Iluajit-2.1/src \
 -Ilua_extensions \
 -lws2_32 \
 -Wl,--whole-archive window/x86_64/libluajit.a -Wl,--no-whole-archive -static-libgcc -static-libstdc++