require "spec_helper"

describe OperationCode::Right do
  let(:robot) { Robot.new(Table.new) }

  describe "#execute" do
    context "when command is to turn right" do
      let(:right) { OperationCode::Right.new(["RIGHT"], robot) }

      it "calls method to turn right robot to east" do
        Robot.any_instance.should_receive(:rrotate)
        robot.facing = 0
        right.execute
      end
    end

    context "when command is not to turn right" do
      let(:right) { OperationCode::Right.new(["MOVE"], robot) }

      it "should not calls method to turn the robot right robot" do
        Robot.any_instance.should_not_receive(:rrotate)
        right.execute
      end
    end
  end
end
