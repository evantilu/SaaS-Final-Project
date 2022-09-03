Then /I can see the group page for "(.*)"/ do |group|
    current_path = URI.parse(current_url).path
    if current_path.respond_to? :should
        current_path.should == group_path(group)
    else
        assert_equal group_path(group), current_path
    end
end

Given /I am logged in with the account "(.*)" and the password "(.*)"/ do |account, pwd|
    visit sign_in_path
    fill_in("session_email", :with => account)
    fill_in("Password", :with => pwd)
    click_on "Sign in"
end

When /I click "New Group"/ do
    visit new_group_path
end

