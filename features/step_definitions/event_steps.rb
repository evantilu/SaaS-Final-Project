# When /^(?:|I )press "([^"]*)"$/ do |button|
#   click_button(button)
# end

# When('I press {botton} button') do |botton|
#   click_button(button)
# end

Given /^the following events exist:$/ do |table|
  table.hashes.each do |hash|
    Event.create hash
  end
end

Then /(.*) seed events should exist/ do |n_seeds|
    expect(Event.count).to eq(n_seeds.to_i)
end

# Given /^(?:|I )am on (.+)$/ do |page_name|
#   visit path_to(page_name)
# end

When /^I press "(.*)" button/ do |button|
  click_button(button)
end

When /I hit "Delete"/ do
  click_link("Delete")
end



Given /user "(.*)" with password "(.*)"/ do |account, pwd|
  # debugger
  fill_in("session_email", :with => account)
  fill_in("session_password", :with => pwd)
end

Given /I am on my personal home page/ do
  # debugger
  # save_and_open_page
  visit events_path
end

# When /^(?:|I )follow "Event addition"/ do |link|
#   click_link(link)
# end
