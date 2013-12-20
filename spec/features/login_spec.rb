# encoding: utf-8
require 'spec_helper'

describe "Login", :type => :feature do
  
  it "signs in user with correct email and password" do 
    club = FactoryGirl.build(:club)
    visit login_path
    fill_in 'email', :with => club.contact_mail
    fill_in 'password', :with => club.password
    click_button 'Anmelden'
    expect(page).to have_content 'erfolgreich'
  end
  
  it "denies to sign in user with incorrect email or password" do  
    club = FactoryGirl.build(:club)
    visit login_path
    fill_in 'email', :with => club.contact_mail
    fill_in 'password', :with => "wrong_password"
    click_button 'Anmelden'
    expect(page).to have_content 'ungültig'
  end
  
end