json.array!(@photos) do |photo|
  json.extract! photo, :id, :label, :description, :date_taken
  json.url photo_url(photo, format: :json)
end
