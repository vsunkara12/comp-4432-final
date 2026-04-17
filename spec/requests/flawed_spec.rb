require 'rails_helper'

RSpec.describe "Flaweds", type: :request do
  describe "GET /show_grade" do
    it "returns http success" do
      get "/flawed/show_grade"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /admin" do
    it "returns http success" do
      get "/flawed/admin"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /students_edit" do
    it "returns http success" do
      get "/flawed/students_edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /students_update" do
    it "returns http success" do
      get "/flawed/students_update"
      expect(response).to have_http_status(:success)
    end
  end

end
