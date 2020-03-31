#!/bin/sh

#----------
#YTYanK:
# 打包框架
#---------

# 合并在真机和模拟器上编译出的QiShareSDK
# 如果工程名称和Framework的Target名称不一样的话，要自定义FMKNAME

FMK_NAME="YTYCoreFramework"

# INSTALL_DIR 是导出framework的路径
# 在工程的根目录创建framework的文件夹.

INSTALL_DIR=${SRCROOT}/YTYCoreFramework/${FMK_NAME}.framework
# 合成framework后，WRK_DIR会被删除

WRK_DIR=build
DEVICE_DIR=${WRK_DIR}/Release-iphoneos/${FMK_NAME}.framework
SIMULATOR_DIR=${WRK_DIR}/Release-iphonesimulator/${FMK_NAME}.framework

# 通过检索和试验发现，我们可以使用-UseModernBuildSystem=NO来指定xcodebuild命令不使用当前的编译系统。
# Clean两个架构的framework
xcodebuild OTHER_CFLAGS="-fembed-bitcode" -configuration "Release" -target "${FMK_NAME}" -sdk iphoneos clean build -UseModernBuildSystem=NO
xcodebuild OTHER_CFLAGS="-fembed-bitcode" -configuration "Release" -target "${FMK_NAME}" -sdk iphonesimulator clean build -UseModernBuildSystem=NO
# 删除之前生成的framework
if [ -d "${INSTALL_DIR}" ]
then
rm -rf "${INSTALL_DIR}"
fi
mkdir -p "${INSTALL_DIR}"
cp -R "${DEVICE_DIR}/" "${INSTALL_DIR}/"

# 合成
sudo lipo -create "${DEVICE_DIR}/${FMK_NAME}" "${SIMULATOR_DIR}/${FMK_NAME}" -output "${INSTALL_DIR}/${FMK_NAME}"

# 删除 WRK_DIR
rm -r "${WRK_DIR}"

# 打开 INSTALL_DIR
open "${INSTALL_DIR}"

