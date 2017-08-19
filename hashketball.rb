# Write your code here!
require 'pry'

def game_hash
	{
		:home => {
			:team_name => "Brooklyn Nets",
			:colors => ["Black", "White"],
			:players => {
				"Alan Anderson" => {
					:number => 0,
					:shoe => 16,
					:points => 22,
					:rebounds => 12,
					:assists => 12,
					:steals => 3,
					:blocks => 1,
					:slam_dunks => 1
				},
				"Reggie Evans" => {
					:number => 30,
					:shoe => 14,
					:points => 12,
					:rebounds => 12,
					:assists => 12,
					:steals => 12,
					:blocks => 12,
					:slam_dunks => 7
				},
				"Brook Lopez" => {
					:number => 11,
					:shoe => 17,
					:points => 17,
					:rebounds => 19,
					:assists => 10,
					:steals => 3,
					:blocks => 1,
					:slam_dunks => 15
				},
				"Mason Plumlee" => {
					:number => 1,
					:shoe => 19,
					:points => 26,
					:rebounds => 12,
					:assists => 6,
					:steals => 3,
					:blocks => 8,
					:slam_dunks => 5
				},
				"Jason Terry" => {
					:number => 31,
					:shoe => 15,
					:points => 19,
					:rebounds => 2,
					:assists => 2,
					:steals => 4,
					:blocks => 11,
					:slam_dunks => 1
				}
			}
		},
		:away => {
			:team_name => "Charlotte Hornets",
			:colors => ["Turquoise", "Purple"],
			:players => {
				"Jeff Adrien" => {
					:number => 4,
					:shoe => 18,
					:points => 10,
					:rebounds => 1,
					:assists => 1,
					:steals => 2,
					:blocks => 7,
					:slam_dunks => 2
				},
				"Bismak Biyombo" => {
					:number => 0,
					:shoe => 16,
					:points => 12,
					:rebounds => 4,
					:assists => 7,
					:steals => 7,
					:blocks => 15,
					:slam_dunks => 10
				},
				"DeSagna Diop" => {
					:number => 2,
					:shoe => 14,
					:points => 24,
					:rebounds => 12,
					:assists => 12,
					:steals => 4,
					:blocks => 5,
					:slam_dunks => 5
				},
				"Ben Gordon" => {
					:number => 8,
					:shoe => 15,
					:points => 33,
					:rebounds => 3,
					:assists => 2,
					:steals => 1,
					:blocks => 1,
					:slam_dunks => 0
				},
				"Brendan Haywood" => {
					:number => 33,
					:shoe => 15,
					:points => 6,
					:rebounds => 12,
					:assists => 12,
					:steals => 22,
					:blocks => 5,
					:slam_dunks => 12
				}
			}
		}
	}
end

def player_stats(player)
	play_hash = {}
	game_hash.each do |team, data|
		data.each do |keys, player_data|
			if keys == :players
				player_data.each do |name, stats|
					if name == player
						play_hash = stats
					end
				end
			end
		end
	end
	play_hash
end

def num_points_scored(player)
	play_hash = player_stats(player)
	scored = 0
	play_hash.each do |stat, integ|
		if stat == :points
			scored = integ
		end
	end
	scored
end

def shoe_size(player)
	play_hash = player_stats(player)
	size = 0
	play_hash.each do |stat, integ|
		if stat == :shoe
			size = integ
		end
	end
	size
end

def team_colors(team)
	team_array = []
	game_hash.each do |teams, team_data|
		team_data.each do |keys, vals|
			if team_data[:team_name] == team
				team_array = team_data[:colors]
			end
		end
	end
	team_array
end

def team_names
	team_name_array = []
	game_hash.each do |teams, team_data|
		team_data.each do |key, val|
			if key == :team_name
				team_name_array << val
			end
		end
	end
	team_name_array
end

def player_numbers(team_name)
	player_num_array = []
	game_hash.each do |team, data|
		data.each do |keyes, team_data|
			if team_name == data[:team_name]
				if keyes == :players
					team_data.each do |name, play_hash|
						play_hash.each do |stat_key, stat_val|
							if stat_key == :number
								player_num_array << stat_val
							end
						end
					end
				end
			end
		end
	end
	player_num_array
end

def big_shoe_rebounds
	# get all player names then make new hash of player names and shoe sizes
	# get key of largest value .max.key
	# use player stats to get rebounds
	player_shoe_hash = {}
	game_hash.each do |team, data|
		data.each do |keys, team_data|
			if keys == :players
				team_data.each do |player_name, player_stats|
					player_shoe_hash[player_name] = shoe_size(player_name)
				end
			end
		end
	end
	big_shoe_player = player_shoe_hash.key(player_shoe_hash.values.max)
	player_stats(big_shoe_player)[:rebounds]
end