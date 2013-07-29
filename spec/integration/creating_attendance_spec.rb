require 'spec_helper'

feature 'Creating Item Storage' do

  before do
    Factory(:item, :name => "Test Item")
    Factory(:location, :location => "Test Location")
    visit '/'
  end

  scenario 'can create an item location' do
    fill_in 'Name', :with => 'Test Item'
    fill_in 'Type', :with => 'Book'
    click_link 'Test Item'
    click_button 'Add Location'
    page.should have_content('Item location has been created.')
    page.should have_content('Test Location')
  end

end

