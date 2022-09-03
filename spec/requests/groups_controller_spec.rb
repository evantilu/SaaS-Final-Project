require 'rails_helper'
RSpec.describe "GroupControllers" do
  describe "GET /new" do
    it 'renders a successful response' do
      user = User.create(email:"dummy@dummy.com",password:"1234")
      get new_group_path(as:user)
      expect(response).to be_successful
    end
  end

  FactoryBot.define do
    factory :group do
      groupname { 'Test' }
      description  { '1234' }
      admin_id { 1 }
      id {1}

      factory :groupevents do
        after(:create) do |group|
          create(:groupevent, group: group)
        end
      end
    end

    factory :groupevent do
      title { 'Test' }
      content  { '1234' }
      start_time { DateTime.new(2021,11,3,4,5,6) }
      id {1}
    end
  end

  describe "GET /members"do
    it 'renders a successful response' do
      user1 = User.create(email:"dummy@dummy.com",password:"1234")
      user2 = User.create(email:"dummy2@dummy.com",password:"1234")
      users =[user1, user2]
      group = FactoryBot.create(:group, users: users)
      get members_path(group.groupname, as:user1)
      expect(response).to be_successful
    end
  end

  let(:attributes) do
    {
      'groupname' => 'Test',
      'description' => '12345'
    }
  end
  describe "POST /create"do
    it 'success and redirect to group_path' do
      user = User.create(email:"dummy@dummy.com",password:"1234")
      post g_path(as:user), params: { group: attributes}
      expect(response).to redirect_to(group_path("Test"))
    end

    it 'fail and redirect to new_group_path' do
      user = User.create(email:"dummy@dummy.com",password:"1234")
      post g_path(as:user), params: { group: attributes}
      post g_path(as:user), params: { group: attributes}
      expect(response).to be_successful
    end
  end

  describe "GET /show"do
    it 'renders a successful response' do
      user1 = User.create(email:"dummy@dummy.com",password:"1234")
      user2 = User.create(email:"dummy2@dummy.com",password:"1234")
      users =[user1, user2]
      group = FactoryBot.create(:group, users: users)
      get group_path(group.groupname, as:user1)
      expect(response).to be_successful
    end
  end

  describe "send notification"do
    it 'renders a successful response' do
      user1 = User.create(email:"dummy@dummy.com",password:"1234")
      user2 = User.create(email:"dummy2@dummy.com",password:"1234")
      users =[user1, user2]
      group = FactoryBot.create(:groupevents, users: users)
      get send_notify_path(id:group.id)
      expect(response).to redirect_to(group_path("Test"))
    end
  end

end
