require "spec_helper"

describe OperationCode::South do
  let(:robot) { Robot.new(Table.new) }

  describe "#execute" do
    context "when command is to move" do
      let(:south) { OperationCode::South.new(["MOVE"], robot) }

      context "facing to south" do
        before { robot.facing = 270 }

        it "calls method to move robot to south" do
          Robot.any_instance.should_receive(:to_south)
          south.execute
        end
      end

      context "does not facing to south" do
        before { robot.facing = 0 }

        it "should not calls method to move robot to south" do
          Robot.any_instance.should_not_receive(:to_south)
          south.execute
        end
      end
    end

    context "when command is not move" do
      let(:south) { OperationCode::South.new(["LEFT"], robot) }
      before { robot.facing = 270 }

      it "should not calls method to move robot to south" do
        Robot.any_instance.should_not_receive(:to_south)
        south.execute
      end
    end
  end
end
