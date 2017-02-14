require "minitest/unit"
require "minitest/autorun"
require "./helper"

class TestUnavailable < MiniTest::Unit::TestCase

  def test_osx
    @bs = gen_bridge_metadata("unavailable.h", {:cflags => "-mmacosx-version-min=10.12 -framework Foundation -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk"})
    assert_equal(@bs["constant"].count,      1)
    assert_equal(@bs["constant"][0]["name"], "TestConstant1")

    function = @bs["function"]
    assert_equal(function.count,      2)
    assert_equal(function[0]["name"], "Function2")
    assert_equal(function[1]["name"], "Function3")

    method = @bs["class"][0]["method"]
    assert_equal(method.count,          3)
    assert_equal(method[0]["selector"], "testMethod2")
    assert_equal(method[1]["selector"], "testMethod3")
    assert_equal(method[2]["selector"], "testMethod7")
  end

  def test_ios
    @bs = gen_bridge_metadata("unavailable.h", {:cflags => "-mios-version-min=10.0 -framework Foundation -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk"})
    assert_equal(@bs["constant"].count,      1)
    assert_equal(@bs["constant"][0]["name"], "TestConstant2")

    function = @bs["function"]
    assert_equal(function.count,      2)
    assert_equal(function[0]["name"], "Function1")
    assert_equal(function[1]["name"], "Function3")

    method = @bs["class"][0]["method"]
    assert_equal(method.count,          5)
    assert_equal(method[0]["selector"], "testMethod1")
    assert_equal(method[1]["selector"], "testMethod3")
    assert_equal(method[2]["selector"], "testMethod4")
    assert_equal(method[3]["selector"], "testMethod5")
    assert_equal(method[4]["selector"], "testMethod6")
  end

  def test_ios_older_version
    @bs = gen_bridge_metadata("unavailable.h", {:cflags => "-mios-version-min=7.0 -framework Foundation -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk"})
    assert_equal(@bs["constant"].count,      2)
    assert_equal(@bs["constant"][0]["name"], "TestConstant1")
    assert_equal(@bs["constant"][1]["name"], "TestConstant2")
  end

  def test_tvos
    @bs = gen_bridge_metadata("unavailable.h", {:cflags => "-mtvos-version-min=10.0 -framework Foundation -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/AppleTVSimulator.platform/Developer/SDKs/AppleTVSimulator.sdk"})
    assert_equal(@bs["constant"].count,      1)
    assert_equal(@bs["constant"][0]["name"], "TestConstant2")

    function = @bs["function"]
    assert_equal(function.count,      2)
    assert_equal(function[0]["name"], "Function1")
    assert_equal(function[1]["name"], "Function2")

    method = @bs["class"][0]["method"]
    assert_equal(method.count,          2)
    assert_equal(method[0]["selector"], "testMethod1")
    assert_equal(method[1]["selector"], "testMethod5")
  end

end