require 'spec_helper'

describe EventsController do

  let(:valid_attributes) { { "title" => "MyTitle", "address" => "MyAddress", "club_id" => 1 } }
  let(:valid_session) { {} }
  
  describe "GET index" do
    before :each do
      event = Event.create! valid_attributes
    end

    it "creates event with valid attributes" do
      visit events_path
      expect(page).to have_content "MyTitle"
      expect(page).to have_content "MyAddress"
    end
    
    it "shows events in chronological order" do
    end
    
  end
  
  describe "GET show" do
    
    it "shows name of host club" do
    end
    
  end
  
end
