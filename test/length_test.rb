require 'test_helper'

class LengthTest < ActiveSupport::TestCase
  include Quantified
  Length.numeric_methods :metres, :centimetres, :inches, :feet

  setup do
    @length = Length.new(5, :feet)
  end

  test "#inspect" do
    assert_equal "#<Quantified::Length: 5 feet>", @length.inspect
  end

  test "#to_s" do
    assert_equal "5 feet", @length.to_s
  end

  test "initialize from numeric" do
    assert_equal "5 feet", 5.feet.to_s
  end

  test "equalities" do
    assert_equal 1.feet, (1.0).feet
    # == based on value
    assert_equal 6.feet, Length.new(2, :yards)
    # eql? based on value and unit
    assert !6.feet.eql?(Length.new(2, :yards))
    # equal? based on object identity
    assert !2.feet.equal?(2.feet)
  end

  test "convert mm to inches" do
    assert_equal 12, Length.new(304.8, :millimetres).to_inches
  end

  test "convert yards to feet" do
    assert 6.feet.eql?(Length.new(2, :yards).to_feet)
  end

  test "convert feet to yards" do
    assert Length.new(2, :yards).eql?(6.feet.to_yards)
  end

  test "convert yards to millimetres" do
    assert_in_epsilon Length.new(914.4, :millimetres).to_f, Length.new(1, :yards).to_millimetres.to_f
  end

  test "convert millimetres to yards" do
    assert_in_epsilon Length.new(1, :yards).to_f, Length.new(914.4, :millimetres).to_yards.to_f
  end

  test "convert metres to inches" do
    assert_in_epsilon 1.inches.to_f, (0.0254).metres.to_inches.to_f
  end

  test "comparison with numeric" do
    assert 2.feet > 1
    assert 2.feet == 2
    assert 2.feet <= 2
    assert 2.feet < 3
  end

  test "#method_missing to_i" do
    assert_equal 2, (2.4).feet.to_i
  end

  test "#method_missing to_f" do
    assert_equal 2.4, (2.4).feet.to_f
  end

  test "#method_missing minus" do
    assert_equal 2.feet, 5.feet - 3.feet
  end

  test "#numeric_methods not added for some units" do
    assert_raises(NoMethodError) do
      2.yards
    end
    assert_raises(NoMethodError) do
      2.millimetres
    end
  end

  test "unit systems" do
    assert_equal [:metric, :imperial], Length.systems
    assert_equal [:metres, :centimetres, :millimetres, :kilometres], Length.units(:metric)
    assert_equal [:inches, :feet, :yards, :miles], Length.units(:imperial)

    assert_equal :metric, 2.centimetres.system
    assert_equal :imperial, 2.feet.system
  end
end
