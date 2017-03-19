# Write your code here!
require "pry"

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

def num_points_scored(input_name)
  game_hash.each do |teams, team_hash|
    team_hash.each do |attribute, att_value|
      if attribute == :players
        att_value.each do |name, stats|
          if name == input_name
            stats.each do |stat, value|
              if stat == :points
                return value
              end
            end
          end
        end
      end
    end
  end
end

def shoe_size(input_name)
  game_hash.each do |teams, team_hash|
    team_hash.each do |attribute, att_value|
      if attribute == :players
        att_value.each do |name, stats|
          if name == input_name
            stats.each do |stat, value|
              if stat == :shoe
                return value
              end
            end
          end
        end
      end
    end
  end
end

def team_colors(team_input)
  return_array = []
  game_hash.each do |teams, team_hash|
    team_hash.each do |attribute, att_value|
      if att_value == team_input
        team_hash.each {|a, b| return_array << b if a == :colors}
      end
    end
  end
  return_array.flatten
end

def team_names
  return_array = []
  game_hash.each do |teams, team_hash|
    team_hash.each do |attribute, att_value|
      if attribute == :team_name
        return_array << att_value
      end
    end
  end
  return_array.flatten
end

# returns array of teams jersey numbers
def player_numbers(team_input)
  return_array = []
  game_hash.each do |teams, team_hash|
    team_hash.each do |attribute, att_value|
      if att_value == team_input
        team_hash.each do |attribute2, att_value2|
          if attribute2 == :players
            att_value2.each do |name, stats|
              stats.each do |stat, value|
                if stat == :number
                  return_array << value
                end
              end
            end
          end
        end
      end
    end
  end
  return_array.flatten
end

def player_stats(input_name)
  game_hash.each do |teams, team_hash|
    team_hash.each do |attribute, att_value|
      if attribute == :players
        att_value.each do |name, stats|
          if name == input_name
            return stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  return_arr = []
  game_hash.each do |teams, team_hash|
    team_hash.each do |attribute, att_value|
      if attribute == :players
        att_value.each do |name, stats|
          stats.each do |stat, value|
            arr = []
            if stat == :shoe
              arr << value
            end
            return_arr << arr
          end
        end
      end
    end
  end
  return_arr.flatten
  max_shoe = return_arr.max
  max = max_shoe[0]
  game_hash.each do |teams, team_hash|
    team_hash.each do |attribute, att_value|
      if attribute == :players
        att_value.each do |name, stats|
          stats.each do |stat, value|
            if stat == :shoe
              if max == value
                stats.each do |stat2, value2|
                  if stat2 == :rebounds
                    return value2
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
