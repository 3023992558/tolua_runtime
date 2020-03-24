#!/bin/bash
# 32 Bit Version
mkdir -p window/x86
luacdir="lua53"
luajitdir="luajit-2.1"
luapath=""
lualibname=""
outpath="Plugins53"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

while :
do
    echo "Please choose (1)luajit; (2)lua5.3"
    read input
    case $input in
        "1")
            luapath=$luajitdir
            lualibname="libluajit"
			outpath="Plugins"
            break
        ;;
        "2")
            luapath=$luacdir
            lualibname="liblua"
			outpath="Plugins53"
            break
        ;;
        *)
            echo "Please enter 1 or 2!!"
            continue
        ;;
    esac
done

echo "select : $luapath"

cd $DIR/$luapath
mingw32-make clean

case $luapath in 
    $luacdir)
        mingw32-make mingw BUILDMODE=static CC="gcc -m32 -std=gnu99"
    ;;
    $luajitdir)
        mingw32-make BUILDMODE=static CC="gcc -m32 -O2"
    ;;
esac

cp src/$lualibname.a ../window/x86/$lualibname.a
mingw32-make clean

cd ..

gcc -m32 -O2 -std=gnu99 -shared \
	int64.c \
	uint64.c \
	tolua.c \
	pb/pb.c \
	lpeg/lpcap.c \
	lpeg/lpcode.c \
	lpeg/lpprint.c \
	lpeg/lptree.c \
	lpeg/lpvm.c	\
	struct.c \
	cjson/strbuf.c \
	cjson/lua_cjson.c \
	cjson/fpconv.c \
	lfs/lfs.c \
	yaml/api.c \
	yaml/dumper.c \
	yaml/emitter.c \
	yaml/loader.c \
	yaml/parser.c \
	yaml/reader.c \
	yaml/scanner.c \
	yaml/writer.c \
	lyaml/emitter.c \
	lyaml/parser.c \
	lyaml/scanner.c \
	lyaml/yaml.c \
	lua_extensions_jit.c \
	-o $outpath/x86/tolua.dll \
	-I./ \
 	-I$luapath/src \
	-Icjson \
	-Ilpeg \
	-Ilfs \
	-Iyaml \
	-Ilyaml \
	-Ilpack \
	-Ipb \
	-lws2_32 \
 	-Wl,--whole-archive window/x86/$lualibname.a -Wl,--no-whole-archive -static-libgcc -static-libstdc++

echo "build tolua.dll success" 	