require "minitest/unit"
require "minitest/autorun"
require "./helper"

class TestBlocks < MiniTest::Unit::TestCase
  def setup
    @bs = gen_bridge_metadata("variadic.h")
  end

  def test_variadic
    klass = @bs["class"][0]

    method1 = klass["method"][0]
    assert_equal(method1["selector"], "method1:")
    assert_equal(method1["variadic"], "true")
    assert_equal(method1["sentinel"], nil)

    method2 = klass["method"][1]
    assert_equal(method2["selector"], "method2:")
    assert_equal(method2["variadic"], "true")
    assert_equal(method2["sentinel"], "0")
  end

end