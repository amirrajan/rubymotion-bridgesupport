require "minitest/unit"
require "minitest/autorun"
require "./helper"

class TestProperty < MiniTest::Unit::TestCase
  def setup
    @bs = gen_bridge_metadata("property.h")
  end

  def test_property
    klass = @bs["class"]
    assert_equal(klass[0]["name"], "Foo")

    method = klass[0]["method"]
    assert_equal(method.count, 2) # Accessor methods only should be generated
  end

end