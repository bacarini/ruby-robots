class OperationCode::Place < OperationCode::Base
  def execute
    set_robot if applicable?
  end

  private

  def set_robot
    raise ArgumentError if x.nil? || y.nil? || f.nil?
    @robot.x = x.to_i
    @robot.y = y.to_i
    @robot.facing = Robot::COMPASS_POINTS[f]
  end

  private

  def applicable?
    cmd == 'PLACE'
  end
end
