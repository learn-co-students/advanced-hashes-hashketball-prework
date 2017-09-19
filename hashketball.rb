# Write your code here!
require "pry"
def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(player, hash = game_hash)
  #binding.pry
  if hash[:home][:players].keys.include?(player)
    return hash[:home][:players][player][:points]
  elsif hash[:away][:players].keys.include?(player)
    return hash[:away][:players][player][:points]
  end
end

def shoe_size(player, hash = game_hash)
  hash.each_key do |key|
    return hash[key][:players][player][:shoe] if hash[key][:players].keys.include?(player)
  end
end

def team_colors(team, hash = game_hash)
  hash.each_key do |key|
    if hash[key][:team_name] == team
      return hash[key][:colors]
    end
  end
end

def team_names(hash = game_hash)
  arr = []
  hash.each_key do |key|
    arr << hash[key][:team_name]
  end
  arr
end

def player_numbers(team, hash = game_hash)
  arr = []
  hash.each_key do |key|
    if hash[key][:team_name] == team
      hash[key][:players].each do |player, stats|
        arr << stats[:number]
      end
    end
  end
  arr
end

def player_stats(player, hash = game_hash)
  hash.each_key do |key|
    if hash[key][:players].keys.include?(player)
      return hash[key][:players][player]
    end
  end
end

def big_shoe_rebounds(hash = game_hash)
  foot = 0
  bound = 0
  hash.each_key do |side|
    hash[side][:players].each_key do |player|
      if hash[side][:players][player][:shoe] > foot
        bound = hash[side][:players][player][:rebounds]
        foot = hash[side][:players][player][:shoe]
      end
    end
  end
  bound
end
