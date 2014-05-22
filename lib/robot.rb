class Robot
  attr_accessor :x, :y

  def initialize(x = 0, y = 0)
    self.x = x
    self.y = y
    @processor = Processor.new(self)
  end

  def execute(string_code)
    @processor.process string_code
  end

  def to_north
    y += 1
  end

  def to_south
    y -= 1
  end

  def to_east
    x += 1
  end

  def to_west
    x -= 1
  end
end
