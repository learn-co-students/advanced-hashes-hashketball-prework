require "pry"
# Write your code here!
def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
        :players => {"Alan Anderson" => {
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
        :players => {"Jeff Adrien" => {
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

def num_points_scored(player_name)
	points = ""
	game_hash.each do |home_or_away, categories|
		categories.each do |category, info|
			if category == :players
				info.each do |names, stats|
					if names == player_name
						stats.each do |category, value|
							if category == :points
								points = value
							end
						end
					end
				end
			end
		end
	end
	points
end

def shoe_size(player_name)
	shoe_size = 0
	game_hash.each do |home_or_away, info_categories|
		info_categories.each do |category, info|
			if category == :players
				info.each do |names, stats|
					if names == player_name
						stats.each do |category, value|
							if category == :shoe
								shoe_size = value
							end
						end
					end
				end
			end
		end
 end
	shoe_size
end

def team_colors(team)
	colors = ""
	game_hash.each do |home_or_away, categories|
		categories.each do |category, info|
			if info.include?(team)
				colors = game_hash[home_or_away][:colors]
			end
		end
	end
	colors
end

def team_names
	teams = []
	game_hash.each do |home_or_away, categories|
		categories.each do |category, info|
			if category == :team_name
				teams << info
			end
		end
	end
	teams
end

def player_numbers(team)
  numbers = []
  game_hash.each do |home_or_away, categories|
    if game_hash[home_or_away][:team_name] == team
      categories.each do |category, info|
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

def player_stats(player_name)
  player_stats = {}
  game_hash.each do |home_or_away, categories|
    categories.each do |category, info|
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

def big_shoe_rebounds
  largest_shoe_size = 0
  shoes = []
	game_hash.each do |home_or_away, categories|
		categories.each do |category, info|
			if category == :players
				info.each do |name, stats|
					stats.each do |stat, value|
						if stat == :shoe
							shoes << value
						end
						stats.each do |stat, value|
							if stat == :shoe and value == shoes.max
								largest_shoe_size = game_hash[home_or_away][category][name][:rebounds]
							end
						end
					end
				end
			end
		end
	end
	largest_shoe_size
end
