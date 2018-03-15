require 'pry'
def game_hash
{
	:home => {
		:team_name => "Brooklyn Nets",
		:colors => ["Black", "White"],
		:players => [
			{
				:name => "Alan Anderson",	
				:number => 0,
				:shoe => 16,
				:points => 22,
				:rebounds => 12,
				:assists => 12,
				:steals => 3,
				:blocks => 1,
				:slam_dunks => 1
			}, {
				:name => "Reggie Evans",	
				:number => 30,
				:shoe => 14,
				:points => 12,
				:rebounds => 12,
				:assists => 12,
				:steals => 12,
				:blocks => 12,
				:slam_dunks => 7
			}, {
				:name => "Brook Lopez",
				:number => 11,
				:shoe => 17,
				:points => 17,
				:rebounds => 19,
				:assists => 10,
				:steals => 3,
				:blocks => 1,
				:slam_dunks => 15
			}, {
				:name => "Mason Plumlee",
				:number => 1,
				:shoe => 19,
				:points => 26,
				:rebounds => 12,
				:assists => 6,
				:steals => 3,
				:blocks => 8,
				:slam_dunks => 5
			}, {
				:name => "Jason Terry",	
				:number => 31,
				:shoe => 15,
				:points => 19,
				:rebounds => 2,
				:assists => 2,
				:steals => 4,
				:blocks => 11,
				:slam_dunks => 1
			}
		]
	},
	:away => {
		:team_name => "Charlotte Hornets",
		:colors => ["Turquoise", "Purple"],
		:players => [
			{
				:name => "Jeff Adrien",
				:number => 4,
				:shoe => 18,
				:points => 10,
				:rebounds => 1,
				:assists => 1,
				:steals => 2,
				:blocks => 7,
				:slam_dunks => 2
			}, {
				:name => "Bismak Biyombo",
				:number => 0,
				:shoe => 16,
				:points => 12,
				:rebounds => 4,
				:assists => 7,
				:steals => 7,
				:blocks => 15,
				:slam_dunks => 10 
			}, {
				:name => "DeSagna Diop",	
				:number => 2,
				:shoe => 14,
				:points => 24,
				:rebounds => 12,
				:assists => 12,
				:steals => 4,
				:blocks => 5,
				:slam_dunks => 5
			}, {
				:name => "Ben Gordon",
				:number => 8,
				:shoe => 15,
				:points => 33,
				:rebounds => 3,
				:assists => 2,
				:steals => 1,
				:blocks => 1,
				:slam_dunks => 0
			}, {
				:name => "Brendan Haywood",
				:number => 33,
				:shoe => 15,
				:points => 6,
				:rebounds => 12,
				:assists => 12,
				:steals => 22,
				:blocks => 5,
				:slam_dunks => 12
			}
		]
	}
}
end

def num_points_scored(name)
	points = ""
	game_hash.each do |location, data|
		data[:players].each do | stats|
			if stats[:name] == name
				points = stats[:points]
			end
		end			
	end
	points
end

def shoe_size(name)
	player_shoe = ""
	game_hash.each do |location, data|
		data[:players].each do |stats|
			if stats[:name] == name
				player_shoe = stats[:shoe]
			end
		end			
	end
	player_shoe
end

def team_colors(team)
	colors = []
	game_hash.each do |location, data|
		data[:colors].each do |value|
			if data[:team_name] == team
				colors << value
			end
		end			
	end
	colors
end

def team_names
	teams = []
	game_hash.each do |location, data|
		teams << data[:team_name]
	end
	teams			
end

def player_numbers(team)
	numbers = []
	game_hash.each do |location, data|
		data[:players].each do |stats|
			if data[:team_name] == team
				numbers << stats[:number]
			end
		end
	end
	numbers
end

def player_stats(name)
	ind_stats = {}
	game_hash.each do |location, data|
		data[:players].each do |stats|
			if stats[:name] == name
				stats.delete(:name)
				ind_stats = stats
			end
		end
	end
	ind_stats
end

def big_shoe_rebounds
	names = []
	shoes = []
	rebounds = []
	game_hash.each do |location, data|
		data[:players].each do |stats|
			names << stats[:name]
			shoes << stats[:shoe]
			rebounds << stats[:rebounds]
		end
	end
	biggest_shoes = shoes.each_with_index.max[1]
	rebounds[biggest_shoes]
end


