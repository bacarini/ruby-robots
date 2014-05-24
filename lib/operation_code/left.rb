class OperationCode::Left < OperationCode::Base
  def execute
    @robot.lrotate if applicable?
  end

  private

  def applicable?
    cmd == 'LEFT' && !@robot.facing.nil?
  end
end
