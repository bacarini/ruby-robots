class OperationCode::Left < OperationCode::Base
  def execute
    @robot.lrotate  if applicable?
  end

  private

  def applicable?
    cmd == 'LEFT'
  end
end
