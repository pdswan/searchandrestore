require 'spec_helper'

describe User do
  describe "#has_role?" do
    let(:user) { User.new }

    context "user has no roles" do
      it "returns false" do
        user.has_role?(:anything).should be_false
      end
    end

    context "user has role" do
      it "returns true" do
        user.roles = [:admin]
        user.has_role?(:admin).should be_true
      end

      it "returns false" do
        user.roles = [:other]
        user.has_role?(:admin).should be_false
      end
    end
  end
end
