require 'spec_helper'

describe Instrument do
  it { should validate_presence_of(:name) }

  context "an instrument exists" do
    before { Factory(:instrument) }

    it { should validate_uniqueness_of(:name) }
  end

  describe "#name=" do
    let(:instrument) { Instrument.new }

    it "downcases the assigned value" do
      instrument.name = 'Uppercase Words'
      instrument.name.should == 'uppercase words'
    end
  end
end
