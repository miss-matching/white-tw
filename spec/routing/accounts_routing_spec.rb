require "spec_helper"

describe AccountsController do
  describe "routing" do

    it "routes to #show" do
      get("/accounts/1").should route_to("accounts#show", :id => "1")
    end
  end
end
