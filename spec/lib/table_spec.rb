require "spec_helper"

describe Table do
  describe "#in_boundary?" do
    it { expect(Table.new.in_boundary?(5,5)).to be_true }
    it { expect(Table.new.in_boundary?(0,0)).to be_true }
    it { expect(Table.new.in_boundary?(1,2)).to be_false }
    it { expect(Table.new.in_boundary?(3,4)).to be_false }
  end
end
