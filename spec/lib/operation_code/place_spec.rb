require "spec_helper"

describe OperationCode::Place do
  let(:robot) { Robot.new(Table.new) }

  describe "#execute" do
    context "when command is place" do
      context "raising an error" do
        it "should returns an error because nil parameters" do
          place = OperationCode::Place.new(["PLACE"], robot)
          expect { place.execute }.to raise_error ArgumentError
        end

        it "should returns an error because invalid parameters" do
          place = OperationCode::Place.new(%w(PLACE 99 99 NORTH), robot)
          expect { place.execute }.to raise_error ArgumentError
        end
      end

      context "setting attributes valid into robot" do
        let(:place) { OperationCode::Place.new(%w(PLACE 4 3 NORTH), robot) }
        it "calls method to set attributes into robot" do
          place.execute
          expect(robot.x).to eq 4
          expect(robot.y).to eq 3
          expect(robot.facing).to eq 90
        end
      end
    end

    context "when command is not to place" do
      let(:place) { OperationCode::Place.new(["MOVE"], robot) }

      it "should not calls method to set attributes into robot" do
        OperationCode::Place.any_instance.should_not_receive(:set_robot)
        place.execute
      end
    end
  end
end
