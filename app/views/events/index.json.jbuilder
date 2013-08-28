json.array!(@events) do |event|
  json.extract! event, :title, :date, :time_start, :time_weighing, :time_doctor, :contact_name, :contact_phone, :contact_mail, :additional_info, :gloves_available, :catering_available, :admission, :admission_discounted
  json.url event_url(event, format: :json)
end
