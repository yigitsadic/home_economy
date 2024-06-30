require 'rails_helper'

RSpec.describe "Dashboards", type: :request do
  describe "GET /" do
    it "returns http success" do
      get root_path
      
      expect(assigns(:month).full_name).to eq(attributes_for(:month)[:full_name])
      expect(response).to have_http_status(:success)
    end
  end
end
