require "minitest/unit"
require "minitest/autorun"
require "./helper"

class TestNullability < MiniTest::Unit::TestCase
  def setup
    @bs = gen_bridge_metadata("nullability.h")
  end

  def test_nullable
    klass = @bs["class"].first
    assert_equal(klass["name"], "Foo")

    method1 = klass["method"][0]
    assert_equal(method1["selector"],       "setSelector1:")
    assert_equal(method1["arg"][0]["type"], ":")

    method2 = klass["method"][1]
    assert_equal(method2["selector"],       "setSelector2:")
    assert_equal(method2["arg"][0]["type"], ":")

    method3 = klass["method"][2]
    assert_equal(method3["selector"],       "setSelector3:")
    assert_equal(method3["arg"][0]["type"], ":")
  end

  def test_nonnull
    klass = @bs["class"].first
    assert_equal(klass["name"], "Foo")

    method4 = klass["method"][3]
    assert_equal(method4["selector"],       "setSelector4:")
    assert_equal(method4["arg"][0]["type"], ":")

    method5 = klass["method"][4]
    assert_equal(method5["selector"],       "setSelector5:")
    assert_equal(method5["arg"][0]["type"], ":")
  end

end