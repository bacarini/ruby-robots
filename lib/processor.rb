class Processor
  def initialize(robot)
    @robot = robot
  end

  def process(command)
    OperationCode.exec parse(command), @robot
  end

  private

  def parse(command)
    command, x, y, f = command.split(/[\s\,]/)
  end
end
