require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  describe "GET new" do
    before(:each) do
      @user = create(:user, admin: true)
      sign_in @user
    end

    it "should show the company's form" do
      get :new
      expect(response).to render_template 'companies/new'
    end
  end
end
