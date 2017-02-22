require 'rails_helper'

RSpec.describe CalculatorController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #calculate" do
    
    subject(:action) { post :calculate, params: {q: ""} }
    
    it "renders the index template" do
      expect(action).to render_template :index
    end
    
  end

end
