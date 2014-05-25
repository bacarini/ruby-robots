class OperationCode::Place < OperationCode::Base
  def execute
    set_robot if applicable?
  end

  private

  def set_robot
    raise ArgumentError if invalid?
    @robot.x = x.to_i
    @robot.y = y.to_i
    @robot.facing = Robot::COMPASS_POINTS[f]
  end

  def applicable?
    cmd == 'PLACE'
  end

  def invalid?
    x.nil? || y.nil? || f.nil? || !@robot.valid_place?(x.to_i, y.to_i)
  end
end
