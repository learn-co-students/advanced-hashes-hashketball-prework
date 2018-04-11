require 'pry'
def game_hash# Write your code here!
  {
  home: {
    team_name: "Brooklyn Nets",
    colors: ["Black", "White"],
    players: {
      "Alan Anderson": {:number => 0, :shoe => 16, :points => 22, :rebounds => 12,
                      :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
      "Reggie Evans": {:number => 30, :shoe => 14, :points => 12, :rebounds => 12,
                      :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
      "Brook Lopez": {:number => 11, :shoe => 17, :points => 17, :rebounds => 19,
                      :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
      "Mason Plumlee": {:number => 1, :shoe => 19, :points => 26, :rebounds => 12,
                      :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
      "Jason Terry": {:number => 31, :shoe => 15, :points => 19, :rebounds => 2,
                      :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
                    }
                  },

  away: {
    team_name: "Charlotte Hornets",
    colors: ["Turquoise", "Purple"],
    players: {
      "Jeff Adrien": {:number => 4, :shoe => 18, :points => 10, :rebounds => 1,
                      :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
      "Bismak Biyombo": {:number => 0, :shoe => 16, :points => 12, :rebounds => 4,
                      :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10},
      "DeSagna Diop": {:number => 2, :shoe => 14, :points => 24, :rebounds => 12,
                      :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
      "Ben Gordon": {:number => 8, :shoe => 15, :points => 33, :rebounds => 3,
                      :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
      "Brendan Haywood": {:number => 33, :shoe => 15, :points => 6, :rebounds => 12,
                      :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12}
                    }
                  }
  }
end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry

        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end

def num_points_scored(name)
  game_hash.each do |team, team_info|
    game_hash[team].each do |atttributes, att_values|
      if atttributes.to_s == "players"
        if att_values.keys.include?(name.to_sym)
          return game_hash[team][atttributes][name.to_sym][:points]
        end
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |team, team_info|
    game_hash[team].each do |atttributes, att_values|
      if atttributes.to_s == "players"
        if att_values.keys.include?(name.to_sym)
          return game_hash[team][atttributes][name.to_sym][:shoe]
        end
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |location, location_info|
    game_hash[location].each do |loc_key, team_info|
      if game_hash[location][:team_name] == team
        return game_hash[location][:colors]
      end
    end
  end
end

def team_names
  teams = []
  game_hash.each do |location, location_values|
    game_hash[location].each do |key, value|
      if key == :team_name
        teams << value
      end
    end
  end
  return teams
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |location, location_values|
    game_hash[location].each do |key, value|
      if value == team_name
        game_hash[location][:players].each do |player_name, number|
          numbers << game_hash[location][:players][player_name][:number]
        end
      end
    end
  end
  numbers
end

def player_stats(player_name)
  game_hash.each do |location, loc_values|
    loc_values.each do |key, value|
      if key == :players
        value.each do |name, stats|
          if name == player_name.to_sym
            return stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  biggest = nil
  big_player = nil
  game_hash.each do |location, loc_values|
    loc_values.each do |team_categories, team_val|
      if team_categories == :players
        team_val.each do |player_name, stats|
          stats.each do |key, value|
            if key == :shoe
              if biggest == nil || biggest < value
                biggest = value
                big_player = game_hash[location][team_categories][player_name][:rebounds]
              end
            end
          end
        end
      end
    end
  end
  big_player
end
