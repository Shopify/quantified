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
      conversion = "to_#{unit}"
      if quantity.respond_to?(conversion)
        quantity.send(conversion)
      else
        quantity
      end
    end
  end
end
