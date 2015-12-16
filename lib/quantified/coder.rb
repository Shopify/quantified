module Quantified
  class Coder
    attr_reader :attribute, :unit

    def initialize(attribute, unit)
      @attribute = attribute
      @unit = unit
    end

    def load(amount)
      attribute.new(amount, unit) unless amount.nil?
    end

    def dump(quantity)
      if quantity.is_a?(attribute)
        quantity.send("to_#{unit}")
      else
        quantity
      end
    end
  end
end
