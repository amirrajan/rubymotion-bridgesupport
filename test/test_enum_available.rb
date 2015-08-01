require "minitest/unit"
require "minitest/autorun"
require "./helper"

class TestEnumAvailable < MiniTest::Unit::TestCase
  def setup
    @bs = gen_bridge_metadata("enum_available.h", {:cflags => " -isysroot '/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk' -miphoneos-version-min=8.4 -D__ENVIRONMENT_IPHONE_OS_VERSION_MIN_REQUIRED__=80400"})
  end

  def test_enum_available
    enum = @bs["enum"]
    assert_equal(enum[0]["name"],  "FooTestOption")
    assert_equal(enum[0]["value"], "42")
  end

end