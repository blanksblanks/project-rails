json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :species, :color, :birthday
  json.url pet_url(pet, format: :json)
end
