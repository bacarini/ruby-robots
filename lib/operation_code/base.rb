module OperationCode
  DIRECTIONS = []

  def self.exec(args, robot)
    if robot.already_placed? || place?(args)
      DIRECTIONS.each do |child|
        child.new(args, robot).execute
      end
    else
      puts "I can't move if you don't place me first."
    end
  end

  def self.place?(args)
    args.first == 'PLACE'
  end

  class Base
    attr_accessor :cmd, :x, :y, :f
    def initialize(args, robot)
      self.cmd, self.x, self.y, self.f = args
      @robot = robot
    end

    def self.inherited(child)
      OperationCode::DIRECTIONS << child
    end
  end
end
