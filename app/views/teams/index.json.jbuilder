json.array!(@teams) do |team|
  json.extract! team, :id, :name, :institute, :year, :rank
  json.url team_url(team, format: :json)
end
