require "minitest/unit"
require "minitest/autorun"
require "./helper"

class TestConstant < MiniTest::Unit::TestCase
  def setup
    @bs = gen_bridge_metadata("constant.h")
  end

  def test_stringconstant
    const = @bs["string_constant"]

    assert_equal(const[0]["name"],  "TestCFStringConstant")
    assert_equal(const[0]["value"], "baz")
    assert_equal(const[1]["name"],  "TestNSStringConstant")
    assert_equal(const[1]["value"], "bar")
    assert_equal(const[2]["name"],  "TestStringConstant")
    assert_equal(const[2]["value"], "foo")
  end

end