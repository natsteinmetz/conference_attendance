require 'spec_helper'

feature "Viewing locations" do
  scenario "Listing all locations" do
    location = Factory.create(:location, :name => "Test Location")
    visit '/'
    click_link "See all locations"
    click_link "Test Location"
    page.current_url.should == location_url(location)
  end
end

