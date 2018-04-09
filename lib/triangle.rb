class Triangle
  attr_accessor :a, :b, :c, :kind

  def initialize(a,b,c)
    @a = a 
    @b = b
    @c = c
    #matrix = Matrix[a,b,c],[b,c,a],[c,a,b]?
  end
  
  def kind
    if is_not_a_triangle?
      begin
        raise TriangleError
      end

    elsif a == b && b == c
      kind = :equilateral
    elsif a == b || b == c || c == a
      kind = :isosceles
    elsif a != b && b != c
      kind = :scalene
    end
  end
  
  def is_not_a_triangle?
    if a <= 0 || b <= 0 || c <= 0
      true
    elsif a + b <= c || b + c <= a || c + a <= b
      true
    else
      false
    end
  end

  class TriangleError < StandardError
  end
end
