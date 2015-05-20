#TODO: Rename to delivery_method_spec
require 'test_helper'

class CoreExtTest < ActiveSupport::TestCase
  def test_to_channel_works
    assert_equal( "Hello World!".to_channel, true)
  end
end
