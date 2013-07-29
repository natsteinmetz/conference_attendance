require 'spec_helper'

feature 'Creating Location' do

  before do
    Factory(:item, :name => "Test Item")
    visit '/'
    click_link "See all locations"
    click_link "New Location"
  end

  scenario 'can create a location' do
    fill_in 'Name', :with => 'Test Location'
    fill_in 'Type', :with => 'Book'
    fill_in 'Room', :with => 'Test Room'
    click_button 'Create Location'
    page.should have_content('Location has been created.')

    location = Location.find_by_name('Test Location')
    page.current_url.should == location_url(location)
    title = "Test Location - Locations - Media Tracker"
    find("title").should have_content(title)
  end

  scenario "can not create an location without valid attributes" do
    click_button "Create Location"
    page.should have_content("Location has not been created.")
    page.should have_content("Name can't be blank")
    page.should have_content("Type can't be blank")
    page.should have_content("Room can't be blank")
  end
end

