require 'spec_helper'

describe TalksController do
  it "displays an error for a missing talk" do
    get :show, :id => "not-here"
    response.should redirect_to(talks_path)
    flash[:alert].should == "The talk you were looking for could not be found."
  end
end
