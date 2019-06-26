RUBYOPT='' '../RubyMotion/bin/gen_bridge_metadata' --format complete  \
                                                   --cflags " -isysroot '/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator12.2.sdk' -miphoneos-version-min=12.2 -D__ENVIRONMENT_IPHONE_OS_VERSION_MIN_REQUIRED__=120200 -I. -I./header -I'.'" \
                                                   --headers "sample.txt" \
                                                   -o 'sample.bridgesupport'
