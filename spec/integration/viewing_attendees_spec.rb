require 'spec_helper'

feature "Viewing Attendees" do
  scenario "Listing all attendees" do
    attendee = Factory.create(:attendee, :name => "Test Attendee")
    visit '/'
    click_link "See all attendees"
    click_link "Test Attendee"
    page.current_url.should == attendee_url(attendee)
  end
end

