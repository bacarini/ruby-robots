class Robot
  attr_accessor :x, :y, :facing

  COMPASS_POINTS = {
    'EAST' => 0,
    'NORTH'=> 90,
    'WEST'=> 180,
    'SOUTH' => 270
  }

  def initialize(table, x = 0, y = 0)
    self.x = x
    self.y = y
    @processor = Processor.new(self)
    @table = table
  end

  def execute(string_code)
    @processor.process string_code
  end

  def to_north
    self.y = y.to_i + 1
  end

  def to_south
    self.y = y.to_i - 1
  end

  def to_east
    self.x = x.to_i + 1
  end

  def to_west
    self.x = x.to_i - 1
  end

  def lrotate
    self.facing = (facing + 90) % 360
  end

  def rrotate
    self.facing = (facing - 90) % 360
  end
end
