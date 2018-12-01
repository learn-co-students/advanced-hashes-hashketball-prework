require 'pry'

#game data
def game_hash
	game_hash = {
		home: {
			team_name: "Brooklyn Nets",
			colors: ["Black", "White"],
			players: {"Alan Anderson" => {
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
			players: {"Jeff Adrien" => {
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

#how many points did X player score?
def num_points_scored(player_name)
	points_scored = ""
	game_hash.each do |home_or_away, info_categories|
		info_categories.each do |category, info|
			if category == :players
				info.each do |names, stats|
					if names == player_name
						stats.each do |category, value|
							if category == :points
								points_scored = value
							end
						end
					end
				end
			end
		end
	end
	points_scored
end

#what is the shoe size of player X?
def shoe_size(player_name)
	shoe = 0
	game_hash.each do |home_or_away, info_categories|
		info_categories.each do |category, info|
			if category == :players
				info.each do |names, stats|
					if names == player_name
						stats.each do |category, value|
							if category == :shoe
								shoe = value
							end
						end
					end
				end
			end
		end
	end
	shoe
end

#what are the colors of X team?
def team_colors(team_name)
	colors = ""
	game_hash.each do |home_or_away, info_categories|
		info_categories.each do |category, info|
			if info.include?(team_name)
				colors = game_hash[home_or_away][:colors]
			end
		end
	end
	colors
end

#what are the names of the teams from the game?
def team_names
	teams = []
	game_hash.each do |home_or_away, info_categories|
		info_categories.each do |category, info|
			if category == :team_name
				teams << info
			end
		end
	end
	teams
end

#what are the jersey numbers of X team?
def player_numbers(team_name)
	numbers = []
	game_hash.each do |home_or_away, info_categories|
		if game_hash[home_or_away][:team_name] == team_name
			info_categories.each do |category, info|
				if category == :players
					info.each do |player_names, stats|
						stats.each do |stat, value|
							if stat == :number
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

#what are the game stats for X player?
def player_stats(player_name)
	player_stats = {}
	game_hash.each do |home_or_away, info_categories|
		info_categories.each do |category, info|
			if category == :players
				info.each do |names, stats|
					if names == player_name
						player_stats = stats
					end
				end
			end
		end
	end
	player_stats
end

#how many rebounds did the player with the biggest shoe have?
def big_shoe_rebounds
	largest_shoe_rebounds = 0
	shoe_collection = []
	game_hash.each do |home_or_away, info_categories|
		info_categories.each do |category, info|
			if category == :players
				info.each do |name, stats|
					stats.each do |stat, value|
						if stat == :shoe
							shoe_collection << value
						end
						stats.each do |stat, value|
							if stat == :shoe and value == shoe_collection.max
								largest_shoe_rebounds = game_hash[home_or_away][category][name][:rebounds]
							end
						end
					end
				end
			end
		end
	end
	largest_shoe_rebounds
end

#which player had the most points in the game?
def most_points_scored
	top_scorer = ""
	points_collection = []
	game_hash.each do |home_or_away, info_categories|
		info_categories.each do |category, info|
			if category == :players
				info.each do |names, stats|
					stats.each do |stat, value|
						if stat == :points
							points_collection << value
						end
						stats.each do |stat, value|
							if stat == :points and value == points_collection.max
								top_scorer = names
							end
						end
					end
				end
			end
		end
	end
	top_scorer
end

#who won?
def winning_team
	home_points = 0
	away_points = 0
	game_hash.each do |home_or_away, info_categories|
		if home_or_away == :home
			info_categories.each do |category, info|
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
		if home_or_away == :away
			info_categories.each do |category, info|
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

#which player has the longest name?
def player_with_longest_name
	player_names = []
	longest_name = ""
	game_hash.each do |home_or_away, info_categories|
		info_categories.each do |category, info|
			if category == :players
				info.each do |names, stats|
					player_names << names
				end
			end
		end
	end
	player_names.each do |name|
		if name.size > longest_name.size
			longest_name = name
		end
	end
	longest_name
end

#did the player with the longest name also get the most steals?
def long_name_steals_a_ton?
	long_name = player_with_longest_name
	check = false
	steals_collection = []
	game_hash.each do |home_or_away, info_categories|
		info_categories.each do |category, info|
			if category == :players
				info.each do |names, stats|
					stats.each do |stat, value|
						if stat == :steals
							steals_collection << value
						end
					end
					if names == long_name
						stats.each do |stat, value|
							if stat == :steals and value == steals_collection.max
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


