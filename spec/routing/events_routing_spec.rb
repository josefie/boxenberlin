require "spec_helper"

describe EventsController do
  describe "routing" do
    
    it "routes to #index" do
      get("/calendar").should route_to("events#index", :date => Time.now.to_date.to_s)
    end
    
    it "routes to #my_events" do
      get("/events").should route_to("events#my_events", :role => "host")
    end

    it "routes to #new" do
      get("/events/new").should route_to("events#new")
    end

    it "routes to #show" do
      get("/events/1").should route_to("events#show", :id => "1")
    end

    it "routes to #edit" do
      get("/events/1/edit").should route_to("events#edit", :id => "1")
    end

    it "routes to #create" do
      post("/events").should route_to("events#create")
    end

    it "routes to #update" do
      put("/events/1").should route_to("events#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/events/1").should route_to("events#destroy", :id => "1")
    end
    
    it "routes to #manage" do
      get("/manage").should route_to("events#manage", :status => "open")
    end
    
    it "routes to #send_application" do
      post("/events/1/apply").should route_to("events#send_application", :id => "1")
    end
    
    it "routes to #undo_application" do
      delete("/events/1/apply/1").should route_to("events#undo_application", :id => "1", :boxer_id => "1")
    end
    
    it "routes to #fights" do
      post("/events/1/fights").should route_to("events#fights", :id => "1")
    end
    
  end
end