require 'spec_helper'

feature 'Deleting Attendance Association' do

  before do
    @talk = Factory(:talk, :title => "Test Talk")
    @attendee = Factory(:attendee, :name => "Test Attendee")
    visit '/'
    click_link 'See all talks'
    click_link 'Test Talk'
    click_link 'Add Attendee'
    page.select(@talk.title, from: "attendance_talk_id")
    page.select(@attendee.name, from: "attendance_attendee_id")
    click_button "Submit"
  end

  scenario 'can delete an attendance association' do
    click_link 'Remove Attendee'
    page.should_not have_content(@attendee.name)
    page.should have_content("Talk attendance has been deleted.")
  end

end
