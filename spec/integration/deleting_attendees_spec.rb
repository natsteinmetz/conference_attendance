require 'spec_helper'

feature "Deleting attendees" do
  scenario "Deleting an attendee" do
    Factory(:attendee, :name => "My Test Attendee")
    visit '/'
    click_link "See all attendees"
    click_link "My Test Attendee"
    click_link "Delete Attendee"
    page.should have_content("Attendee has been deleted.")

    visit '/'
    page.should_not have_content("My Test Attendee")
  end
end

