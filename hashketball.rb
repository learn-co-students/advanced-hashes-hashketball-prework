require 'pry'
def game_hash
  game_hash = {:home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => {
      "Alan Anderson" => {
        :number => 0,
        :shoe  => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
        },
      "Reggie Evans" => {
        :number => 30,
        :shoe  => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
        },
      "Brook Lopez" => {
        :number => 11,
        :shoe  => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
        },
      "Mason Plumlee" => {
        :number => 1,
        :shoe  => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
        },
      "Jason Terry" => {
        :number => 31,
        :shoe  => 15,
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
        :shoe  => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
        },
      "Bismak Biyombo" => {
        :number => 0,
        :shoe  => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10
        },
      "DeSagna Diop" => {
        :number => 2,
        :shoe  => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
        },
      "Ben Gordon" => {
        :number => 8,
        :shoe  => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
        },
      "Brendan Haywood" => {
        :number => 33,
        :shoe  => 15,
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
def num_points_scored(players_name)
  game_hash.each do |team, info_category|
    info_category.each do |info, contents|
        if contents.is_a?(Hash)
          contents.each do |name, stats|
            if name == players_name
              return game_hash[team][info][name][:points]
            end
          end
        end
    end
  end 
end 
def shoe_size(players_name)
  game_hash.each do |team, info_category|
    info_category.each do |info, contents|
        if contents.is_a?(Hash)
          contents.each do |name, stats|
            if name == players_name
              return game_hash[team][info][name][:shoe]
            end
          end
        end
    end
  end 
end 
def team_colors(team_name)
  game_hash.each do |team, info_category|
    info_category.each do |info, contents|
      if contents == team_name
        return info_category[:colors]
      end 
    end 
  end 
end 
def team_names
  array = []
  game_hash.each do |team, info_category|
    info_category.each do |info, contents|
    if info == :team_name
      array << contents
    end 
  end
  end
  array
end 
def player_numbers(team_name_input)
  array = []
  game_hash.each do |team, info_category|
    info_category.each do |info, contents|
     if info_category[:team_name] == team_name_input
      if contents.is_a?(Hash)
        contents.each do |name, stats|
          stats.each do |statistic, value|
            if statistic == :number
              array << value
            end
          end
        end
      end
     end
    end
  end 
  array
end 
def player_stats(player)
    game_hash.each do |team, info_category|
    info_category.each do |info, contents|
        if contents.is_a?(Hash)
          contents.each do |name, stats|
            if name == player
              return stats
            end
          end
        end
    end
  end 
end 
def big_shoe_rebounds
    max_rebounds = 0 
    max_shoe = 0
    game_hash.each do |team, info_category|
    info_category.each do |info, contents|
      if contents.is_a?(Hash)
        contents.each do |name, stats|
          stats.each do |statistic, value|
            if statistic == :shoe && value > max_shoe
              max_shoe = value
              max_rebounds = stats[:rebounds]
            end 
          end
        end
      end
    end
  end 
  max_rebounds
end 
def most_points_scored
  player_name = ""
  max_points = 0
  game_hash.each do |team, info_category|
    info_category.each do |info, contents|
      if contents.is_a?(Hash)
        contents.each do |name, stats|
          stats.each do |statistic, value|
            #binding.pry
            if statistic == :points && value > max_points
                player_name = name
                max_points = value
            end 
          end
        end
      end
    end
  end 
  player_name
end 
def winning_team
  team_points = {"Charlotte Hornets" => 0, "Brooklyn Nets" => 0}
      game_hash.each do |team, info_category|
    info_category.each do |info, contents|
      if contents.is_a?(Hash)
        contents.each do |name, stats|
          stats.each do |statistic, value|
            team_points[game_hash[team][:team_name]] = team_points[game_hash[team][:team_name]] + stats[:points]
          end
        end
      end
    end
  end 
  winner = ""
  winning_points = 0
  team_points.each do |team_name, total_points|
    if total_points > winning_points
      winner = team_name
      winning_points = total_points
    end
  end
  winner
end 
def player_with_longest_name
  longest_name_length = 0 
  longest_name = ""
  game_hash.each do |team, info_category|
    info_category.each do |info, contents|
      if contents.is_a?(Hash)
        contents.each do |name, stats|
            if name.length > longest_name_length
              longest_name_length = name.length 
              longest_name = name
            end
        end
      end
    end
  end 
  longest_name
end 
def long_name_steals_a_ton?
    max_steals = 0 
    max_steals_player = ""
    game_hash.each do |team, info_category|
    info_category.each do |info, contents|
      if contents.is_a?(Hash)
        contents.each do |name, stats|
          stats.each do |statistic, value|
            #binding.pry
            if statistic == :steals && value > max_steals
              max_steals = value 
              max_steals_player = name
            end
          end
        end
      end
    end
  end
    longest_name_length = 0 
  longest_name = ""
  game_hash.each do |team, info_category|
    info_category.each do |info, contents|
      if contents.is_a?(Hash)
        contents.each do |name, stats|
            if name.length > longest_name_length
              longest_name_length = name.length 
              longest_name = name
            end
        end
      end
    end
  end 
  longest_name == max_steals_player
end