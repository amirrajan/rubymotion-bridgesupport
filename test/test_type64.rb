require "minitest/unit"
require "minitest/autorun"
require "./helper"

class TestType64 < MiniTest::Unit::TestCase
  def setup
    @bs = gen_bridge_metadata("type64.h")
  end

  def test_type64
    klass = @bs["class"].first
    assert_equal(klass["name"], "Foo")

    method1 = klass["method"][0]
    assert_equal(method1["selector"],         "setFloat:")
    assert_equal(method1["arg"][0]["type"],   "f")
    assert_equal(method1["arg"][0]["type64"], "d")
  end

end