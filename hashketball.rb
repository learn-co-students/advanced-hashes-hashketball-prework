 require "pry"

 def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
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
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
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
          :steals =>22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(player_name)
  points = "Did not play"
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      if player == player_name
        points = player_hash[:points]
      end
    end
  end
  points
end

def shoe_size(player_name)
  size = "Did not play"
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      if player == player_name
        size = player_hash[:shoe]
      end
    end
  end
  size
end

def team_colors(team_name)
  colors = "Did not play"
  game_hash.each do |team, team_hash|
    if team_hash[:team_name] == team_name
      colors = team_hash[:colors]
    end
  end
  colors
end

def team_names
  teams = []
  game_hash.each do |team, team_hash|
    teams.push(team_hash[:team_name])
  end
  teams
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |team, team_hash|
    if team_hash[:team_name] == team_name
      team_hash[:players].each do |player, player_hash|
        numbers.push(player_hash[:number])
      end
    end
  end
  numbers
end

def player_stats(player_name)
  stats = {}
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      if player == player_name
        stats = player_hash
      end
    end
  end
  stats
end

def big_shoe_rebounds
  rebounds = "Player not found"
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      if player == largest_shoeholder
        rebounds = player_hash[:rebounds]
      end
    end
  end
  rebounds
end

def largest_shoeholder
  shoe_sizes = {}
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      shoe_sizes[player_hash[:shoe]] = player
    end
  end
  shoe_sizes.max[1]
end

