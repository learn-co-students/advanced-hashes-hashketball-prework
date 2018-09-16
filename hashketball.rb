require 'pry'

def game_hash
  game = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        }, {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        }, {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        }, {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        }, {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        }, {
          player_name: "Bismak Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        }, {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        }, {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        }, {
          player_name: "Brendan Haywood",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def all_player_stats
  game_hash.collect {|location,team|
    team[:players]
  }.flatten
end

def player_stat(player_name, stat_to_check)
  all_player_stats.each{|player,properties|
    if player[:player_name] == player_name
      return player[stat_to_check]
    end
  }
end

def num_points_scored(player)
  player_stat(player, :points)
end

def shoe_size(player)
  player_stat(player, :shoe)
end

def team_colors(team_name)
  team_colors = []
  game_hash.each{|location,team|
    if team[:team_name] == team_name
      team_colors = team[:colors]
    end
  }

  team_colors
end

def team_names
  teams = []
  game_hash.each {|location,team|
    teams << team[:team_name]
  }

  teams
end

def player_numbers(team_name)
  player_numbers = []
  game_hash.each {|location,team|
    if team[:team_name] == team_name
      team[:players].each {|player,stats|
        player_numbers << player[:number]
      }
    end
  }
  player_numbers = player_numbers.sort {|a,b|
    a <=> b
  }
end

def big_shoe_rebounds
  big_shoe_player = {}
  all_player_stats.each {|player,stats|
    if big_shoe_player[:shoe] == nil || player[:shoe] > big_shoe_player[:shoe]
      big_shoe_player = {
        shoe: player[:shoe],
        rebounds: player[:rebounds]
      }
    end
  }

  big_shoe_player[:rebounds]
end

def most_points_scored
  most_points_player = {}
  all_player_stats.each {|player,stats|
    if most_points_player[:points] == nil || player[:points] > most_points_player[:points]
      most_points_player = {
        points: player[:points],
        player_name: player[:player_name]
      }
    end
  }

  most_points_player[:player_name]
end

def total_points(location)
  points = game_hash[location][:players].collect {|player,stats|
    player[:points]
  }.flatten.inject(0, :+)
end

def winning_team
  winner = {}
  game_hash.keys.each {|location|
    team_points = total_points(location)
    if winner[:points] == nil || team_points > winner[:points]
      winner[:key] = location
      winner[:points] = team_points
    end
  }

  winner = game_hash[winner[:key]][:team_name]
end

def player_with_longest_name
  longest_name = nil
  all_player_stats.each {|player,stats|
    if longest_name == nil || player[:player_name].length > longest_name.length
      longest_name = player[:player_name]
    end
  }
  longest_name
end

def long_name_steals_a_ton?
  most_steals = {}
  all_player_stats.each {|player,stats|
    if most_steals[:steals] == nil || player[:steals] > most_steals[:steals]
      most_steals = {
        steals: player[:steals],
        player_name: player[:player_name]
      }
    end
  }

  most_steals[:player_name] == player_with_longest_name
end
