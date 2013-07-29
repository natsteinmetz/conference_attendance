require 'spec_helper'

feature "Viewing items" do
  scenario "Listing all items" do
    item = Factory.create(:item, :name => "Test Item")
    visit '/'
    click_link "Test Item"
    page.current_url.should == item_url(item)
  end
end

