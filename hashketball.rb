# Write your code here!
require "pry"

def game_hash
  game = {
    home: {
      team_name: ["Brooklyn Nets"],
      colors: ["Black, White"],
      players: {
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
        "Reggie Evans"	=> {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez"	=> {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee"	=> {
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
    away: {
      team_name: ["Charlotte Hornets"],
      colors: ["Turquoise, Purple"],
      players: {
        "Jeff Adrien"	=> {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo"	=> {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop"	=> {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon"	=> {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood"	=> {
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
  if game_hash[:home][:players].keys.include?(name)
    game_hash[:home][:players][name][:points]
  elsif game_hash[:away][:players].keys.include?(name)
    #possible to skip this line and use "else" for next line, but this covers
    #the edge case where the "name" isn't in the hash.
    game_hash[:away][:players][name][:points]
  end
end

def shoe_size(name)
  if game_hash[:home][:players].keys.include?(name)
    game_hash[:home][:players][name][:shoe]
  elsif game_hash[:away][:players].keys.include?(name)
    #possible to skip this line and use "else" for next line, but this covers
    #the edge case where the "name" isn't in the hash.
    game_hash[:away][:players][name][:shoe]
  end
end

def team_colors(team)
  if game_hash[:home][:team_name].join(" ") == team
    game_hash[:home][:colors][0].split(", ")
  elsif game_hash[:away][:team_name].join(" ") == team
    game_hash[:away][:colors][0].split(", ")
  end
end

def team_names
  names = []
  names << game_hash[:home][:team_name].join
  names << game_hash[:away][:team_name].join
  names
end

def player_numbers(team)
  jersey = []
  if game_hash[:home][:team_name].join(" ") == team
    game_hash[:home][:players].map do |player, attribute|
      attribute[:number]
    end
  elsif game_hash[:away][:team_name].join(" ") == team
    game_hash[:away][:players].map do |player, attribute|
      attribute[:number]
    end
  end
end

def player_stats(name)
  if game_hash[:home][:players].keys.include?(name)
    game_hash[:home][:players][name]
  elsif game_hash[:away][:players].keys.include?(name)
    game_hash[:away][:players][name]
  end
end

def big_shoe_rebounds
  name = " "
  size = 0
  game_hash[:home][:players].each do |player, attributes|
    if attributes[:shoe] > size
      size = attributes[:shoe]
      name = player
    end
  end
  game_hash[:away][:players].each do |player, attributes|
    if attributes[:shoe] > size
      size = attributes[:shoe]
      name = player
    end
  end
  if game_hash[:home][:players].keys.include?(name)
    game_hash[:home][:players][name][:rebounds]
  elsif game_hash[:away][:players].keys.include?(name)
    game_hash[:away][:players][name][:rebounds]
  end
end

def most_points_scored
  name = " "
  points = 0
  game_hash[:home][:players].each do |player, attributes|
    if attributes[:points] > points
      points = attributes[:points]
      name = player
    end
  end
  game_hash[:away][:players].each do |player, attributes|
    if attributes[:points] > points
      points = attributes[:points]
      name = player
    end
  end
  name
end

def winning_team
  home = 0
  away = 0
  game_hash[:home][:players].each do |player, attributes|
    home += attributes[:points]
  end
  game_hash[:away][:players].each do |player, attributes|
    away += attributes[:points]
  end
  if home > away
    game_hash[:home][:team_name].join
  else
    ame_hash[:away][:team_name].join
  end
end

def player_with_longest_name
  name = " "
  length = 0
  game_hash[:home][:players].keys.each do |player|
    if player.length > length
      length = player.length
      name = player
    end
  end
  game_hash[:away][:players].keys.each do |player|
    if player.length > length
      length = player.length
      name = player
    end
  end
  name
end

def long_name_steals_a_ton?
  name = " "
  length = 0
  game_hash[:home][:players].keys.each do |player|
    if player.length > length
      length = player.length
      name = player
    end
  end
  game_hash[:away][:players].keys.each do |player|
    if player.length > length
      length = player.length
      name = player
    end
  end
  name_steals = " "
  steals = 0
  game_hash[:home][:players].each do |player, attributes|
    if attributes[:steals] > steals
      steals = attributes[:steals]
      name_steals = player
    end
  end
  game_hash[:away][:players].each do |player, attributes|
    if attributes[:steals] > steals
      steals = attributes[:steals]
      name_steals = player
    end
  end
  name == name_steals
end
