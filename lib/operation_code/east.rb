class OperationCode::East < OperationCode::Base
  def execute
    @robot.to_east if applicable?
  end

  private

  def applicable?
    cmd == 'MOVE' && @robot.facing == Robot::COMPASS_POINTS['EAST']
  end
end
