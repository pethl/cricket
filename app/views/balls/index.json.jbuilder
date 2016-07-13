json.array!(@balls) do |ball|
  json.extract! ball, :id, :bowler, :batsman, :over_id, :match_id, :delivery, :four, :six, :runs, :wicket, :catcher, :done, :declared, :out
  json.url ball_url(ball, format: :json)
end
