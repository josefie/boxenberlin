# encoding: utf-8
require 'spec_helper'

describe "Event", :type => :feature do

  before :each do
    @club = FactoryGirl.create(:club)
    visit login_path
    fill_in 'email', :with => @club.contact_mail
    fill_in 'password', :with => @club.password
    click_button 'Anmelden'
  end
  
  it "can be created through a form" do
    visit new_event_path
    within('#new_event') {
      expect(page).to have_content('Adresse')
      expect(page).to have_content('Datum')
      expect(page).to have_content('Zeitplan')
      expect(page).to have_content('Titel')
    }
  end
  
  it "denies to be created if required attributes are missing" do
    visit new_event_path
    within('#new_event') {
      fill_in 'event[address]', :with => ''
      click_button 'Beantragen'
    }
    expect(page).to have_content 'Veranstaltung konnte nicht gespeichert werden'
  end
  
  it "is being created with valid attributes" do
    @event1 = FactoryGirl.create(:event)
    @event1.should_not be_nil
    @event1.approved.should be_nil
  end
  
  it "automatically adds latitude and longitude" do
    @event2 = FactoryGirl.create(:event)
    @event2.latitude.should_not be_nil
    @event2.longitude.should_not be_nil
  end

end
