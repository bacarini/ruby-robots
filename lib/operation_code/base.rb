module OperationCode
  DIRECTIONS = []

  def self.exec(args, robot)
    DIRECTIONS.each do |child|
      child.new(args, robot).execute
    end
  end

  class Base
    attr_accessor :cmd, :x, :y, :f
    def initialize(args, robot)
      self.cmd, self.x, self.y, self.f = args
      cmd.upcase
      @robot = robot
    end

    def self.inherited(child)
      OperationCode::DIRECTIONS << child
    end
  end
end
