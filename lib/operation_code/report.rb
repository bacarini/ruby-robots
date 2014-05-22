class OperationCode::Report < OperationCode::Base
  def execute
    puts "#{@robot.x}, #{@robot.y}, #{Robot::COMPASS_POINTS.select{|k,v| v == @robot.facing}.keys.first}"  if applicable?
  end

  private

  def applicable?
    cmd == 'REPORT'
  end
end
