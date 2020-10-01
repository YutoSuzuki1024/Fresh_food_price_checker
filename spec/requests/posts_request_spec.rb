require 'rails_helper'

RSpec.describe "Posts", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/posts/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/posts/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/posts/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/posts/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new_confirm" do
    it "returns http success" do
      get "/posts/new_confirm"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit_confirm" do
    it "returns http success" do
      get "/posts/edit_confirm"
      expect(response).to have_http_status(:success)
    end
  end

end
