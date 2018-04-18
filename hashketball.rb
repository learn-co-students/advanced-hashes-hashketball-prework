require 'pry'
# Write your code here!
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
      :colors =>  ["Turquoise", "Purple"],
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

def num_points_scored(player_name)
  game_hash.each do |location, team_details|
    team_details.each do |attribute, values|
      if attribute == :players
        values.each do |player, stats|
          if player == player_name
           return game_hash[location][attribute][player][:points]
         end
        end
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, team_details|
    #binding.pry
    team_details.each do |attribute, values|
      #binding.pry
      if attribute == :players
        values.each do |player, stats|
        #  binding.pry
          if player == player_name
           return game_hash[location][attribute][player][:shoe]
         end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team_details|
    team_details.each do |attribute, values|
      if attribute == :team_name && values == team_name
        return game_hash[location][:colors]
      end
    end
  end
end

def team_names
  name_arr = []
  game_hash.each do |location, team_details|
    team_details.each do |attribute, values|
      if attribute == :team_name
        name_arr << game_hash[location][attribute]
      end
    end
  end
  name_arr
end

def player_numbers(team_name)
  numbers_arr = []
  game_hash.each do |location, team_details|
    team_details.each do |attribute, values|
      if attribute == :players && game_hash[location][:team_name] == team_name
        values.each do |player, stats|
          numbers_arr << game_hash[location][attribute][player][:number]
        end
      end
    end
  end
  numbers_arr
end

def player_stats(player_name)
  game_hash.each do |location, team_details|
    team_details.each do |attribute, values|
      if attribute == :players
        values.each do |name, stats|
          if name == player_name
            return stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  largest_shoe_size = 0
  largest_shoe_player = nil
  largest_rebounds = 0
  game_hash.each do |location, team_details|
    team_details.each do |attribute, values|
      if attribute == :players
        values.each do |name, stats|
          stats.each do |stat, value|
            if stat == :shoe
              if largest_shoe_size < game_hash[location][attribute][name][:shoe]
                largest_shoe_size = game_hash[location][attribute][name][:shoe]
                largest_shoe_player = name
                largest_rebounds = game_hash[location][attribute][name][:rebounds]
              end
            end
          end
        end
      end
    end
  end
    largest_rebounds
end

def most_points_scored
  most_points = 0
  highest_scorer = ""
  game_hash.each do |locations, team_details|
    team_details.each do |team_attribute, values|
      if team_attribute == :players
        values.each do |name, stats|
          stats.each do |stat, value|
            if stat == :points
              if value > most_points
                most_points = value
                highest_scorer = name
              end
            end
          end
        end
      end
    end
  end
  highest_scorer
end

def winning_team
  team_points = 0
  highest_score = 0
  winning_team = game_hash[:home][:team_name]
  game_hash.each do |locations, team_details|
    team_details.each do |team_attribute, values|
      if team_attribute == :players
        values.each do |name, stats|
          stats.each do |stat, value|
            if stat == :points
              team_points += value
            end
            if team_points > highest_score
              winning_team = game_hash[locations][:team_name]
            end
          end
        end
      end
    end
    highest_score = team_points
    team_points = 0
  end

  winning_team
end

def player_with_longest_name
  current_name = nil
  longest_name = ""
  game_hash.each do |locations, team_details|
    team_details.each do |team_attribute, values|
      if team_attribute == :players
        values.each do |name, stats|
          if name.length > longest_name.length
            longest_name = name
          end
        end
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  most_steals = 0
  biggest_stealer = nil

  game_hash.each do |locations, team_details|
    team_details.each do |team_attribute, values|
      if team_attribute == :players
        values.each do |name, stats|
          stats.each do |stat, value|
            if stat == :steals
              if value > most_steals
                most_steals = value
                biggest_stealer = name
              end
            end
          end
        end
      end
    end
  end

  biggest_stealer == player_with_longest_name
end
