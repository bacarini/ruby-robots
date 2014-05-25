require "spec_helper"

describe OperationCode::Report do
  let(:robot) { Robot.new(Table.new) }

  describe "#execute" do
    context "when command is to report" do
      let(:report) { OperationCode::Report.new(["REPORT"], robot) }

      it "calls method to report where the robot is" do
        OperationCode::Report.any_instance.should_receive(:show)
        report.execute
      end
    end

    context "when command is not to report" do
      let(:report) { OperationCode::Report.new(["MOVE"], robot) }

      it "should not calls method to report where the robot is" do
        OperationCode::Report.any_instance.should_not_receive(:show)
        report.execute
      end
    end
  end
end
