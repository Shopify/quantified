require 'test/unit'
# require 'active_support/inflector'

require 'quantified'

class Test::Unit::TestCase
  EPSILON = 0.00001

  def assert_in_epsilon(expected, actual, msg = nil)
    assert_in_delta expected, actual, EPSILON, msg
  end
end
