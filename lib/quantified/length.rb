module Quantified
  class Length < Attribute
    system :metric do
      primitive :metre
      one :meter, :is => Length.new(1, :metres)
      one :m, :plural => :m, :is => Length.new(1, :metres)

      one :centimetre, :is => Length.new(0.01, :metres)
      one :centimeter, :is => Length.new(0.01, :metres)
      one :cm, :plural => :cm, :is => Length.new(0.01, :metres)

      one :millimetre, :is => Length.new(0.1, :centimetres)
      one :millimeter, :is => Length.new(0.1, :centimetres)
      one :mm, :plural => :mm, :is => Length.new(0.1, :centimetres)

      one :kilometre, :is => Length.new(1000, :metres)
      one :kilometer, :is => Length.new(1000, :metres)
      one :km, :plural => :km, :is => Length.new(1000, :metres)
    end

    system :imperial do
      primitive :inch

      one :inch, :is => Length.new(0.0254, :metres)
      one :in, :plural => :in, :is => Length.new(0.0254, :metres)

      one :foot, :plural => :feet, :is => Length.new(12, :inches)
      one :ft, :plural => :ft, :is => Length.new(12, :inches)

      one :yard, :is => Length.new(3, :feet)
      one :yd, :plural => :yd, :is => Length.new(3, :feet)

      one :mile, :is => Length.new(5280, :feet)
    end
  end
end
