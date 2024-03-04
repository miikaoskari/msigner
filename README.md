# msigner

build openssl from here https://www.openssl.org/source/old/3.2/openssl-3.2.0.tar.gz

export CROSS_TOP="`xcode-select --print-path`/Platforms/iPhoneSimulator.platform/Developer"
export CROSS_SDK="iPhoneSimulator.sdk"
./Configure iossimulator-xcrun "-arch arm64" no-asm no-shared no-hw no-async

