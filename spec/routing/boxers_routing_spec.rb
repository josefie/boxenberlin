require "spec_helper"

describe BoxersController do
  describe "routing" do

    it "routes to #my_boxers" do
      get("/boxers").should route_to("boxers#my_boxers")
    end

    it "routes to #new" do
      get("/boxers/new").should route_to("boxers#new")
    end

    it "routes to #show" do
      get("/boxers/1").should route_to("boxers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/boxers/1/edit").should route_to("boxers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/boxers").should route_to("boxers#create")
    end

    it "routes to #update" do
      put("/boxers/1").should route_to("boxers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/boxers/1").should route_to("boxers#destroy", :id => "1")
    end

  end
end
