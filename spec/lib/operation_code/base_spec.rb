require "spec_helper"

describe OperationCode do
  let(:args) { %w("PLACE 0 0 NORTH) }

  describe ".exec" do
    before { @robot = Robot.new(Table.new) }

    it "calls operation code children to execute command" do
      OperationCode::DIRECTIONS.each do |child|
        child.any_instance.should_receive(:execute)
      end

      OperationCode.exec(args, @robot)
    end
  end
end
