# encoding: utf-8
require 'spec_helper'

describe "Event", :type => :feature do

  before :all do
    @events = [
      FactoryGirl.create(:event, title: "Boxen 1", date: "2013-12-01".to_date, approved: true),
      FactoryGirl.create(:event, title: "Boxen 2", date: "2014-01-01".to_date, approved: true),
      FactoryGirl.create(:event, title: "Boxen 3", date: "2014-12-01".to_date, approved: false)
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
  
  it "lists all approved events of the current month" do
    visit calendar_path("2013-12-01".to_date)
    current_events = Event.by_date("2013-12-01".to_date)
    
    expect(page).to have_content("Dezember")
    
    expect(current_events).to include(@events[0])
    expect(current_events).not_to include(@events[1])
    expect(current_events).not_to include(@events[2])
    
    expect(page).to have_content("Boxen 1")
    expect(page).not_to have_content("Boxen 2")
    expect(page).not_to have_content("Boxen 3")
  end
  
  it "lists all approved events of the next month" do
    visit calendar_path("2013-12-01".to_date)
    click_link 'next'
    expect(page).to have_content("Januar")
    expect(page).to have_content("Boxen 2")
  end

end
