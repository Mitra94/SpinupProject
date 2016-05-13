json.array!(@apps) do |app|
  json.extract! app, :id, :name, :type, :category
  json.url app_url(app, format: :json)
end
