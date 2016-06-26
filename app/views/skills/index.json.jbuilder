json.array!(@skills) do |skill|
  json.extract! skill, :id, :html+css, :java, :javascript, :c, :c++, :nodejs, :database, :algorithms, :android, :ios
  json.url skill_url(skill, format: :json)
end
