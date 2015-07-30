require "minitest/unit"
require "minitest/autorun"
require "./helper"

class TestStructure < MiniTest::Unit::TestCase
  def setup
    @bs = gen_bridge_metadata("structure.h")
  end

  def test_structure
    struct = @bs["struct"]
    assert_equal(struct[0]["name"], "TestStruct")

    field = struct[0]["field"]
    assert_equal(field[0]["declared_type"], "double")
    assert_equal(field[1]["declared_type"], "float")
  end

end