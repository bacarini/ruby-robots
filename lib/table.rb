class Table
  attr_accessor :height, :width

  def initialize(height = 5, width = 5)
    self.height = height
    self.width  = width
  end

  def in_boundary?(x, y)
    x >= self.width || x <= 0 || y >= self.height || y <= 0
  end

  def right_bottom?(x,y)
    x == self.width && y == 0
  end

  def left_bottom?(x,y)
    x == 0 && y == 0
  end

  def right_top?(x,y)
    x == self.height && y == self.height
  end

  def left_top?(x,y)
    x == 0 && y == self.height
  end
end
