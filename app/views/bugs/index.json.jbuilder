json.array!(@bugs) do |bug|
  json.extract! bug, :id, :app_id, :founder, :description
  json.url bug_url(bug, format: :json)
end
