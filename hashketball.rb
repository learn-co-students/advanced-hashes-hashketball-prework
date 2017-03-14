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
      }, :away => {
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

def num_points_scored(name)
  arr = []
  game_hash[:home][:players].each do |player, data|
    if player == name
      data.each do |stat, value|
        if stat == :points
          arr << value
        end
      end
    end
  end
  game_hash[:away][:players].each do |player, data|
    if player == name
      data.each do |stat, value|
        if stat == :points
          arr << value
        end
      end
    end
  end
  return arr[0]
end

def shoe_size(name)
  arr = []
  game_hash[:home][:players].each do |player, data|
    if player == name
      data.each do |stat, value|
        if stat == :shoe
          arr << value
        end
      end
    end
  end
  game_hash[:away][:players].each do |player, data|
    if player == name
      data.each do |stat, value|
        if stat == :shoe
          arr << value
        end
      end
    end
  end
  return arr[0]
end

def team_colors(team)
  arr = []
  game_hash[:home].each do |team_data, attribute|
    if attribute == team
      game_hash[:home].each do |team_data, attribute|
      if team_data == :colors
        return attribute
      end
      end
    end
  end
  game_hash[:away].each do |team_data, attribute|
    if attribute == team
      game_hash[:away].each do |team_data, attribute|
      if team_data == :colors
        return attribute
      end
      end
    end
  end
end

def team_names
  teams = []
  game_hash[:home].each do |team_data, attribute|
    if team_data == :team_name
      teams << attribute
    end
  end

  game_hash[:away].each do |team_data, attribute|
    if team_data == :team_name
      teams << attribute
    end
  end
  teams
end

def player_numbers(team)
  numbers = []
  game_hash[:home].each do |team_data, attribute|
    if attribute == team
      game_hash[:home][:players].each do |player, stats|
        stats.each do |stat, value|
          if stat == :number
            numbers << value
          end
        end
      end
    end
  end

  game_hash[:away].each do |team_data, attribute|
    if attribute == team
      game_hash[:away][:players].each do |player, stats|
        stats.each do |stat, value|
          if stat == :number
            numbers << value
          end
        end
      end
    end
  end
  numbers
end

def player_stats(name)
  game_hash[:home][:players].each do |player, data|
    if player == name
      return data
    end
  end

  game_hash[:away][:players].each do |player, data|
    if player == name
      return data
    end
  end
end

def big_shoe_rebounds
  shoes = []

  game_hash[:home][:players].each do |player, data|
    data.each do |stat, value|
      if stat == :shoe
        shoes << value
      end
    end
  end

  game_hash[:away][:players].each do |player, data|
    data.each do |stat, value|
      if stat == :shoe
        shoes << value
      end
    end
  end
  shoes = shoes.sort
  biggest = shoes[-1]

  game_hash[:home][:players].each do |player, data|
    data.each do |stat, value|
      if stat == :shoe && value == biggest
        data.each do |stat, value|
          if stat == :rebounds
            return value
          end
        end
      end
    end
  end
end

def most_points_scored
  points = []
  game_hash[:home][:players].each do |player, data|
    data.each do |stat, value|
      if stat == :points
        points << value
      end
    end
  end

  game_hash[:away][:players].each do |player, data|
    data.each do |stat, value|
      if stat == :points
        points << value
      end
    end
  end
  points = points.sort
  puts points[-1]
end

def winning_team
  home_points = 0
  away_points = 0
  game_hash[:home][:players].each do |player, data|
    data.each do |stat, value|
      if stat == :points
        home_points += value
      end
    end
  end

  game_hash[:away][:players].each do |player, data|
    data.each do |stat, value|
      if stat == :points
        away_points += value
      end
    end
  end

  if home_points > away_points
    return home_points
  else
    return away_points
  end
end
