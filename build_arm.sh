cd luajit-2.1/src

# Android/ARM, armeabi-v7a (ARMv7 VFP), Android 4.0+ (ICS)
NDK=/Workspace/Android/android-ndk-r10e
NDKABI=19
NDKVER=$NDK/toolchains/arm-linux-androideabi-4.9
NDKP=$NDKVER/prebuilt/darwin-x86_64/bin/arm-linux-androideabi-
NDKF="--sysroot $NDK/platforms/android-$NDKABI/arch-arm" 
NDKARCH="-march=armv7-a -mfloat-abi=softfp -Wl,--fix-cortex-a8"
NDKBUILD="$NDK/ndk-build"

make clean
make HOST_CC="gcc -m32" CROSS=$NDKP TARGET_SYS=Linux TARGET_FLAGS="$NDKF $NDKARCH"
cp ./libluajit.a ../../android/jni/libluajit.a
make clean

cd ../../android
${NDKBUILD} clean APP_ABI="armeabi-v7a,x86"
${NDKBUILD} APP_ABI="armeabi-v7a"
cp libs/armeabi-v7a/libtolua.so ../Plugins/Android/libs/armeabi-v7a
${NDKBUILD} clean APP_ABI="armeabi-v7a,x86"