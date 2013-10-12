require 'test_helper'

class EventTest < ActiveSupport::TestCase
  
  test "geocode" do
    event = Event.create(address: "Berlin")
    refute_nil( event.latitude, "Geocoding address failed" )
    refute_nil( event.longitude, "Geocoding address failed" )
  end
  
  test "validate title presence" do
    event = Event.create(title: "")
    assert( !event.valid?, "No title given" )
  end
  
  test "validate address presence" do
    event = Event.create(address: "")
    assert( !event.valid?, "No address given" )
  end
  
  test "validate club_id presence" do
    event = Event.create(title: "Test", address: "Test")
    assert( !event.valid?, "No club_id given" )
  end
  
end
