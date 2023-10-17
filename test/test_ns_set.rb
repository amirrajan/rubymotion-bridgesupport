require "minitest/unit"
require "minitest/autorun"
require "./helper"

class TestNSSet < MiniTest::Unit::TestCase
  def setup
    @bs = gen_bridge_metadata("ns_set.h")
  end

  def test_works
    pp @bs
  end
end
