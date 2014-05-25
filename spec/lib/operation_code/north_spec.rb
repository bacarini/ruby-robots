require "spec_helper"

describe OperationCode::North do
  let(:robot) { Robot.new(Table.new) }

  describe "#execute" do
    context "when command is to move" do
      let(:north) { OperationCode::North.new(["MOVE"], robot) }

      context "facing to north" do
        before { robot.facing = 90 }

        it "calls method to move robot to north" do
          Robot.any_instance.should_receive(:to_north)
          north.execute
        end
      end

      context "does not facing to north" do
        before { robot.facing = 0 }

        it "should not calls method to move robot to north" do
          Robot.any_instance.should_not_receive(:to_north)
          north.execute
        end
      end
    end

    context "when command is not move" do
      let(:north) { OperationCode::North.new(["LEFT"], robot) }
      before { robot.facing = 90 }

      it "should not calls method to move robot to north" do
        Robot.any_instance.should_not_receive(:to_north)
        north.execute
      end
    end
  end
end
