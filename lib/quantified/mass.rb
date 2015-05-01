module Quantified
  class Mass < Attribute
    system :metric do
      primitive :gram
      one :g, :plural => :g, :is => Mass.new(1, :grams)

      one :milligram, :is => Mass.new(0.001, :grams)
      one :mg, :plural => :mg, :is => Mass.new(0.001, :grams)

      one :carat, :is => Mass.new(0.2, :grams)
      one :ct, :plural => :ct, :is => Mass.new(0.2, :grams)

      one :kilogram, :is => Mass.new(1000, :grams)
      one :kg, :plural => :kg, :is => Mass.new(1000, :grams)
    end

    system :imperial do
      primitive :ounce
      one :ounce, :is => Mass.new(28.349523125, :grams)
      one :oz, :plural => :oz, :is => Mass.new(28.349523125, :grams)

      one :pound, :is => Mass.new(16, :ounces)
      one :lb, :plural => :lb, :is => Mass.new(16, :ounces)

      one :stone, :is => Mass.new(14, :pounds)
      one :st, :plural => :st, :is => Mass.new(14, :pounds)

      one :short_ton, :is => Mass.new(2000, :pounds)
    end
  end
end
