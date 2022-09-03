# Given /I am on the sign in page/ do
#     visit sign_in_path
# end

When /^I press "(.*)" button/ do |button|
    click_button(button)
end

When /^(?:|I )sign up with the User id "([^"]*)"$/ do |value|
    fill_in("user_email", :with => value)
end

When /^(?:|I )sign in with the User id "([^"]*)"$/ do |value|
    fill_in("session_email", :with => value)
end

Given /the account "(.*)" with password "(.*)" exists/ do |account, pwd|
    User.new("email": account, "encrypted_password": pwd)
end

Then /I should see my personal home page/ do
    current_path = URI.parse(current_url).path
    if current_path.respond_to? :should
        current_path.should == '/session'
    else
        assert_equal '/session', current_path
    end
end 