# encoding: utf-8
require 'spec_helper'

describe "Club", :type => :feature do

  before :each do
    @club = FactoryGirl.create(:club, name: "Club 1")
    visit login_path
    fill_in 'email', :with => @club.contact_mail
    fill_in 'password', :with => @club.password
    click_button 'Anmelden'
  end
  
  it "can add and edit profile info" do
    visit my_profile_path
    click_link "Bearbeiten"
    expect(page).to have_css('input#club_name')
    expect(page).to have_css('input#club_website')
    expect(page).to have_css('input#club_contact_name')
  end
  
  it "shows up in the list of clubs" do
    visit clubs_path
    clubs = Club.all
    expect(clubs).to include(@club)
    expect(page).to have_content("Club 1")
  end
  
  it "lists own upcoming events" do
    FactoryGirl.create(:event, club_id: @club.id, date: Date.tomorrow, approved: true, title: "Event 1")
    visit club_path(@club)
    expect(page).to have_link("Event 1")
  end

end
