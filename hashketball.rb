require "pry"

# Write your code here!
def game_hash
	#game_hash = 
	{
		home: {
			team_name: "Brooklyn Nets",
			colors: ["Black", "White"],
			players: {
				"Alan Anderson" => {
					number: 0,
					shoe: 16,
					points: 22,
					rebounds: 12,
					assists: 12,
					steals: 3,
					blocks: 1,
					slam_dunks: 1
				},
				"Reggie Evans" => {
					number: 30,
					shoe: 14,
					points: 12,
					rebounds: 12,
					assists: 12,
					steals: 12,
					blocks: 12,
					slam_dunks: 7
				},
				"Brook Lopez" => {
					number: 11,
					shoe: 17,
					points:17,
					rebounds: 19,
					assists: 10,
					steals: 3,
					blocks: 1,
					slam_dunks: 15
				},
				"Mason Plumlee" => {
					number: 1,
					shoe: 19,
					points: 26,
					rebounds: 12,
					assists: 6,
					steals: 3,
					blocks: 8,
					slam_dunks: 5
				},
				"Jason Terry" => {
					number: 31,
					shoe: 15,
					points: 19,
					rebounds: 2,
					assists: 2,
					steals: 4,
					blocks: 11,
					slam_dunks: 1
				}
			}
		},
		away: {
			team_name: "Charlotte Hornets",
			colors: ["Turquoise", "Purple"],
			players: {
				"Jeff Adrien" => {
					number: 4,
					shoe: 18,
					points: 10,
					rebounds: 1,
					assists: 1,
					steals: 2,
					blocks: 7,
					slam_dunks: 2
				},
				"Bismak Biyombo" => {
					number: 0,
					shoe: 16,
					points: 12,
					rebounds: 4,
					assists: 7,
					steals: 7,
					blocks: 15,
					slam_dunks: 10
				},
				"DeSagna Diop" => {
					number: 2,
					shoe: 14,
					points: 24,
					rebounds: 12,
					assists: 12,
					steals: 4,
					blocks: 5,
					slam_dunks: 5
				},
				"Ben Gordon" => {
					number: 8,
					shoe: 15,
					points: 33,
					rebounds: 3,
					assists: 2,
					steals: 1,
					blocks: 1,
					slam_dunks: 0
				},
				"Brendan Haywood" => {
					number: 33,
					shoe: 15,
					points: 6,
					rebounds: 12,
					assists: 12,
					steals: 22,
					blocks: 5,
					slam_dunks: 12
				}
			}
		}
	}
end

def num_points_scored(name)
	game_hash.each do |location, data|
		data[:players].map do |player, stats|
			if player == name
				return data[:players][player][:points]
			end
		end
	end
end

def shoe_size(name)
	game_hash.each do |location, data|
		data[:players].map do |player, stats|
			if player == name
				return data[:players][player][:shoe]
			end
		end
	end
end

def team_colors(team_name)
	game_hash.each do |location, data|
		if data[:team_name] == team_name
			return data[:colors]
		end
	end
end

def team_names
	game_hash.map do |location, data|
		data[:team_name]
	end
end

def player_numbers(team_name)
	array = []
	game_hash.each do |location, data|
		if data[:team_name] == team_name
			data[:players].map do |player, stats|
				array << stats[:number]
			end
		end
	end
	return array
end

def player_stats(name)
	new_hash = {}
	game_hash.each do |location, data|
		data[:players].each do |player, stats|
			if player == name
				new_hash = stats
			end
		end
	end
	return new_hash
end

def big_shoe_rebounds
	big_shoe_player = {}
	big_shoe = 0
	game_hash.each do |location, data|
		data[:players].each do |player, stats|
			if stats[:shoe] > big_shoe
				big_shoe = stats[:shoe]
				big_shoe_player = stats 
			end
		end
	return big_shoe_player[:rebounds]
	end
end

def most_points_scored
	winner = ""
	most_points = 0
	game_hash.each do |location, data|
		data[:players].each do |player, stats|
			if stats[:points] > most_points
				most_points = stats[:shoe]
				winner = player
			end
		end
	end
	return winner
end

def winning_team
	home_score = 0
	away_score = 0
	game_hash.each do |locaiton, data|
		data[:players].each do |player, stats|
			if location == :home
				home_score += stats[:points]
			elsif location == :away
				away_score += stats[:points]
			end
		end
	end
	if home_score > away_score
		return game_hash[:home][:team_name]
	elsif away_score > home_score
		return game_hash[:away][:team_name]
	end
end

def player_with_longest_name
	longest_name = ""
	game_hash.each do |location, data|
		data[:players].each do |player, stats|
			if player.length > longest_name.length
				longest_name = player
			end
		end
	end
	return longest_name
end

def long_name_steals_a_ton?
	steals_winner = ""
	most_steals = 0
	game_hash.each do |location, data|
		data[:players].each do |player, stats|
			if stats[:steals] > most_steals
				most_steals = stats[:steals]
				steals_winner = player
			end
		end
	end
	if longest_name == steals_winner
		return true
	else
		false
	end
end









