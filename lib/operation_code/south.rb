class OperationCode::South < OperationCode::Base
  def execute
    @robot.to_south  if applicable?
  end

  private

  def applicable?
    cmd == 'MOVE' && @robot.facing == Robot::COMPASS_POINTS['SOUTH']
  end
end
