require "pry"

# Write your code here!
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
      :rebounds => 11,
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
      "Bismack Biyombo" => {
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 22,
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
      "Kemba Walker" => {
      :number => 33,
      :shoe => 15,
      :points => 6,
      :rebounds => 12,
      :assists => 12,
      :steals => 7,
      :blocks => 5,
      :slam_dunks => 12
      }
  }
}
}
end

def num_points_scored(player_name)
  game_hash.each do |team, attributes|
    attributes[:players].each do |name, values|
      if name == player_name
        return values[:points]
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |team, attributes|
    attributes[:players].each do |name, values|
      if name == player_name
        return values[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |team, attributes|
    if attributes[:team_name] == team_name
      return attributes[:colors]
      end
    end
  end
  
def team_names()
  array = []
  array << game_hash[:home][:team_name]
  array << game_hash[:away][:team_name]
  array
end
  
def player_numbers(team_name)
  jersey_array = []
  game_hash.each do |team, attributes|
    if attributes[:team_name] == team_name
      attributes[:players].each do |name, stats|
      jersey_array << stats[:number]
      end
      return jersey_array
    end
  end
end

def player_stats(player_name)
  game_hash.each do |team, attributes|
attributes[:players].each do |name, stats|
  if name == player_name
    return stats
  end
end
end
end

def big_shoe_rebounds()
  array = []
  game_hash.each do |team, attributes|
    attributes[:players].each do |name, stats|
      array << stats[:shoe]
    end
    biggest_shoes = array.max
    attributes[:players].each do |name, stats|
      if stats[:shoe] == biggest_shoes
        return stats[:rebounds]
      end
    end
  end
end