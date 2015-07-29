require "minitest/unit"
require "minitest/autorun"
require "./helper"

class TestGenerics < MiniTest::Unit::TestCase
  def setup
    @bs = gen_bridge_metadata("generics.h")
  end

  def test_generics
    klass = @bs["class"].first
    assert_equal(klass["name"], "Foo")

    method = klass["method"][0]
    assert_equal(method["selector"],                "setArray:")
    assert_equal(method["arg"][0]["declared_type"], "NSArray*")
    assert_equal(method["arg"][0]["type"],          "@")
  end

end