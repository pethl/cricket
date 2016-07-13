json.array!(@matchteams) do |matchteam|
  json.extract! matchteam, :id, :match_id, :player_id, :out, :batting_order
  json.url matchteam_url(matchteam, format: :json)
end
