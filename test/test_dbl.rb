require "minitest/unit"
require "minitest/autorun"
require "./helper"

class TestFloat < MiniTest::Unit::TestCase

  def test_DBL_MAX
    @bs = gen_bridge_metadata("dbl.h")

    enum = @bs["enum"]
    assert_equal(enum[0]["name"],  "MY_CGFLOAT_MAX")
  end

  def test_DBL_MAX_with_SYSROOT
    @bs = gen_bridge_metadata("dbl.h", {:cflags => " -isysroot '/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk'"})

    enum = @bs["enum"]
    assert_equal(enum[0]["name"],  "MY_CGFLOAT_MAX")
  end

end