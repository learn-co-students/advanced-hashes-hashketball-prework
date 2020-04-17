
 require "pry"
def game_hash
	new_hash = {:home => { :team_name => "Brooklyn Nets",
						   :colors => ["Black", "White"],
		                   :players => {"Alan Anderson" => {:number => 0,:shoe => 16,
						  								  :points => 22, :rebounds => 12,
						  								  :assists => 12, :steals => 3,
						  							  :blocks => 1, :slam_dunks => 1},
									   "Reggie Evans" => {:number => 30,:shoe => 14,
						  								  :points => 12, :rebounds => 12,
						  								  :assists => 12, :steals => 12,
						  								  :blocks => 12, :slam_dunks => 7},
									   "Brook Lopez" => {:number => 11,:shoe => 17,
						  								  :points => 17, :rebounds => 19,
						  								  :assists => 10, :steals => 3,
						  								  :blocks => 1, :slam_dunks => 15},
									   "Mason Plumlee" => {:number => 1,:shoe => 19,
						  								  :points => 26, :rebounds => 12,
						  								  :assists => 6, :steals => 3,
						  								  :blocks => 8, :slam_dunks => 5},
									   "Jason Terry" => {:number => 31,:shoe => 15,
						  								  :points => 19, :rebounds => 2,
						  								  :assists => 2, :steals => 4,
						  								  :blocks => 11, :slam_dunks => 1}}},


				:away => {:team_name => "Charlotte Hornets",
						  :colors => ["Turquoise","Purple"],
						  :players => {"Jeff Adrien" => {:number => 4,:shoe => 18,
						  								  :points => 10, :rebounds => 1,
						  								  :assists => 1, :steals => 2,
						  								  :blocks => 7, :slam_dunks => 2},
									   "Bismak Biyombo" => {:number => 0,:shoe => 16,
						  								  :points => 12, :rebounds => 4,
						  								  :assists => 7, :steals => 7,
						  								  :blocks => 15, :slam_dunks => 10},
									   "DeSagna Diop" => {:number => 2,:shoe => 14,
						  								  :points => 24, :rebounds => 12,
						  								  :assists => 12, :steals => 4,
						  								  :blocks => 5, :slam_dunks => 5},
									   "Ben Gordon" => {:number => 8,:shoe => 15,
						  								  :points => 33, :rebounds => 3,
						  								  :assists => 2, :steals => 1,
						  								  :blocks => 1, :slam_dunks => 0},
									   "Brendan Haywood" => {:number => 33,:shoe => 15,
						  								  :points => 6, :rebounds => 12,
						  								  :assists => 12, :steals => 22,
						  								  :blocks => 5, :slam_dunks => 12}}}}

end
def num_points_scored(players_name)


game_hash.each do |home_or_away, team_info|

#binding.pry
	team_info.each do |list, data|
		if list == :players

			#binding.pry

		 data.each do |player, players_data|
			#binding.pry
			if player == players_name
				#binding.pry
				players_data.each do |info, score|
				
					if info == :points
				#binding.pry
				  return score				
					#current_player_info.each do |key|
					#	if key == :points
			#		binding.pry
					#return key.values
				end
				end

			end
		end
end
end
end
end
   


   def shoe_size(names)

game_hash.each do |location, team_info|

#binding.pry
	team_info.each do |list, data|
		if list == :players

			#binding.pry

		 data.each do |player, players_data|
				if names == player
				#binding.pry
				players_data.each do |info, shoe_size|
				
					if info == :shoe
				#		binding.pry
				  return shoe_size				#	binding.pry
					#current_player_info.each do |key|
					#	if key == :points
					#		binding.pry
					#return key.values
end
end
end
end
end
end
end
end




def team_colors(name)
colors_of_team = []
game_hash.each do |location, team_info|
#binding.pry
#if location == :home
	#binding.pry

if team_info[:team_name] == name
	return (team_info[:colors].collect do |colors|

#if category == :color
	#binding.pry
 colors
  
end)
	#binding.pry
end
end
colors_of_team
end






def team_names

game_hash.collect do |location, team_info|

	team_info[:team_name]
	
	end
end


def player_numbers(team_names)
	jersey_numbers = []
	game_hash.each do |location, team_info|
#binding.pry
		if team_info[:team_name] == team_names
			team_info[:players].each do |player, player_info|
				#binding.pry
				player_info.each do |info, value|
#binding.pry

					if info == :number 
						#binding.pry

						#binding.pry
						jersey_numbers << value
						end
				end
				end
			end
		end
	jersey_numbers
	end
def player_stats(names)
	players_info = {}
	game_hash.each do |location, team_info|

		#binding.pry


		team_info.each do |player, player_info|
			
           #binding.pry

		if player == :players

		
			#binding.pry
		player_info.each do |current_player, info|
			   if names == current_player
			  # binding.pry
			
			
				
             players_info = info
		end
		end
end
end
end
players_info
end
def big_shoe_rebounds
 #total_rebounds = 0
shoe_size = 0 
rebounds = 0
name_of_the_player = String

game_hash.each do |location, team_info|

#binding.pry
	team_info[:players].each do |player, players_data|
#binding.pry


		players_data.each do |list, int|
			
			if list  == :shoe
 
	#binding.pry
if int > shoe_size
#binding.pry
	shoe_size = int
#binding.pry
	name_of_the_player = player
	rebounds = players_data[:rebounds]
#binding.pry
	 end
	 #binding.pry
	end
#binding.pry
end
#binding.pry
end
#binding.pry
end
#binding.pry
rebounds

end








