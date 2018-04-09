class Triangle
  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    arr = [@side1, @side2, @side3]

    if any_sides_too_short?(arr)
      raise TriangleError
    elsif violates_triangle_inequality?
      raise TriangleError
    elsif all_sides_equal?(arr)
      :equilateral
    elsif no_equal_sides?(arr)
      :scalene
    elsif atleast_two_equal_sides?
      :isosceles
    end
  end

  def any_sides_too_short?(arr)
    arr.any? { |num| num <= 0 }
  end

  def violates_triangle_inequality?
    @side1 >= @side2 + @side3 || @side2 >= @side1 + @side3 || @side3 >= @side1 + @side2
  end

  def all_sides_equal?(arr)
    arr.uniq.length == 1
  end

  def no_equal_sides?(arr)
    arr.uniq.length == 3
  end

  def atleast_two_equal_sides?
    @side1 == @side2 || @side1 == @side3 || @side2 == @side3
  end

  class TriangleError < StandardError
  end
end
