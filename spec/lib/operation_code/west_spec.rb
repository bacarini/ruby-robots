require "spec_helper"

describe OperationCode::West do
  let(:robot) { Robot.new(Table.new) }

  describe "#execute" do
    context "when command is to move" do
      let(:west) { OperationCode::West.new(["MOVE"], robot) }

      context "facing to west" do
        before { robot.facing = 180 }

        it "calls method to move robot to west" do
          Robot.any_instance.should_receive(:to_west)
          west.execute
        end
      end

      context "does not facing to west" do
        before { robot.facing = 90 }

        it "should not calls method to move robot to west" do
          Robot.any_instance.should_not_receive(:to_west)
          west.execute
        end
      end
    end

    context "when command is not move" do
      let(:west) { OperationCode::West.new(["LEFT"], robot) }
      before { robot.facing = 180 }

      it "should not calls method to move robot to west" do
        Robot.any_instance.should_not_receive(:to_west)
        west.execute
      end
    end
  end
end
