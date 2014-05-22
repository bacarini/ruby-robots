module OperationCode
  DIRECTIONS = []

  class Base
    attr_accessor :cmd, :x, :y, :f
    def initialize(args)
      self.cmd, self.x, self.y, self.f = args
    end

    def self.inherited(child)
      OperationCode::DIRECTIONS << child
    end

    def execute
      puts x
    end
  end

  class West < Base
  end
  class North < Base
  end
  class South < Base
  end
  class East < Base
  end
  class Left < Base
  end
  class Right < Base
  end
  class Rerport< Base
  end
end
