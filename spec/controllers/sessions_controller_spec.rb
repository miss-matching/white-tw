require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      @request.env["omniauth.auth"] = { "uid" => 1, "credentials" => {} }
      get 'create'
      expect(response).to redirect_to("/accounts/1")
    end
  end

end
