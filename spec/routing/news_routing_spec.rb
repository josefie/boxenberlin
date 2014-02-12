require "spec_helper"

describe NewsController do
  describe "routing" do

    it "routes to #homepage" do
      get("/news").should route_to("news#homepage")
    end
    
  end
end
