require "minitest/unit"
require "minitest/autorun"
require "./helper"

class TestBlocks < MiniTest::Unit::TestCase
  def setup
    @bs = gen_bridge_metadata("blocks.h")
  end

  def test_NS_BLOCKS_AVAILABLE
    klass = @bs["class"][0]
    assert_equal(klass["name"], "Bar")

    method = klass["method"]
    assert_equal(method[0]["selector"], "enumerateObjectsUsingBlock:")

    arg = method[0]["arg"]
    assert_equal(arg[0]["function_pointer"], "true")

    blocks_arg = arg[0]["arg"]
    assert_equal(blocks_arg[0]["type"], "@")
  end

  def test_blocks
    klass = @bs["class"][1]
    assert_equal(klass["name"], "Foo")

    method = klass["method"]
    assert_equal(method[0]["selector"], "enumerateObjectsUsingBlock:")

    arg = method[0]["arg"]
    assert_equal(arg[0]["function_pointer"], "true")

    blocks_arg = arg[0]["arg"]
    assert_equal(blocks_arg[0]["type"], "@")
  end

end