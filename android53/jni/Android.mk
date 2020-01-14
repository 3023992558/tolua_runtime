LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := liblua
LOCAL_SRC_FILES := liblua.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_MODULE := tolua
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../lua53/src
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../

LOCAL_CPPFLAGS := -O2
LOCAL_CFLAGS :=  -O2 -std=gnu99
LOCAL_LDLIBS := -lm -lz
LOCAL_SRC_FILES :=	../../tolua.c \
					../../int64.c \
					../../uint64.c \
					../../pb.c \
					../../lpeg/lpcap.c \
					../../lpeg/lpcode.c \
					../../lpeg/lpprint.c \
					../../lpeg/lptree.c \
					../../lpeg/lpvm.c \
					../../struct.c \
					../../cjson/strbuf.c \
					../../cjson/lua_cjson.c \
					../../cjson/fpconv.c \
					../../lua_zlib/lua_zlib.c \
					../../lfs/lfs.c \
					../../yaml/api.c \
					../../yaml/dumper.c \
					../../yaml/emitter.c \
					../../yaml/loader.c \
					../../yaml/parser.c \
					../../yaml/reader.c \
					../../yaml/scanner.c \
					../../yaml/writer.c \
					../../lyaml/emitter.c \
					../../lyaml/parser.c \
					../../lyaml/scanner.c \
					../../lyaml/yaml.c \
					../../lpack/lpack.c \
					../../lua_extensions.c \
 					
LOCAL_WHOLE_STATIC_LIBRARIES += liblua
include $(BUILD_SHARED_LIBRARY)