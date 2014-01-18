require "spec_helper"

describe FightsController do
  describe "routing" do

    it "routes to #index" do
      get("/fights").should route_to("fights#index")
    end

    it "routes to #new" do
      get("/fights/new").should route_to("fights#new")
    end

    it "routes to #show" do
      get("/fights/1").should route_to("fights#show", :id => "1")
    end

    it "routes to #edit" do
      get("/fights/1/edit").should route_to("fights#edit", :id => "1")
    end

    it "routes to #create" do
      post("/fights").should route_to("fights#create")
    end

    it "routes to #update" do
      put("/fights/1").should route_to("fights#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/fights/1").should route_to("fights#destroy", :id => "1")
    end

  end
end
