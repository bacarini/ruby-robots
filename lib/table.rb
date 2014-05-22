class Table
  attr_accessor :height, :width

  def initialize(height = 5, width = 5)
    self.height = height
    self.width  = width
  end

  def in_boundary?(x, y)
    x > self.width || x < 0 || y > self.height || y < 0
  end
end
