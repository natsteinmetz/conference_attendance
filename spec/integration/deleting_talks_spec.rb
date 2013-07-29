require 'spec_helper'

feature "Deleting items" do
  scenario "Deleting an item" do
    Factory(:item, :name => "My Test Item")
    visit '/'
    click_link "My Test Item"
    click_link "Delete Item"
    page.should have_content("Item has been deleted.")

    visit '/'
    page.should_not have_content("My Test Item")
  end
end

