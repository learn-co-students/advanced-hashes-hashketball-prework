# Write your code here!
require 'pry'
require 'benchmark'
def game_hash()
  return {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black","White"],
      players: {
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
    away:{
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
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

def num_points_scored(player)
  if game_hash[:home][:players].keys.include?(player)
    return game_hash[:home][:players][player][:points]
  else 
    return game_hash[:away][:players][player][:points]
  end
end

def shoe_size(player)
  game_hash.each do |location,stats|
    if game_hash[location][:players].keys.include?(player)
      return game_hash[location][:players][player][:shoe]
    end
  end
end
  
# def shoe_size(player) 
#   if game_hash[:home][:players].keys.include?(player)
#     return game_hash[:home][:players][player][:shoe]
#   else 
#     return game_hash[:away][:players][player][:shoe]
#   end
# end

def team_colors(team)
  if game_hash[:home][:team_name] == team
    return game_hash[:home][:colors]
  else 
    return game_hash[:away][:colors]
  end
end

def team_names()
  game_hash.map {|type,attributes| game_hash[type][:team_name]}
end

def player_numbers(team)
  game_hash.map do |location,value|
    if game_hash[location][:team_name] == team
      game_hash[location][:players].map do |player,stats|
        game_hash[location][:players][player][:number]
      end
    end
  end.flatten.compact
end  

# def player_numbers(team)
#   if game_hash[:home][:team_name] == team
#     return game_hash[:home][:players].map do |player,stats|
#         game_hash[:home][:players][player][:number]
#       end
#   else 
#     return game_hash[:away][:players].map do |player,stats|
#         game_hash[:away][:players][player][:number]
#       end
#   end
# end

def player_stats(player)
  game_hash.each do |location,value|
    if game_hash[location][:players].include?(player) 
      return game_hash[location][:players][player]
    end
  end
end

def big_shoe_rebounds()
  shoe = 0
  player = ""
  game_hash.each do |location,value|
     game_hash[location][:players].each do |name,stats|
      if game_hash[location][:players][name][:shoe] > shoe
        shoe = game_hash[location][:players][name][:shoe]
        player = name
      end
    end
  end
  
  if game_hash[:home][:players].keys.include?(player)
    return game_hash[:home][:players][player][:rebounds]
  else 
    return game_hash[:away][:players][player][:rebounds]
  end
end

# shoe_size("Jeff Adrien")
# 10.times {puts Benchmark.measure{player_numbers("Brooklyn Nets")}}
# 10.times {puts Benchmark.measure{player_stats("Jeff Adrien")}}