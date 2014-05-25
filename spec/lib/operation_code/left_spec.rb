require "spec_helper"

describe OperationCode::Left do
  let(:robot) { Robot.new(Table.new) }

  describe "#execute" do
    context "when command is to turn left" do
      let(:left) { OperationCode::Left.new(["LEFT"], robot) }

      it "calls method to turn left robot to east" do
        Robot.any_instance.should_receive(:lrotate)
        robot.facing = 0
        left.execute
      end
    end

    context "when command is not to turn left" do
      let(:left) { OperationCode::Left.new(["MOVE"], robot) }

      it "should not calls method to turn the robot left robot" do
        Robot.any_instance.should_not_receive(:lrotate)
        left.execute
      end
    end
  end
end
