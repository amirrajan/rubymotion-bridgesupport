require "minitest/unit"
require "minitest/autorun"
require "./helper"

class TestCPlusPlus < MiniTest::Unit::TestCase
  def setup
    @bs = gen_bridge_metadata("cplusplus.h")
  end

  def test_cplusplus
    # should work without exception
    const = @bs["string_constant"]

    assert_equal(const[0]["name"],  "TestStringConstant")
    assert_equal(const[0]["value"], "foo")    
  end

end