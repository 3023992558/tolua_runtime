LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libluajit
LOCAL_SRC_FILES := libluajit.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_MODULE := tolua
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../luajit-2.1/src
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../

LOCAL_CPPFLAGS := -O2
LOCAL_CFLAGS :=  -O2 -std=gnu99
LOCAL_LDLIBS := -lm -lz
LOCAL_SRC_FILES :=	../../tolua.c \
					../../int64.c \
					../../uint64.c \
					../../lua_extensions/lpeg.c \
					../../lua_extensions/struct.c \
					../../lua_extensions/cjson/strbuf.c \
					../../lua_extensions/cjson/lua_cjson_jit.c \
					../../lua_extensions/cjson/fpconv.c \
					../../lua_extensions/lpack/lpack.c \
 					../../lua_extensions/lua_zlib/lua_zlib.c \
					../../lua_extensions/lfs/lfs.c \
					../../lua_extensions/yaml/api.c \
					../../lua_extensions/yaml/dumper.c \
					../../lua_extensions/yaml/emitter.c \
					../../lua_extensions/yaml/loader.c \
					../../lua_extensions/yaml/parser.c \
					../../lua_extensions/yaml/reader.c \
					../../lua_extensions/yaml/scanner.c \
					../../lua_extensions/yaml/writer.c \
					../../lua_extensions/lyaml/emitter.c \
					../../lua_extensions/lyaml/parser.c \
					../../lua_extensions/lyaml/scanner.c \
					../../lua_extensions/lyaml/yaml.c \
					../../lua_extensions/lua_extensions_jit.c \
 					
LOCAL_WHOLE_STATIC_LIBRARIES += libluajit

include $(BUILD_SHARED_LIBRARY)