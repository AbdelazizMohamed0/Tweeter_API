# frozen_string_literal: true

require 'rails_helper'

describe 'get request managment', type: :request do
  it 'return created tweet' do
    FactoryBot.create(:tweet, body: 'first test tweet',
                              username_id: { first_name: 'abdelaizasdasd', last_name: 'mohaasdsadmed', age: '25' })
    get '/api/v1/tweets'

    expect(response).to have_http_status(:success)
  end
end

describe 'POST Request managment', type: :request do
  it twiiter 'create a new tweets' do
    params = {
      tweet: {
        body: 'first test create'
      },
      user: {
        first_name: 'abdelaiz', last_name: 'mohamed', age: '25'
      }
    }
    post '/api/v1/tweets', params: params
    expect(Tweet.count).to eq(1)
    expect(response).to have_http_status(:created)
    expect(Username.count).to eq(1)
  end

  describe 'POST Request managment', type: :request do
    it 'create a new user' do
      expect do
        headers = { 'ACCEPT' => 'application/json' }
        post '/api/v1/tweets', params: { username: {

          username: { first_name: 'abdelaiz', last_name: 'mohamed', age: '25' }
        } }, headers: headers
      end.to change { Username.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
    end
  end
end
