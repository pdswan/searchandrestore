require 'spec_helper'

describe Show do
  it { should validate_presence_of(:venue) }
  it { should validate_presence_of(:group_name) }
  it { should validate_presence_of(:description) }

  describe "#when" do
    let(:show) { Show.new }

    context "the attribute has not been set" do
      let(:when_value) { 2.days.ago }

      before do
        show.when = when_value
      end

      it "should return the value of the attribute" do
        show.when.should == when_value
      end
    end

    context "the attribute has not been set" do
      let(:now) { mock() }

      before do
        Time.zone.should_receive(:now).and_return(now)
      end

      it "should return the current time" do
        show.when.should == now
      end
    end
  end
end
