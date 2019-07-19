require "minitest/unit"
require "minitest/autorun"
require "./helper"

class TestCPTTextStyle < MiniTest::Unit::TestCase
  def setup
    @bs = gen_bridge_metadata("cpt_text_style.h", {:cflags => "-isysroot '/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk' -miphoneos-version-min=8.4 -D__ENVIRONMENT_IPHONE_OS_VERSION_MIN_REQUIRED__=80400"})
  end

  def test_category

  end

end