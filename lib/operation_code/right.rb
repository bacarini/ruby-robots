class OperationCode::Right < OperationCode::Base
  def execute
    @robot.rrotate  if applicable?
  end

  private

  def applicable?
    cmd == 'RIGHT'
  end
end
