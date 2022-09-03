require 'rails_helper'
RSpec.describe "UserControllers" do
  describe "GET /my_group" do
    it 'renders a successful response' do
      user = User.create(email:"dummy@dummy.com",password:"1234")
      get my_groups_path(as:user)
      expect(response).to be_successful
    end
  end
end
