require 'rails_helper'

describe "get request managment", :type => :request do

  it "return all tweets" do
    FactoryBot.create(:tweet ,body: "first test tweet",username: "zizomohamed0")
    get "/api/v1/tweets"

   
    expect(response).to have_http_status(:success)
  end
end  


  describe "POST Request managment", :type => :request do

    it "create a new tweets" do
      expect {
      post "/api/v1/tweets", params: { Tweet:  {body: "first test create",
        username: "zizomohamed1"} }
      }.to change {Tweet.count}.from(0).to(1)
      
      expect(response).to have_http_status(:created)
    end
end