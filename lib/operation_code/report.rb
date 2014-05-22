class OperationCode::Report < OperationCode::Base
  def execute
    show if applicable?
  end

  private

  def applicable?
    cmd == 'REPORT'
  end

  def show
    puts "#{@robot.x}, #{@robot.y}, #{Robot::COMPASS_POINTS.select{|k,v| v == @robot.facing}.keys.first}"
  end
end
