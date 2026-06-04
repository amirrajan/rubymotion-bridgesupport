require "minitest/unit"
require "minitest/autorun"
require "./helper"

class TestUINavigationController < MiniTest::Test
  def setup
    @bs = gen_bridge_metadata("UINavigationController.h")
  end

  def test_init_functions
    ui_navigation_controller_class_exist = @bs["class"].find { |c| c["name"].include?("UINavigationController") }
    assert_equal(
      !!ui_navigation_controller_class_exist,
      true
    )
  end
end
