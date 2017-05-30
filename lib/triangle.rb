class Triangle

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
  end

  def kind()
    self.validate()

    if (@sides[0] == @sides[1] && @sides[0] == @sides[2])
      return :equilateral
    elsif (@sides[0] == @sides[1] || @sides[0] == @sides[2] || @sides[1] == @sides[2])
      return :isosceles
    else
      return :scalene
    end
  end

  def validate()
    @sides.each{|side| raise TriangleError if side <= 0}
    if (@sides[0] + @sides[1] <=  @sides[2] ||
        @sides[0] + @sides[2] <=  @sides[1] ||
        @sides[1] + @sides[2] <=  @sides[0])
      raise TriangleError
    end
  end
end

class TriangleError < StandardError
  def message
    "Invalid Triangle parameters have been submitted!"
  end
end
