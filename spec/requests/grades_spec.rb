require 'rails_helper'

RSpec.describe "Grades", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/grades/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/grades/show"
      expect(response).to have_http_status(:success)
    end
  end

end
