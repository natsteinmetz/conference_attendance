require 'spec_helper'

feature "Editing Locations" do

  before do
    Factory(:location, :name => "Test Location")
    visit '/'
    click_link "See all locations"
    click_link "Test Location"
    click_link "Edit Location"
  end

  scenario "Updating a location" do
    fill_in "Name", :with => "Test Location beta"
    click_button "Update Location"
    page.should have_content("Location has been updated.")
  end

  scenario "Updating a location with invalid attributes is bad" do
    fill_in "Name", :with => ""
    click_button "Update Location"
    page.should have_content("Location has not been updated.")
  end

end

