require "spec_helper"

describe Table do
  describe "#in_boundary?" do
    it { expect(Table.new.in_boundary?(5,5)).to be_true }
    it { expect(Table.new.in_boundary?(0,0)).to be_true }
    it { expect(Table.new.in_boundary?(1,2)).to be_false }
    it { expect(Table.new.in_boundary?(3,4)).to be_false }
  end

  describe "#right_bottom?" do
    it { expect(Table.new.right_bottom?(5,0)).to be_true }
    it { expect(Table.new.right_bottom?(0,0)).to be_false }
    it { expect(Table.new.right_bottom?(0,5)).to be_false }
  end

  describe "#left_bottom?" do
    it { expect(Table.new.left_bottom?(0,0)).to be_true }
    it { expect(Table.new.left_bottom?(0,5)).to be_false }
    it { expect(Table.new.left_bottom?(4,4)).to be_false }
  end

  describe "#left_top?" do
    it { expect(Table.new.left_top?(0,5)).to be_true }
    it { expect(Table.new.left_top?(5,5)).to be_false }
    it { expect(Table.new.left_top?(5,0)).to be_false }
  end

  describe "#right_top?" do
    it { expect(Table.new.right_top?(5,5)).to be_true }
    it { expect(Table.new.right_top?(0,5)).to be_false }
    it { expect(Table.new.right_top?(5,0)).to be_false }
  end
end
