require 'pry'

def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson": {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans": {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez": {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee": {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry": {
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
        "Jeff Adrien": {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo": {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop": {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon": {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood": {
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

def num_points_scored(player_name)
  player_points = 0
  game_hash.each do |location, team_data|
    game_hash[location][:players].each do |name, data|
      if name.to_s == player_name
        player_points = data[:points]
      end
    end
  end
  return player_points
end

def shoe_size(player_name)
  player_shoe = 0
  game_hash.each do |location, team_data|
    game_hash[location][:players].each do |name, data|
      if name.to_s == player_name
        player_shoe = data[:shoe]
      end
    end
  end
  return player_shoe
end

def team_colors(team)
  colors = []
  game_hash.each do |location, team_data|
    game_hash[location].each do |attribute, data|
      if game_hash[location][:team_name] == team
        colors = game_hash[location][:colors]
      end
    end
  end
  return colors
end

def team_names
  whose_playing = []
  game_hash.each do |location, team_data|
    game_hash[location].keys.include?(:team_name)
     whose_playing << game_hash[location][:team_name]
  end
  return whose_playing
end

def player_numbers(team)
  jersey_numbers = []
  game_hash.each do |location, team_data|
    if game_hash[location][:team_name] == team
      game_hash[location][:players].each do |name, data|
        jersey_numbers << data[:number]
        
      end
    end
  end
  return jersey_numbers
end

def player_stats(player)
  stats = {}
  game_hash.each do |location, team_data|
    game_hash[location][:players].each do |name, data|
      if name.to_s == player
        stats = data
      end
    end
  end
  return stats
end

def big_shoe_rebounds
  shoe_compare = []
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, data|
      shoe_compare << data[:shoe]
    end
  end
  largest_shoe = shoe_compare.sort.reverse.first
  game_hash.each do |location, team_data|
    game_hash[location][:players].each do |name, data|
      if data[:shoe] == largest_shoe
        return data[:rebounds]
      end  
    end
  end
end

def most_points_scored
  points_compare = []
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, data|
      points_compare << data[:points]
    end
  end
  most_points = points_compare.sort.reverse.first
  game_hash.each do |location, team_data|
    game_hash[location][:players].each do |name, data|
      if data[:points] == most_points
        return name.to_s
      end  
    end
  end
end

def winning_team
  home_team_total = []
  away_team_total = []
  game_hash[:home][:players].each do |attribute, data|
    home_team_total << data[:points]
  end
  game_hash[:away][:players].each do |attribute, data|
    away_team_total << data[:points]
  end
  if home_team_total.sum > away_team_total.sum
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  all_players = []
  game_hash.each do |location, team_data|
    game_hash[:away][:players].each do |name, data|
      all_players << name.to_s
    end
    game_hash[:home][:players].each do |name, data|
      all_players << name.to_s
    end
  end
  all_players.sort_by {|x| x.length}.reverse.first
end

def long_name_steals_a_ton?
  def most_steals_scored
    steals_compare = []
    game_hash.each do |location, team_data|
      team_data[:players].each do |name, data|
        steals_compare << data[:steals]
      end
    end
    most_steals = steals_compare.sort.reverse.first
    game_hash.each do |location, team_data|
      game_hash[location][:players].each do |name, data|
        if data[:steals] == most_steals
          return name.to_s
        end  
      end
    end
  end
  
  if most_steals_scored == player_with_longest_name
    return true
  else
    return false
  end
  
end
