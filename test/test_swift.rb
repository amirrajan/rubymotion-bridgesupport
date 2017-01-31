require "minitest/unit"
require "minitest/autorun"
require "./helper"

class TestSwift < MiniTest::Unit::TestCase
  def setup
    @bs = gen_bridge_metadata("swift.h")
  end

  def test_interface
    klass = @bs["class"][0]

    assert_equal(klass["name"],         "Hello")
    assert_equal(klass["runtime_name"], "_TtC21hello_swift_framework5Hello")
  end

  def test_protocol
    klass = @bs["informal_protocol"][0]

    assert_equal(klass["name"],         "Foo")
    assert_equal(klass["runtime_name"], "_TtP21hello_swift_framework3Foo_")
  end

end