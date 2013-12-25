# encoding: utf-8
require 'spec_helper'

describe "Event", :type => :feature do

  before :all do
    @events = [
      FactoryGirl.create(:event, title: "Boxen 1", date: "2013-12-01"),
      FactoryGirl.create(:event, title: "Boxen 2", date: "2014-01-01"),
      FactoryGirl.create(:event, title: "Boxen 3", date: "2014-02-01")
    ]
  end
  
  after :all do
    @events.each do |e|
      e.destroy!
    end
  end
  
  it "has a search field" do
    visit calendar_path
    expect(page).to have_css('input#search')
  end
  
  it "lists all events of the current month" do
    visit calendar_path
    current_events = Event.by_date("2013-12-01".to_date)
    expect(current_events).to include(@events[0])
    expect(page).to have_content("December")
    expect(page).to have_content("Boxen 1")
  end
  
  it "lists all events of the next month" do
    visit calendar_path
    click_link 'next'
    expect(page).to have_content("January")
    expect(page).to have_content("Boxen 2")
  end

end
