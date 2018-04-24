require "pry"

def game_hash
  game = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1,
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7,
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15,
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5,
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1,
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
          slam_dunks: 2,
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10,
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5,
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0,
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12,
        }
      }
    }
  }
end


def num_points_scored(player)
  points = 0
  game_hash.each do |team, team_data|
    if game_hash[team][:players].include?(player)
      points += game_hash[team][:players][player][:points]
    end
  end
  points
end

def shoe_size(player)
  size = 0
  game_hash.each do |team, team_data|
    if game_hash[team][:players].include?(player)
      size += game_hash[team][:players][player][:shoe]
    end
  end
  size
end

def team_colors(team)
  colors = []
  game_hash.each do |location, data|
    if game_hash[location][:team_name] == team
      colors += game_hash[location][:colors]
    end
  end
  colors
end

def team_names
  teams = []
  game_hash.each do |location, data|
    teams << game_hash[location][:team_name]
  end
  teams
end

def player_numbers(team)
  jersey_nums = []
  game_hash.each do |location, data|
    if game_hash[location][:team_name] == team
      game_hash[location][:players].each do |player, stat|
        jersey_nums << game_hash[location][:players][player][:number]
      end
    end
  end
  jersey_nums
end

def player_stats(player)
  stats = {}
  game_hash.each do |location, data|
    data.each do |team_stat, data|
      if game_hash[location][:players].include?(player)
        stats = game_hash[location][:players][player]
      end
    end
  end
  stats
end

def big_shoe_rebounds
  current_max_shoe = 0
  max_shoe_rebounds = 0

  game_hash.each do |location, data|
    game_hash[location][:players].each do |player, data|
      if game_hash[location][:players][player][:shoe] > current_max_shoe
        current_max_shoe = game_hash[location][:players][player][:shoe]
        max_shoe_rebounds = game_hash[location][:players][player][:rebounds]
      end
    end
  end

  max_shoe_rebounds
end
