json.array!(@news) do |news|
  json.extract! news, :id, :title, :text, :date
  json.url news_url(news, format: :json)
end
