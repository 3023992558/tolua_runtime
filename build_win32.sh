#!/bin/bash
# 32 Bit Version
mkdir -p window/x86

cd luajit-2.1
mingw32-make clean

mingw32-make BUILDMODE=static CC="gcc -m32 -O2"
cp src/libluajit.a ../window/x86/libluajit.a
mingw32-make clean

cd ..

gcc -m32 -O2 -std=gnu99 -shared \
	int64.c \
	uint64.c \
	tolua.c \
	lua_extensions/lpeg.c \
	lua_extensions/struct.c \
	lua_extensions/cjson/strbuf.c \
	lua_extensions/cjson/lua_cjson_jit.c \
	lua_extensions/cjson/fpconv.c \
	lua_extensions/lfs/lfs.c \
	lua_extensions/lpack/lpack.c \
 	lua_extensions/lua_zlib/lua_zlib.c \
	lua_extensions/yaml/api.c \
	lua_extensions/yaml/dumper.c \
	lua_extensions/yaml/emitter.c \
	lua_extensions/yaml/loader.c \
	lua_extensions/yaml/parser.c \
	lua_extensions/yaml/reader.c \
	lua_extensions/yaml/scanner.c \
	lua_extensions/yaml/writer.c \
	lua_extensions/lyaml/emitter.c \
	lua_extensions/lyaml/parser.c \
	lua_extensions/lyaml/scanner.c \
	lua_extensions/lyaml/yaml.c \
	lua_extensions/lua_extensions_jit.c \
	-lz -lm \
	-o Plugins/x86/tolua.dll \
	-I./ \
	-Iluajit-2.1/src \
	-Ilua_extensions \
	-lws2_32 \
	-Wl,--whole-archive window/x86/libluajit.a -Wl,--no-whole-archive -static-libgcc -static-libstdc++
