# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Team.destroy_all
Team.create(name:'Ashdown', institute:'Ashdown Grammer', year:'2016', rank:'I')
Team.create(name:'Cheltenham', institute:'Cheltenham College', year:'2016', rank:'II')
Player.destroy_all
Player.create(surname: 'Jones', first_name:'Sam', team_id:Team.first.id)
Player.create(surname: 'Brown', first_name:'Dan', team_id:Team.first.id)
Player.create(surname: 'Smith', first_name:'Paul', team_id:Team.first.id)
Player.create(surname: 'Ramsey', first_name:'Aaron', team_id:Team.first.id)
Player.create(surname: 'Morgan', first_name:'Carl', team_id:Team.first.id)
Player.create(surname: 'Samson', first_name:'Darren', team_id:Team.first.id)
Player.create(surname: 'Hargreaves', first_name:'Alfred', team_id:Team.first.id)
Player.create(surname: 'Jeffries', first_name:'Jake', team_id:Team.first.id)
Player.create(surname: 'Younger', first_name:'Don', team_id:Team.first.id)
Player.create(surname: 'Thompson', first_name:'Ralph', team_id:Team.first.id)
Player.create(surname: 'Randolph', first_name:'Rob', team_id:Team.first.id)
Player.create(surname: 'Hibbs', first_name:'Tim', team_id:Team.second.id)
Player.create(surname: 'Young', first_name:'Jim', team_id:Team.second.id)
Player.create(surname: 'Evans', first_name:'Finn', team_id:Team.second.id)
Player.create(surname: 'Davis', first_name:'Arthur', team_id:Team.second.id)
Player.create(surname: 'Rees', first_name:'Arnold', team_id:Team.second.id)
Player.create(surname: 'Knowles', first_name:'Jack', team_id:Team.second.id)
Player.create(surname: 'Johns', first_name:'Stan', team_id:Team.second.id)
Player.create(surname: 'Taylor', first_name:'Alan', team_id:Team.second.id)
Player.create(surname: 'Irvin', first_name:'Andy', team_id:Team.second.id)
Player.create(surname: 'Howard', first_name:'Edward', team_id:Team.second.id)
Player.create(surname: 'Glover', first_name:'Tom', team_id:Team.second.id)
Match.destroy_all
Match.create(date:'2016-07-18', home:Team.first.id, away:Team.second.id, first_to_bat:Team.first.id, total_overs:40)
Over.destroy_all
Over.create(match_id:Match.first.id, number:1) 
Over.create(match_id:Match.first.id, number:2)
Over.create(match_id:Match.first.id, number:3)
Over.create(match_id:Match.first.id, number:4)
Ball.destroy_all
Ball.create(bowler:Player.last.id, over_id:Over.last.id, match_id:Match.first.id, delivery:1, runs:1, batsman:Player.first.id)
Ball.create(bowler:Player.last.id, over_id:Over.last.id, match_id:Match.first.id, delivery:2, runs:3, batsman:Player.first.id)   
Ball.create(bowler:Player.last.id, over_id:Over.last.id, match_id:Match.first.id, delivery:3, runs:2, batsman:Player.first.id)   
Ball.create(bowler:Player.last.id, over_id:Over.last.id, match_id:Match.first.id, delivery:4, runs:0, batsman:Player.first.id, wicket:true)   
Ball.create(bowler:Player.last.id, over_id:Over.last.id, match_id:Match.first.id, delivery:5, runs:0, batsman:Player.second.id)   
Ball.create(bowler:Player.last.id, over_id:Over.last.id, match_id:Match.first.id, delivery:6, runs:1, batsman:Player.second.id)   
Matchteam.destroy_all