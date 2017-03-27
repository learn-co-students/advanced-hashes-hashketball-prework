require 'pry'

def game_hash
	game_hash = {
		home: {
			team_name: "Brooklyn Nets",
			colors: ["Black", "White"],
			players: {
        "Alan Anderson" => {
				number: 0,
				shoe: 16,
				points:22,
				rebounds: 12,
				assists: 12,
				steals: 3,
				blocks: 1,
				slam_dunks: 1,
				},
				"Reggie Evans" => {
				number: 30,
				shoe: 14,
				points: 12,
				rebounds: 12,
				assists: 12,
				steals: 12,
				blocks: 12,
				slam_dunks: 7,
				},
				"Brook Lopez" => {
				number: 11,
				shoe: 17,
				points: 17,
				rebounds: 19,
				assists: 10,
				steals: 3,
				blocks: 1,
				slam_dunks: 15,
				},
				"Mason Plumlee" => {
				number: 1,
				shoe: 19,
				points: 26,
				rebounds: 12,
				assists: 6,
				steals: 3,
				blocks: 8,
				slam_dunks: 5,
				},
				"Jason Terry" => {
				number: 31,
				shoe: 15,
				points: 19,
				rebounds: 2,
				assists: 2,
				steals: 4,
				blocks: 11,
				slam_dunks: 1,
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
				slam_dunks: 2,
				},
				"Bismak Biyombo" => {
				number: 0,
				shoe: 16,
				points: 12,
				rebounds: 4,
				assists: 7,
				steals: 7,
				blocks: 15,
				slam_dunks: 10,
				},
				"DeSagna Diop" => {
				number: 2,
				shoe: 14,
				points: 24,
				rebounds: 12,
				assists: 12,
				steals: 4,
				blocks: 5,
				slam_dunks: 5,
				},
				"Ben Gordon" => {
				number: 8,
				shoe: 15,
				points: 33,
				rebounds: 3,
				assists: 2,
				steals: 1,
				blocks: 1,
				slam_dunks: 0,
				},
				"Brendan Haywood" => {
				number: 33,
				shoe: 15,
				points: 6,
				rebounds: 12,
				assists: 12,
				steals: 22,
				blocks: 5,
				slam_dunks: 12,
				}
			}
		}
	}
end

def num_points_scored(player_name)
	result = ""
	game_hash.each do |location, info|
		info.each do |category, info|
			if category == :players
				info.each do |names, value|
					if names == player_name
						value.each do |category, value|
							if category == :points
								result = value
							end
						end
					end
				end
			end
		end
	end
	result
end

def shoe_size(player_name)
	result = ''
	game_hash.each do |location, info|
		info.each do |category, info|
			if category == :players
				info.each do |names, value|
					if names == player_name
						value.each do |category, value|
							if category == :shoe
								result = value
							end
						end
					end
				end
			end
		end
	end
	result
end

def team_colors(colors)
	result = ""
	game_hash.each do |location, info|
		info.each do |category, info|
			if info.include?(colors)
				result = game_hash[location][:colors]
			end
		end
	end
	result
end

def team_names
	result = []
	game_hash.each do |location, info|
		info.each do |category, info|
			if category == :team_name
				result << info
			end
		end
	end
	result
end

def player_numbers(team_name)
	numbers = []
	game_hash.each do |location, info|
		if game_hash[location][:team_name] == team_name
			info.each do |category, info|
				if category == :players
					info.each do |player_names, value|
						value.each do |key, value|
							if key == :number
								numbers << value
							end
						end
					end
				end
			end
		end
	end
	numbers
end

def player_stats(player_name)
	player_stats = {}
	game_hash.each do |location, info|
		info.each do |category, info|
			if category == :players
				info.each do |names, value|
					if names == player_name
						player_stats = value
					end
				end
			end
		end
	end
	player_stats
end

def big_shoe_rebounds
	largest = 0
	all_points = []
	game_hash.each do |location, info|
		info.each do |category, info|
			if category == :players
				info.each do |name, stats|
					stats.each do |key, value|
						if key == :shoe
							all_points << value
						end
						stats.each do |key, value|
							if key == :shoe && value == all_points.max
								largest = game_hash[location][category][name][:rebounds]
							end
						end
					end
				end
			end
		end
	end
	largest
end

def most_points_scored
	max_score = ""
	all_points = []
	game_hash.each do |location, info|
		info.each do |category, info|
			if category == :players
				info.each do |names, stats|
					stats.each do |stat, value|
						if stat == :points
							all_points << value
						end
						stats.each do |stat, value|
							if stat == :points && value == all_points.max
								max_score = names
							end
						end
					end
				end
			end
		end
	end
	max_score
end

def winning_team
	home_points = 0
	away_points = 0
	game_hash.each do |location, info|
		if location == :home
			info.each do |category, info|
				if category == :players
					info.each do |names, stats|
						stats.each do |stat, value|
							if stat == :points
								home_points += value
							end
						end
					end
				end
			end
		end
		if location  == :away
			info.each do |category, info|
				if category == :players
					info.each do |names, stats|
						stats.each do |stat, value|
							if stat == :points
								away_points += value
							end
						end
					end
				end
			end
		end
	end
	if home_points > away_points
		game_hash[:home][:team_name]
		else
			game_hash[:away][:team_name]
	end
end

def player_with_longest_name
	player_names = []
	longest = ""
	game_hash.each do |location , info|
		info .each do |category, info|
			if category == :players
				info.each do |names, stats|
					player_names << names
				end
			end
		end
	end
	player_names.each do |name|
		if name.size > longest.size
			longest = name
		end
	end
	longest
end

def long_name_steals_a_ton?
	check = false
	all_steals = []
	game_hash.each do |location , info|
		info .each do |category, info|
			if category == :players
				info.each do |names, stats|
					stats.each do |stat, value|
						if stat == :steals
							all_steals << value
						end
					end
					if names == player_with_longest_name
						stats.each do |stat, value|
							if stat == :steals && value == all_steals.max
								check = true
							end
						end
					end
				end
			end
		end
	end
	check
end
