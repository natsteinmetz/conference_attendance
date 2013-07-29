require 'spec_helper'

feature "Deleting locations" do
  scenario "Deleting a location" do
    Factory(:location, :name => "My Test Location")
    visit '/'
    click_link "See all locations"
    click_link "My Test Location"
    click_link "Delete Location"
    page.should have_content("Location has been deleted.")

    visit '/'
    page.should_not have_content("My Test Location")
  end
end

