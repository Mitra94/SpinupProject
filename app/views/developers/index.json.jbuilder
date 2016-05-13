json.array!(@developers) do |developer|
  json.extract! developer, :id, :skill, :age, :city
  json.url developer_url(developer, format: :json)
end
