json.array!(@fights) do |fight|
  json.extract! fight, :id, :approved
  json.url fight_url(fight, format: :json)
end
