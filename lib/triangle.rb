class Triangle
  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1.to_f
    @side2 = side2.to_f
    @side3 = side3.to_f
  end

  def kind
    if (side1 + side2 <= side3) || (side1 + side3 <= side2) || (side2 + side3 <= side1)
      raise TriangleError
    elsif side1 == side2 && side2 == side3
      :equilateral
    elsif side1 == side2 || side1 == side3 || side2 == side3
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
  end
end
