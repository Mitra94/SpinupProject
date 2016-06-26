json.array!(@approvals) do |approval|
  json.extract! approval, :id, :skill, :voted, :voter
  json.url approval_url(approval, format: :json)
end
