# encoding: utf-8
require 'spec_helper'

describe "Event", :type => :feature do

  before :each do
    @club = FactoryGirl.create(:club)
    visit login_path
    fill_in 'email', :with => @club.contact_mail
    fill_in 'password', :with => @club.password
    click_button 'Anmelden'
    @event = FactoryGirl.create(:event)
    @boxer = FactoryGirl.create(:boxer)
  end
  
  it "applies a boxer to an event" do
    visit event_path(@event.id)
    @event.boxers.should_not include @boxer
    click_link "Teilnehmer"
    find(:css, "#boxer_ids[value='#{@boxer.id}']").set(true)
    click_link "Jetzt anmelden"
    boxers.should include @boxer
    expect(page).to have_content 'Anmeldung der Boxer war erfolgreich.'
  end
  
  it "removes a boxer from an event" do
  end

end
