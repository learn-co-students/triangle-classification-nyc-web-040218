class Triangle

  attr_reader :side1, :side2, :side3, :sides

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @sides = [@side1, @side2, @side3].sort
  end

  def kind
    errors
    if side1 == side2 && side2 == side3
      :equilateral
    elsif side1 == side2 || side2 == side3 || side3 == side1
      :isosceles
    else
      :scalene
    end
  end

  def errors
    raise TriangleError if sides.any? {|side| side <= 0} || sides[0] + sides[1] <= sides[2]
    # raise TriangleError if sides[0] + sides[1] <= sides[2]
  end


  class TriangleError < StandardError

  end

end
