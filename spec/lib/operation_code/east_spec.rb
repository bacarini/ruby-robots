require "spec_helper"

describe OperationCode::East do
  let(:robot) { Robot.new(Table.new) }

  describe "#execute" do
    context "when command is to move" do
      let(:east) { OperationCode::East.new(["MOVE"], robot) }

      context "facing to east" do
        before { robot.facing = 0 }

        it "calls method to move robot to east" do
          Robot.any_instance.should_receive(:to_east)
          east.execute
        end
      end

      context "does not facing to east" do
        before { robot.facing = 90 }

        it "should not calls method to move robot to east" do
          Robot.any_instance.should_not_receive(:to_east)
          east.execute
        end
      end
    end

    context "when command is not move" do
      let(:east) { OperationCode::East.new(["LEFT"], robot) }
      before { robot.facing = 0 }

      it "should not calls method to move robot to east" do
        Robot.any_instance.should_not_receive(:to_east)
        east.execute
      end
    end
  end
end
