require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:@upcoming_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: { address: @event.address, additional_info: @event.additional_info, admission: @event.admission, admission_discounted: @event.admission_discounted, catering_available: @event.catering_available, contact_mail: @event.contact_mail, contact_name: @event.contact_name, contact_phone: @event.contact_phone, date: @event.date, gloves_available: @event.gloves_available, time_doctor: @event.time_doctor, time_start: @event.time_start, time_weighing: @event.time_weighing, title: @event.title }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    patch :update, id: @event, event: { address: @event.address, additional_info: @event.additional_info, admission: @event.admission, admission_discounted: @event.admission_discounted, catering_available: @event.catering_available, contact_mail: @event.contact_mail, contact_name: @event.contact_name, contact_phone: @event.contact_phone, date: @event.date, gloves_available: @event.gloves_available, time_doctor: @event.time_doctor, time_start: @event.time_start, time_weighing: @event.time_weighing, title: @event.title }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
  
end
