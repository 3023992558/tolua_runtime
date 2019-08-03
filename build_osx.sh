#!/usr/bin/env bash

cd macnojit/
xcodebuild clean
xcodebuild -configuration=Release
rm -rf ../Plugins/tolua.bundle
cp -rf build/Release/tolua.bundle ../Plugins/
