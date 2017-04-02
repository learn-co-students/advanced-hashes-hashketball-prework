require 'pry'

# Write your code here!
def game_hash
  game_hash = {
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

# returns the number of points scored given player name
def num_points_scored(player)
  game_hash.each do |location, team_data|
    if team_data[:players][player]
      return team_data[:players][player][:points]
    end
  end
end

# returns the shoe size for a given player name
def shoe_size(player)
  game_hash.each do |location, team_data|
    if team_data[:players][player]
      return team_data[:players][player][:shoe]
    end
  end
end

# returns the array team colors for the given team name
def team_colors(team)
  game_hash.each do |location, team_data|
    # binding.pry
    if team_data[:team_name] == team
      return team_data[:colors]
    end
  end
end

# returns an array of the team names
def team_names
  teams = []
  game_hash.each do |location, team_data|
    teams << team_data[:team_name]
  end
  teams
end

# returns an array of jersey numbers for a given team name
def player_numbers(team)
  team_numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      team_data[:players].each do |player, stats|
        team_numbers << stats[:number]
      end
    end
  end
  team_numbers
end

# returns all stats for a given player
def player_stats(player)
  game_hash.each do |location, team_data|
    if team_data[:players][player]
      return team_data[:players][player]
    end
  end
end

# returns the number of rebounds of the player with the biggest shoe
def big_shoe_rebounds
  #determine the player with the biggest shoe
  biggest_player = nil
  biggest_size = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      if biggest_player == nil
        biggest_player = player
        biggest_size = stats[:shoe]
      end
      if stats[:shoe] > biggest_size
        biggest_player = player
        biggest_size = stats[:shoe]
      end
    end
  end
  # return the rebounds for the player
  game_hash.each do |location, team_data|
    if team_data[:players][biggest_player]
      return team_data[:players][biggest_player][:rebounds]
    end
  end
end
