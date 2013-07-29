require 'spec_helper'

feature 'Creating Talk' do

  before do
    visit '/'
    click_link "New Talk"
  end

  scenario 'can create a talk' do
    fill_in 'Title', :with => 'Test Talk'
    fill_in 'Room', :with => 'Test Room'
    fill_in 'Speaker', :with => 'Test Speaker'
    click_button 'Create Talk'
    page.should have_content('Talk has been created.')

    talk = Talk.find_by_title('Test Talk')
    page.current_url.should == talk_url(talk)
    title = "Test Talk - Talks - Conference Attendance Management"
    find("title").should have_content(title)
  end

  scenario "can not create a talk without a title" do
    click_button "Create Talk"
    page.should have_content("Talk has not been created.")
    page.should have_content("Title can't be blank")
  end
end

