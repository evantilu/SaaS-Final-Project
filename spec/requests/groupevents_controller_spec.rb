require 'rails_helper'
RSpec.describe "GroupEventsControllers" do

  describe "GET /new" do
    it 'renders a successful response' do
      user1 = User.create(email:"dummy@dummy.com",password:"1234")
      user2 = User.create(email:"dummy2@dummy.com",password:"1234")
      users =[user1, user2]
      group = FactoryBot.create(:group, users: users)
      get group_event_path(group_id:group.id, as:user1)
      expect(response).to be_successful
    end
  end

  let(:attributes) do
    {
      'title' => 'Test',
      'content' => '12345',
      'start_time' => DateTime.new(2021,11,3,4,5,6),
      'id' => 200
    }
  end

  describe "POST /create" do
    it 'renders a successful response' do
      user1 = User.create(email:"dummy@dummy.com",password:"1234")
      user2 = User.create(email:"dummy2@dummy.com",password:"1234")
      users =[user1, user2]
      group = FactoryBot.create(:groupevents, users: users)
      post group_event_path(as:user1) , params: { groupevent: attributes}
      expect(response).to redirect_to(group_path("Test"))
    end
  end
end
