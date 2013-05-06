require "spec_helper"

describe NgWordsController do
  describe "routing" do

    it "routes to #new" do
      get("/ng_words/new").should route_to("ng_words#new")
    end

    it "routes to #edit" do
      get("/ng_words/1/edit").should route_to("ng_words#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ng_words").should route_to("ng_words#create")
    end

    it "routes to #update" do
      put("/ng_words/1").should route_to("ng_words#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ng_words/1").should route_to("ng_words#destroy", :id => "1")
    end

  end
end
