require 'spec_helper'

feature 'Creating Attendance Association' do

  before do
    @talk = Factory(:talk, :title => "Test Talk")
    @attendee = Factory(:attendee, :name => "Test Attendee")
    visit '/'
    click_link 'See all talks'
    page.should have_content(@talk.title)
  end

  scenario 'can create an attendance association' do
    click_link 'Test Talk'
    page.should have_content(@talk.title)
    click_link 'Add Attendee'
    page.should have_content('Add Talk Attendances')

    page.select(@talk.title, from: "attendance_talk_id")
    page.select(@attendee.name, from: "attendance_attendee_id")
    click_button "Submit"
    redirect_to talk_path(@talk)
    page.should have_content("Attendance has been created.")
  end

end
