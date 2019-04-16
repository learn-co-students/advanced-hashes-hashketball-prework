# Write your code here!
require "pry"
def game_hash
  g_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors:["Black", "White"],
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
    away: {
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
          rebounds:12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(player_name)
  points = nil
  game_hash.each {|team, att| points = att[:players][player_name][:points] if att[:players].has_key?(player_name)}
  #game_hash.each do |team, att|
  #  att[:players].each do |name, stat|
  #    if name == player_name
  #      points = stat[:points]
  #    end
  #    binding.pry
  #  end
  #end
  points
end

def shoe_size(player_name)
  size = nil
  game_hash.each {|team, att| size = att[:players][player_name][:shoe] if att[:players].has_key?(player_name)}
  size
end

def team_colors(team_name)
  colors = nil
  game_hash.each {|team, att| colors = att[:colors].to_a if att[:team_name] == team_name}
  colors
end

def team_names
  t_names = []
  game_hash.each {|team, att| t_names << att[:team_name]}
  t_names
end

def player_numbers(team_name)
  jersey_num = []
  game_hash.each do |team, att|
    if att[:team_name] == team_name
      att[:players].each do |player, stat|
        jersey_num << stat[:number]
      end
    end
  end
  jersey_num
end

def player_stats(player_name)
  stats = nil
  game_hash.each {|team, att| stats = att[:players][player_name] if att[:players].has_key?(player_name)}
  stats
end

def big_shoe_rebounds
  curr_size = 0
  rebounds = nil
  game_hash.each do |team, att|
    att[:players].each do |player,stat|
      if stat[:shoe] > curr_size
        curr_size = stat[:shoe]
        rebounds = stat[:rebounds]
      end
    end
  end
  rebounds
end
