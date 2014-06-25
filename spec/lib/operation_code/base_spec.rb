require "spec_helper"

describe OperationCode do
  let(:args) { ["PLACE", "0", "0", "NORTH"] }

  describe ".exec" do
    before { @robot = Robot.new(Table.new) }

    context "when command is place" do
      it "calls operation code children to execute command" do
        OperationCode::Place.any_instance.should_receive(:execute)

        OperationCode.exec(args, @robot)
      end
    end

    context "when robot has not been placed and command is not place" do
      it "does not execute command" do
        OperationCode::DIRECTIONS.each do |child|
          child.any_instance.should_not_receive(:execute)
        end

        OperationCode.exec(["MOVE"], @robot)
      end
    end
  end
end
