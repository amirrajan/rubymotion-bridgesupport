require "minitest/unit"
require "minitest/autorun"
require "./helper"

class TestOpaque < MiniTest::Unit::TestCase
  def setup
    @bs = gen_bridge_metadata("opaque.h")
  end

  def test_opaque
    opaque = @bs["opaque"]
    assert_equal(opaque[0]["name"], "vImage_MultidimensionalTable")
    assert_equal(opaque[0]["type"], "^{vImage_MultidimensionalTableData=}")
  end

end