# encoding: utf-8
require 'spec_helper'

describe "Boxer", :type => :feature do

  before :each do
    @club = FactoryGirl.create(:club)
    visit login_path
    fill_in 'email', :with => @club.contact_mail
    fill_in 'password', :with => @club.password
    click_button 'Anmelden'
  end
  
  it "has an age class" do
    @boxer = FactoryGirl.create(:boxer)
    visit boxer_path(@boxer.id)
    expect(page).to have_content('Männer')
  end
  
  it "has a performance class" do
    @boxer = FactoryGirl.create(:boxer, :fights_won => 26)
    visit boxer_path(@boxer.id)
    expect(page).to have_content('Elite')
  end

end
