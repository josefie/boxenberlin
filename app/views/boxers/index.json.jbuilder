json.array!(@boxers) do |boxer|
  json.extract! boxer, :first_name, :last_name, :date_of_birth, :weight, :fights_won, :fights_lost, :fights_drawn, :gender, :active, :club_id
  json.url boxer_url(boxer, format: :json)
end
