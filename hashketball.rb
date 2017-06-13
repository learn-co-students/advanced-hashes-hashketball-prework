# Write your code here!
require "pry"
def game_hash
	hsh = {
		home: {
			:team_name => 'Brooklyn Nets',
			:colors => ['Black', 'White'],
			:players => {
				'Alan Anderson' => {
					:number => 0,
					:shoe => 16,
					:points => 22,
					:rebounds => 12,
					:assists => 12,
					:steals => 3,
					:blocks => 1,
					:slam_dunks => 1,
				},	
				'Reggie Evans' => {
					:number => 30,
					:shoe => 14,
					:points => 12,
					:rebounds => 12,
					:assists => 12,
					:steals => 12,
					:blocks => 12,
					:slam_dunks => 7,
				},	
				'Brook Lopez' => {
					:number => 11,
					:shoe => 17,
					:points => 17,
					:rebounds => 19,
					:assists => 10,
					:steals => 3,
					:blocks => 1,
					:slam_dunks => 15,
				},
				'Mason Plumlee' => {
					:number => 1,
					:shoe => 19,
					:points => 26,
					:rebounds => 12,
					:assists => 6,
					:steals => 3,
					:blocks => 8,
					:slam_dunks => 5 
				},
			'Jason Terry' => {
					:number => 31,
					:shoe => 15,
					:points => 19,
					:rebounds => 2,
					:assists => 2,
					:steals => 4,
					:blocks => 11,
					:slam_dunks => 1
					},

				}
			},
		away: {
			:team_name => 'Charlotte Hornets',
			:colors => ['Turquoise', 'Purple'],
			:players => {
				'Jeff Adrien' => {
					:number => 4,
					:shoe => 18,
					:points => 10,
					:rebounds => 1,
					:assists => 1,
					:steals => 2,
					:blocks => 7,
					:slam_dunks => 2,
				},	
				'Bismak Biyombo' => {
					:number => 0,
					:shoe => 16,
					:points => 12,
					:rebounds => 4,
					:assists => 7,
					:steals => 7,
					:blocks => 15,
					:slam_dunks => 10,
				},	
				'DeSagna Diop' => {
					:number => 2,
					:shoe => 14,
					:points => 24,
					:rebounds => 12,
					:assists => 12,
					:steals => 4,
					:blocks => 5,
					:slam_dunks => 5,
				},
				'Ben Gordon' => {
					:number => 8,
					:shoe => 15,
					:points => 33,
					:rebounds => 3,
					:assists => 2,
					:steals => 1,
					:blocks => 1,
					:slam_dunks => 0 
				},
			'Brendan Haywood' => {
					:number => 33,
					:shoe => 15,
					:points => 6,
					:rebounds => 12,
					:assists => 12,
					:steals => 22,
					:blocks => 5,
					:slam_dunks => 12
					},

				}
			}
		
	}
	
end

def num_points_scored(player)

	game_hash.map do |x, v| 

		points = v[:players].map do |key, val| 

	 		if key == player.to_s 
	 		  return v[:players][player][:points]
	 		end

		end
# binding.pry
	end
	
end

def shoe_size(player)

	game_hash.map do |x, v| 

		shoe = v[:players].map do |key, val| 
	 		if key == player.to_s 
	 		  return v[:players][player][:shoe]
	 		end

		end
# binding.pry
	end
	
end

def team_colors(team)

	game_hash.map do |x, v| 
		if v[:team_name] == team
			return v[:colors]
		end
	end
	
end

def team_names
  arr = []
	
	game_hash.map do |x, v| 
			arr << v[:team_name]
	end
	arr

end

def player_numbers(team)

	arr = []

	game_hash.map do |x, v| 
		if v[:team_name] == team
			 	v[:players].each do |key, val|
			 			arr << val[:number]

			 	end
		end
	end

	arr
	
end

def player_stats(player)


		game_hash.map do |x, v| 

		stats = v[:players].map do |key, val| 
	 		if key == player.to_s 
	 		  return v[:players][player]
	 		end

		end
# binding.pry
	end
	
end

def big_shoe_rebounds


		game_hash.map do |x, v| 

			 return v[:players].sort_by {|key, val| val[:shoe] }.last[1][:rebounds]

	end 
end

def most_points_scored
		winner = ''
		count = 0
			game_hash.map do |x, v| 
				if v[:players].sort_by {|key, val| val[:points] }.last[1][:points] > count 
			  	winner = v[:players].sort_by {|key, val| val[:points] }.last[0]
			  	count = v[:players].sort_by {|key, val| val[:points] }.last[1][:points]
			  end
			end
		winner
end

def winning_team
		winner = ''
		count = 0
			game_hash.map do |x, v| 
				inner_count = 0

				v[:players].each do |key, val|
					inner_count += val[:points]
				end
				if inner_count > count
					winner = v[:team_name]
					count = inner_count
				end
			end
			winner
		
	
end

def player_with_longest_name

	winner = ''
		count = 0
			game_hash.map do |x, v| 
				if v[:players].sort_by {|key, val| key.length}.last[0].length > count 
			  	winner = v[:players].sort_by {|key, val| key.length}.last[0]
			  	count = v[:players].sort_by {|key, val| key.length}.last[0].length
			  	# binding.pry

			  end
			end
		winner
	
end

def long_name_steals_a_ton?

winner = ''
		count = 0
			game_hash.map do |x, v| 
				if v[:players].sort_by {|key, val| val[:steals] }.last[1][:steals] > count 
			  	winner = v[:players].sort_by {|key, val| val[:steals] }.last[0]
			  	count = v[:players].sort_by {|key, val| val[:steals] }.last[1][:steals]
			  end
			end
		winner == player_with_longest_name

	
end




