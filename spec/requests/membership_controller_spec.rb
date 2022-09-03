require 'rails_helper'
RSpec.describe "GroupControllers" do

  let(:attributes) do
    {
      'groupname' => 'Test',
      'description' => '12345'
    }
  end

  describe "Member join" do
    it 'success and redirect to group_path' do
      user = User.create(email:"dummy@dummy.com",password:"1234")
      post g_path(as:user), params: {group:attributes}
      post join_path(as:user), params:{ id:Group.ids.to_s[1...-1]}
      expect(response).to redirect_to(group_path("Test"))
    end
  end

  describe "Member quit" do
    it 'success and redirect to group_path' do
      user = User.create(email:"dummy@dummy.com",password:"1234")
      post g_path(as:user), params: {group:attributes}
      post join_path(as:user), params:{ id:Group.ids.to_s[1...-1]}
      delete quit_path(as:user), params:{ id:Group.ids.to_s[1...-1]}
      expect(response).to redirect_to(group_path("Test"))
    end
  end
end
