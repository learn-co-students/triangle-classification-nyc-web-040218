require 'pry'

class Triangle

  attr_accessor :length1, :length2, :length3

  ALL = []

  def initialize(length1, length2, length3)
    @length1 = length1
    @length2 = length2
    @length3 = length3

    ALL << self
  end

  def self.all
    ALL
  end

  def kind
    if !(length1 > 0 && length2 > 0 && length3 > 0)
      raise TriangleError
    elsif length1 >= length2 + length3
      raise TriangleError
    elsif length2 >= length1 + length3
      raise TriangleError
    elsif length3 >= length1 + length2
      raise TriangleError
    elsif length1 == length2 && length1 == length3
      :equilateral
    elsif length1 == length2 || length1 == length3 || length2 == length3
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
    def message
      "THIS IS A BIG PROBLEM!"
    end
  end

end
