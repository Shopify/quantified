require "minitest/autorun"
require "active_support"
require "pry"

ActiveSupport.test_order = :random

require 'quantified'

class ActiveSupport::TestCase
  EPSILON = 0.00001

  def assert_in_epsilon(expected, actual, msg = nil)
    assert_in_delta expected, actual, EPSILON, msg
  end
end
