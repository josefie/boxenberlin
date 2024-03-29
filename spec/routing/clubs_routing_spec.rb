require "spec_helper"

describe ClubsController do
  describe "routing" do

    it "routes to #index" do
      get("/clubs").should route_to("clubs#index")
    end
    
    it "routes to #new" do
      get("/signup").should route_to("clubs#new")
    end
    
    it "routes to #create" do
      post("/clubs").should route_to("clubs#create")
    end
    
    it "routes to #update" do
      put("/clubs/1").should route_to("clubs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/clubs/1").should route_to("clubs#destroy", :id => "1")
    end

    it "routes to #show" do
      get("/clubs/1").should route_to("clubs#show", :id => "1")
    end
    
    it "routes to #dashboard" do
      get("/dashboard").should route_to("clubs#dashboard")
    end
    
    it "routes to #my_profile" do
      get("/profile").should route_to("clubs#my_profile")
    end

    it "routes to #edit" do
      get("/profile/edit").should route_to("clubs#edit")
    end

  end
end