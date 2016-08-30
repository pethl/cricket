# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Team.destroy_all
Team.create(name:'England', institute:'ECB', year:'2016', rank:'I')
Team.create(name:'Pakistan', institute:'PCB', year:'2016', rank:'II')
Player.destroy_all
Player.create(surname: 'Cook', first_name:'Alastair', team_id:Team.first.id)
Player.create(surname: 'Hales', first_name:'Alex', team_id:Team.first.id)
Player.create(surname: 'Vince', first_name:'James', team_id:Team.first.id)
Player.create(surname: 'Root', first_name:'Joe', team_id:Team.first.id)
Player.create(surname: 'Ballance', first_name:'Gary', team_id:Team.first.id)
Player.create(surname: 'Stokes', first_name:'Ben', team_id:Team.first.id)
Player.create(surname: 'Bairstow', first_name:'Jonny', team_id:Team.first.id)
Player.create(surname: 'Ali', first_name:'Moeen', team_id:Team.first.id)
Player.create(surname: 'Woakes', first_name:'Chris', team_id:Team.first.id)
Player.create(surname: 'Broad', first_name:'Stuart', team_id:Team.first.id)
Player.create(surname: 'Anderson', first_name:'James', team_id:Team.first.id)
Player.create(surname: 'Mohammad', first_name:'Hafeez', team_id:Team.second.id)
Player.create(surname: 'Shan', first_name:'Masood', team_id:Team.second.id)
Player.create(surname: 'Ali', first_name:'Azhar', team_id:Team.second.id)
Player.create(surname: 'Khan', first_name:'Younus', team_id:Team.second.id)
Player.create(surname: 'Misbah-ul-Haq', first_name:'M.', team_id:Team.second.id)
Player.create(surname: 'Shafiq', first_name:'Asad', team_id:Team.second.id)
Player.create(surname: 'Ahmed', first_name:'Sarfraz', team_id:Team.second.id)
Player.create(surname: 'Riaz', first_name:'Wahab', team_id:Team.second.id)
Player.create(surname: 'Amir', first_name:'Mohammad', team_id:Team.second.id)
Player.create(surname: 'Shah', first_name:'Yasir', team_id:Team.second.id)
Player.create(surname: 'Ali', first_name:'Rahat', team_id:Team.second.id)
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