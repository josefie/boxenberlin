json.array!(@clubs) do |club|
  json.extract! club, :name, :street, :street_no, :zip, :city, :website, :coaches, :contact_name, :contact_phone, :contact_mail
  json.url club_url(club, format: :json)
end
