require 'test_helper'
require 'quantified'

class CoderTest < Test::Unit::TestCase
  include Quantified

  def setup
    @coder = Coder.new(Length, :meters)
  end

  def test_load_nil
    assert @coder.load(nil).nil?
  end

  def test_load_numeric
    assert_equal @coder.load(5), Length.new(5, :meters)
  end

  def test_dump_nil
    assert @coder.dump(nil).nil?
  end

  def test_dump_conversion
    assert_equal @coder.dump(Length.new(500, :centimeters)), 5
  end
end
