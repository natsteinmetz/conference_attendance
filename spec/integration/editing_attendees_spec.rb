require 'spec_helper'

feature "Editing Attendees" do

  before do
    Factory(:attendee, :name => "Test Attendee")
    visit '/'
    click_link "See all attendees"
    click_link "Test Attendee"
    click_link "Edit Attendee"
  end

  scenario "Updating an attendee" do
    fill_in "Name", :with => "Test Attendee beta"
    click_button "Update Attendee"
    page.should have_content("Attendee has been updated.")
  end

  scenario "Updating an attendee with invalid attributes is bad" do
    fill_in "Name", :with => ""
    click_button "Update Attendee"
    page.should have_content("Attendee has not been updated.")
  end

end

