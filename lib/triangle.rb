require 'pry'
class Triangle
  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def side_array
    [@side1, @side2, @side3]
  end

  def uniq_count
    side_array.uniq.count
  end

  def inequality?
    truth_array = []
    side_array.each_with_index do |num, index|
      item = (side_array.inject(:+) - side_array[index]) > num
      truth_array << item
    end
    truth_array
  end

  def kind
    # binding.pry
    if side_array.any?{|item|item <= 0} || inequality?.include?(false)
      raise TriangleError
    elsif uniq_count == 1
      return :equilateral
    elsif uniq_count == 2
      return :isosceles
    elsif uniq_count == 3
      return :scalene
    end
  end

  class TriangleError < StandardError
    def not_valid
      "Each side must be larger than 0!"
    end
  end

end
