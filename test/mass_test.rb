require 'test_helper'

class MassTest < ActiveSupport::TestCase
  include Quantified
  Mass.numeric_methods :grams, :kilograms, :ounces, :pounds

  setup do
    @mass = Mass.new(5, :pounds)
  end

  test "#inspect" do
    assert_equal "#<Quantified::Mass: 5 pounds>", @mass.inspect
  end

  test "#to_s" do
    assert_equal "5 pounds", @mass.to_s
  end

  test "#initialize from numeric" do
    assert_equal "5 pounds", 5.pounds.to_s
  end

  test "equalities" do
    assert_equal 1.pounds, (1.0).pounds
    # == based on value
    assert_equal 4000.pounds, Mass.new(2, :short_tons)
    # eql? based on value and unit
    assert !4000.pounds.eql?(Mass.new(2, :short_tons))
    # equal? based on object identity
    assert !2.pounds.equal?(2.pounds)
  end

  test "convert short tons to pounds" do
    assert 4000.pounds.eql?(Mass.new(2, :short_tons).to_pounds)
  end

  test "convert pounds to short tons" do
    assert Mass.new(2, :short_tons).eql?(4000.pounds.to_short_tons)
  end

  test "convert_short_tons_to_milligrams" do
    assert Mass.new(907_184_740, :milligrams).eql?(Mass.new(1, :short_tons).to_milligrams)
  end

  test "convert milligrams to short tons" do
    assert Mass.new(1, :short_tons).eql?(Mass.new(907_184_740, :milligrams).to_short_tons)
  end

  test "convert_grams_to_ounces" do
    assert 1.ounces.eql?((28.349523125).grams.to_ounces)
    assert 1.ounces.eql?((28.349523125).grams.in_ounces)
  end

  test "comparison with numeric" do
    assert 2.pounds > 1
    assert 2.pounds == 2
    assert 2.pounds <= 2
    assert 2.pounds < 3
  end

  test "#method_missing to_i" do
    assert_equal 2, (2.4).pounds.to_i
  end

  test "#method_missing to_f" do
    assert_equal 2.4, (2.4).pounds.to_f
  end

  test "#method_missing minus" do
    assert_equal 2.pounds, 5.pounds - 3.pounds
  end

  test "numeric methods not added for some units" do
    assert_raises NoMethodError do
      2.short_tons
    end
    assert_raises NoMethodError do
      2.milligrams
    end
  end

  test "unit systems" do
    assert_equal [:metric, :imperial], Mass.systems
    assert_equal [:grams, :milligrams, :kilograms], Mass.units(:metric)
    assert_equal [:ounces, :pounds, :stones, :short_tons], Mass.units(:imperial)
  end

  test "right side comparison with fixnum" do
    assert Mass.new(14, :grams) < 20
  end

  test "left side comparison with fixnum" do
    assert 20 > Mass.new(14, :grams)
  end
end
