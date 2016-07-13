json.array!(@matches) do |match|
  json.extract! match, :id, :date, :home, :away, :overs, :over_count, :first_to_bat
  json.url match_url(match, format: :json)
end
