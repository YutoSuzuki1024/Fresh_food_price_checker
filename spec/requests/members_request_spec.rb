require 'rails_helper'

RSpec.describe "Members", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/members/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/members/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /leave" do
    it "returns http success" do
      get "/members/leave"
      expect(response).to have_http_status(:success)
    end
  end

end
