require 'rails_helper'

RSpec.describe "Friends", type: :request do
  # TODO fix these
  # https://stackoverflow.com/questions/49787383/rspec-controller-testing-http-test-host-login-error-on-index-spec-test

  # before do
  #   @request.host = "localhost:3000"
  # end

  context 'GET #friends' do
    it 'returns a success response' do
      get :friends
      expect(response).to be_success
    end
  end

  context 'GET #events' do
    it 'returns a success response' do
      get :events
      expect(response).to be_success
    end
  end

  context 'GET #events' do
    it 'returns a success response' do
      friend = Friend.create!(first_name: 'Jane', last_name: 'Doe', email: 'test@test.com')
      get :show, params: { id: friend.to_param}
      expect(response).to be_success
    end
  end
end
