require 'spec_helper'

describe AttendeesController do
  it "displays an error for a missing attendee" do
    get :show, :id => "not-here"
    response.should redirect_to(attendees_path)
    flash[:alert].should == "The attendee you were looking for could not be found."
  end
end
