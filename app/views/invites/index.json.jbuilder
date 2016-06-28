json.array!(@invites) do |invite|
  json.extract! invite, :id, :app, :sender, :receiver
  json.url invite_url(invite, format: :json)
end
