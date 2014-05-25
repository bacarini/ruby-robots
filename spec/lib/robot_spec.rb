require "spec_helper"
require "pry"

describe Robot do
  let(:robot) { robot = Robot.new(Table.new) }

  describe "#to_north" do
    context "roaming around" do
      before do
        Robot.any_instance.stub(:not_allowed?).and_return(false)
        robot.to_north
      end

      it { expect(robot.y).to eq 1 }
      it { expect(robot.y).not_to eq 0 }
    end

    context "not allowed to roam around" do
      before do
        Robot.any_instance.stub(:not_allowed?).and_return(true)
        robot.to_north
      end

      it { expect(robot.y).to eq 0 }
      it { expect(robot.y).not_to eq 1 }
    end
  end

  describe "#to_south" do
    context "roaming around" do
      before do
        Robot.any_instance.stub(:not_allowed?).and_return(false)
        robot.y = 2
        robot.to_south
      end

      it { expect(robot.y).to eq 1 }
      it { expect(robot.y).not_to eq 0 }
    end

    context "not allowed to roam around" do
      before do
        Robot.any_instance.stub(:not_allowed?).and_return(true)
        robot.y = 2
        robot.to_south
      end

      it { expect(robot.y).to eq 2 }
      it { expect(robot.y).not_to eq 1 }
    end
  end

  describe "#to_east" do
    context "roaming around" do
      before do
        Robot.any_instance.stub(:not_allowed?).and_return(false)
        robot.to_east
      end

      it { expect(robot.x).to eq 1 }
      it { expect(robot.x).not_to eq 0 }
    end

    context "not allowed to roam around" do
      before do
        Robot.any_instance.stub(:not_allowed?).and_return(true)
        robot.to_east
      end

      it { expect(robot.x).to eq 0 }
      it { expect(robot.x).not_to eq 1 }
    end
  end

  describe "#to_west" do
    context "roaming around" do
      before do
        Robot.any_instance.stub(:not_allowed?).and_return(false)
        robot.x = 2
        robot.to_west
      end

      it { expect(robot.x).to eq 1 }
      it { expect(robot.x).not_to eq 2 }
    end

    context "not allowed to roam around" do
      before do
        Robot.any_instance.stub(:not_allowed?).and_return(true)
        robot.x = 2
        robot.to_west
      end

      it { expect(robot.x).to eq 2 }
      it { expect(robot.x).not_to eq 1 }
    end
  end

  describe "#lrotate" do
    before do
      robot.facing = 90
      robot.lrotate
    end

    it { expect(robot.facing).to eq 180 }
    it { expect(robot.facing).not_to eq 0 }
  end

  describe "#rrotate" do
    before do
      robot.facing = 90
      robot.rrotate
    end

    it { expect(robot.facing).to eq 0 }
    it { expect(robot.facing).not_to eq 180 }
  end
end
