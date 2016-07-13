json.array!(@players) do |player|
  json.extract! player, :id, :surname, :first_name
  json.url player_url(player, format: :json)
end
