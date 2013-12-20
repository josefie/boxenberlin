require "spec_helper"

describe EventsController do
  describe "routing" do

    it "routes to #calendar" do
      get("/").should route_to("events#index")
    end
    
    it "routes to #calendar" do
      get("/calendar").should route_to("events#index", :date => Time.now.to_date.to_s)
    end
    
    it "routes to #my_events" do
      get("/events").should route_to("events#my_events")
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
    
    it "routes to #manage/open" do
      get("/manage/open").should route_to("events#manage", :status => "open")
    end
    
    it "routes to #manage/approved" do
      get("/manage/approved").should route_to("events#manage", :status => "approved")
    end
    
    it "routes to #manage/declined" do
      get("/manage/declined").should route_to("events#manage", :status => "declined")
    end
    
    it "routes to #apply" do
      get("/events/1/apply").should route_to("events#apply", :id => "1")
    end
    
    it "routes to #send_application" do
      post("/events/1/apply").should route_to("events#send_application", :id => "1")
    end
    
    it "routes to #participations" do
      get("/events/1/participation").should route_to("events#participations", :id => "1")
    end
    
    it "routes to participations#destroy" do
      delete("/participations/1").should route_to("participations#destroy", :id => "1")
    end

  end
end
