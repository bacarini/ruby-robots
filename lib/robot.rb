class Robot
  attr_accessor :x, :y, :facing

  COMPASS_POINTS = {
    'EAST' => 0,
    'NORTH'=> 90,
    'WEST'=> 180,
    'SOUTH' => 270
  }

  def initialize(table, x = 0, y = 0)
    self.x = x.to_i
    self.y = y.to_i
    @processor = Processor.new(self)
    @table = table
  end

  def execute(string_code)
    @processor.process string_code
  end

  def to_north
    self.y += 1 unless not_allowed?
  end

  def to_south
    self.y -= 1 unless not_allowed?
  end

  def to_east
    self.x += 1 unless not_allowed?
  end

  def to_west
    self.x -= 1 unless not_allowed?
  end

  def lrotate
    self.facing = (facing + 90) % 360
  end

  def rrotate
    self.facing = (facing - 90) % 360
  end

  private

  def not_allowed?
    if (facing == 90 || facing == 0) && x == 0 && y == 0
      return false
    elsif (facing == 180 || facing == 270) && x == 5 && y == 5
      return false
    elsif !(facing == 90) && x > 0 && x < 5 && y == 5
      return false
    elsif !(facing == 270) && y > 0 && y < 5 && x == 5
      return false
    elsif (facing == 0 || facing == 270) && x == 5 && y == 0
      return false
    elsif (facing == 90 || facing == 180) && x == 0 && y == 5
      return false
    else
      @table.in_boundary?(x, y)
    end
  end
end
