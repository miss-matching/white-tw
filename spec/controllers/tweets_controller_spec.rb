require 'spec_helper'

describe TweetsController do

  describe "GET 'destroy'" do
    it "returns http success" do
      delete :destroy, :id => 1
      expect(response).to redirect_to(root_url)
    end
  end

end
