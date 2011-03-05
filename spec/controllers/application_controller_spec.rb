require 'spec_helper'

describe ApplicationController do
  controller do
    def index
      raise CanCan::AccessDenied, "you don't have permission to something or other"
    end
  end

  describe "handling CanCan::AccessDenied exception" do
    it "sets flash[:alert]" do
      get :index
      flash[:alert].should == "you don't have permission to something or other"
    end

    context "there is a signed in user" do
      before do
        controller.stub(:anybody_signed_in?).and_return(true)
      end

      it "redirects to the homepage" do
        get :index
        response.should redirect_to('/')
      end
    end

    context "there is no signed in user" do
      it "redirects to the sign in page" do
        get :index
        response.should redirect_to('/users/sign_in')
      end
    end
  end
end
