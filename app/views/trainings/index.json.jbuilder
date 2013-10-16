json.array!(@trainings) do |training|
  json.extract! training, :weekday, :time_start, :time_end, :description, :club_id
  json.url training_url(training, format: :json)
end
