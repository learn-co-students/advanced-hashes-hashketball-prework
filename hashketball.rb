# Write your code here!
require 'pry'
def game_hash
  nba_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
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
        "Reggie Evans"=> {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
          }, 
        "Brook Lopez"=> {
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
      :colors => ["Turquoise","Purple"],
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
  nba_hash
end

def num_points_scored(player_name)
  game_hash.each do |home_away, data|
    data.each do |team_info, team_values|
     if team_info == :players
      team_values.each do |name, stats|
       if player_name == name
         return stats[:points]
       end
      end
     end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |home_away, data|
    data.each do |team_info, team_values|
      if team_info == :players
        team_values.each do |name, stats|
          if player_name == name
            return stats[:shoe]
          end
          team_values.each do |name, stats|
            if player_name == name
              return stats[:shoe]
            end
          end
        end
      end
    end
  end
end


def team_colors(team)
  game_hash.each do |home_away, data|
    if data[:team_name] == team
  #      binding.pry
          return data[:colors]
      data.each do |team_info, team_values|
        if team_info == :team_name
          binding.pry
          if :team_name == team
            return :colors
          end
        end
      end
    end  
  end
end

def team_names
  names_teams = []
  game_hash.each do |home_away, data|
    names_teams << data[:team_name]
  end
  return names_teams
end

def player_numbers(team)
  game_hash.each do |home_away, data|
    data.each do |team_info, team_values|
#      binding.pry
      if data[:team_name] == team
#        binding.pry
        numbers = []
        data[:players].each do |player_names, player_values|
#         binding.pry
          numbers << player_values[:number]
        end
        return numbers
      end
    end
  end
end

def player_stats(player)
  game_hash.each do |home_away, data|
    data.each do |team_info, team_values|
#     binding.pry
      if team_values == data[:players]
#        binding.pry
        team_values.each do |keys, values|
          if keys == player
#          binding.pry
            return values
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  game_hash.each do |home_away, data|
    data.each do |team_info, team_values|
#     binding.pry
      if team_values == data[:players]
#        binding.pry
        shoe_size_initiator = 0
        biggest_shoe_player = ""
        team_values.each do |keys, values|
          if values[:shoe] > shoe_size_initiator
            shoe_size_initiator = values[:shoe]
            biggest_shoe_player = keys
          binding.pry
          end
        end
      end
    end
  end
end
