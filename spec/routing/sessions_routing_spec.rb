require "spec_helper"

describe SessionsController do
  
  describe "routing" do

    it "routes to #login" do
      get("/login").should route_to("sessions#new")
    end
    
    it "routes to #login" do
      post("/login").should route_to("sessions#create")
    end
    
    it "routes to #logout" do
      delete("/logout/1").should route_to("sessions#destroy", :id => "1")
    end
    
  end
end