class OperationCode::West < OperationCode::Base
  def execute
    @robot.to_west  if applicable?
  end

  private

  def applicable?
    cmd == 'MOVE' && @robot.facing == Robot::COMPASS_POINTS['WEST']
  end
end
