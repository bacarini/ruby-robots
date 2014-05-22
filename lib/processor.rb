class Processor
  def initialize(robot)
    @robot = robot
  end

  def process(command)
    opcode = OperationCode::Base.new parse(command)
    opcode.execute
  end

  private

  def parse(command)
    command, x, y, f = command.split(/[\s\,]/)
  end
end
