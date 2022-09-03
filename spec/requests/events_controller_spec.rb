require 'rails_helper'
RSpec.describe "EventsControllers" do

  describe "GET /index" do
    it 'renders a successful response' do
      user = User.create(email:"dummy@dummy.com",password:"1234")
      get index_path(as: user)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      user = User.create(email:"dummy@dummy.com",password:"1234")
      get new_event_path(as:user)
      expect(response).to be_successful
    end
  end

  let(:attributes) do
    {
      'title' => 'Test',
      'content' => '12345',
      'start_time' => DateTime.new(2021,11,3,4,5,6)
    }
  end

  FactoryBot.define do
    factory :event do
      title { 'Test' }
      content  { '1234' }
      start_time { DateTime.new(2021,11,3,4,5,6) }
      end
  end
  describe 'GET /show' do
    it 'renders a successful response' do
      user = User.create(email:"dummy@dummy.com",password:"1234")
      post = FactoryBot.create(:event, user: user)
      get event_path(post.id, as:user)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    it 'creates a new event' do
      expect do
        user = User.create(email:"dummy@dummy.com",password:"1234")
        post events_url(as:user), params: { event: attributes }
      end.to change(Event, :count).by(1)
    end

    it 'redirect to index page' do
      user = User.create(email:"dummy@dummy.com",password:"1234")
      post events_url(as:user), params: { event: attributes }
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested post' do
      user = User.create(email:"dummy@dummy.com",password:"1234")
      event = FactoryBot.create(:event, user: user)
      expect do
        delete event_url(event.id, as:user)
      end.to change(Event, :count).by(-1)
    end

    it 'redirects to the posts list' do
      user = User.create(email:"dummy@dummy.com",password:"1234")
      event = FactoryBot.create(:event, user: user)
      delete event_url(event.id, as:user)
      expect(response).to redirect_to(root_url)
    end
  end

end
