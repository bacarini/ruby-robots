class OperationCode::North < OperationCode::Base
  def execute
    @robot.to_north if applicable?
  end

  private

  def applicable?
    cmd == 'MOVE' && @robot.facing == Robot::COMPASS_POINTS['NORTH']
  end
end
