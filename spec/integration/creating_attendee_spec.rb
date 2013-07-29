require 'spec_helper'

feature 'Creating Attendee' do

  before do
    visit '/'
    click_link "See all attendees"
    click_link "New Attendee"
  end

  scenario 'can create an attendee' do
    fill_in 'Name', :with => 'Test Attendee'
    fill_in 'Email', :with => 'Test Email'
    click_button 'Create Attendee'
    page.should have_content('Attendee has been created.')

    location = Attendee.find_by_name('Test Attendee')
    page.current_url.should == attendee_url(location)
    title = "Test Attendee - Attendees - Conference Attendance Management"
    find("title").should have_content(title)
  end

  scenario "can not create an attendee without valid attributes" do
    click_button "Create Attendee"
    page.should have_content("Attendee has not been created.")
    page.should have_content("Name can't be blank")
  end
end

