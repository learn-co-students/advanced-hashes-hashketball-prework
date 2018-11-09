# Write your code here!
require 'pry'

def game_hash
  game_hash = {
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
       :team_name  => "Charlotte Hornets",
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

def num_points_scored(players_name)
  game_hash[:home][:players].each do |name, value|
    if players_name == name
      return game_hash[:home][:players][name][:points]
    end
  end

  game_hash[:away][:players].each do |name, value|
    if players_name == name
      return game_hash[:away][:players][name][:points]
    end
  end
end

def shoe_size(players_name)
  game_hash[:home][:players].each do |name, value|
    if players_name == name
      return game_hash[:home][:players][name][:shoe]
    end
  end

  game_hash[:away][:players].each do |name, value|
    if players_name == name
      return game_hash[:away][:players][name][:shoe]
    end
  end
end

def team_colors(team_name)
  game_hash.each do |team, info|
    info.each do |x, y|
      if team_name == y.to_s
        return game_hash[team][:colors]
      end
    end
  end
end

def team_names
  array = []
  game_hash.each do |team, info|
    game_hash[team].each do |x, y|
      if x == :team_name
        array << y
      end
    end
  end
  array
end

def player_numbers(team_name)
  nets_array = []
  hornets_array = []
  game_hash[:home][:players].each do |x, y|
    y.each do |a, b|
      if a == :number
        nets_array << b
      end
    end
  end

  game_hash[:away][:players].each do |x, y|
    y.each do |a, b|
      if a == :number
        hornets_array << b
      end
    end
  end
  if team_name == "Brooklyn Nets"
    nets_array
  else team_name == "Charlotte Hornets"
    hornets_array
  end
end

def player_stats(player)
  game_hash[:home][:players].each do |x, y|
    if player == x
      return y
    end
  end

  game_hash[:away][:players].each do |x, y|
    if player == x
      return y
    end
  end
end

def big_shoe_rebounds
  first = game_hash[:home][:players]["Alan Anderson"][:shoe]
  largest = nil
  game_hash[:home][:players].each do |x, y|
    y.each do |a, b|
      if a == :shoe && b > first
        first = b
        largest = y[:rebounds]
      end
    end
  end
  game_hash[:away][:players].each do |x, y|
    y.each do |a, b|
      if a == :shoe && b > first
        first = b
        largest = y[:rebounds]
      end
    end
  end
  largest
end
