require 'spec_helper'

describe Show do
  it { should validate_presence_of(:venue) }
  it { should validate_presence_of(:group_name) }

   # it "does not allow duplicate shows" do
   #    Factory.create(:show,
   #      :group_name => "The Wild Bunch",
   #      :when => Time.now )
   #    Factory.build(:show,
   #      :group_name => "The Wild Bunch",
   #      :when => Time.now ).should_not be_valid
   # end


   describe "#when" do
    let(:show) { Show.new }

    context "the attribute has been set" do
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

  describe ".search_and_restore" do
    let!(:search_and_restore_show) { Factory(:search_and_restore_show) }
    let!(:show)                    { Factory(:show) }

    subject { Show.search_and_restore }

    it { should include(search_and_restore_show) }
    it { should_not include(show) }
  end

  describe ".upcoming" do
    let!(:upcoming_show) { Factory(:show, :when => 1.day.from_now) }
    let!(:past_show)     { Factory(:show, :when => 1.day.ago) }
    let!(:todays_show)   { Factory(:show, :when => 1.hour.from_now) }

    subject { Show.upcoming }

    it { should include(upcoming_show) }
    it { should_not include(past_show) }
    it { should include(todays_show) }
  end

  describe ".featured" do
    let!(:featured)     { Factory(:featured_show) }
    let!(:not_featured) { Factory(:show) }

    subject { Show.featured }

    it { should include(featured) }
    it { should_not include(not_featured) }

    context "false is passed" do
      subject { Show.featured(false) }

      it { should_not include(featured) }
      it { should include(not_featured) }
    end
  end
end
