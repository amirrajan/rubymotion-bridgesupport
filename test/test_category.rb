require "minitest/unit"
require "minitest/autorun"
require "./helper"

class TestCategory < MiniTest::Unit::TestCase
  def setup
    @bs = gen_bridge_metadata("category.h", {:cflags => "-isysroot '/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk' -miphoneos-version-min=8.4 -D__ENVIRONMENT_IPHONE_OS_VERSION_MIN_REQUIRED__=80400"})
  end

  def test_category
    klass = @bs["class"].first
    assert_equal(klass["name"], "UIColor")

    method = klass["method"]
    assert_equal(method[0]["selector"], "colorByAdding:")
    assert_equal(method[1]["selector"], "hexStringFromColor")
    assert_equal(method[2]["selector"], "stringFromColor")
  end

end