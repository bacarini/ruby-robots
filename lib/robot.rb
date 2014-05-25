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

  def valid_place?(x,y,f)
    @table.valid?(x,y) && !COMPASS_POINTS[f].nil?
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
    if (north? || east?) && @table.left_bottom?(x,y)
      return false
    elsif (west? || south?) && @table.right_top?(x,y)
      return false
    elsif !north? && x > 0 && x < @table.width && y == @table.height
      return false
    elsif !south? && y > 0 && y < @table.height && x == @table.width
      return false
    elsif (east? || south?) && @table.right_bottom?(x,y)
      return false
    elsif (north? || west?) && @table.left_top?(x,y)
      return false
    else
      @table.in_boundary?(x, y)
    end
  end

  def north?
    facing == 90
  end

  def south?
    facing == 270
  end

  def west?
    facing == 180
  end

  def east?
    facing == 0
  end
end
