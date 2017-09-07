require 'pry'
# Write your code here!

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ['Black', 'White'],
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
      colors: ['Turquoise', 'Purple'],
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

def find_player(name)
  if game_hash[:home][:players].key?(name.to_sym)
    game_hash[:home][:players][name.to_sym]
  else
    game_hash[:away][:players][name.to_sym]
  end
end

def find_team(name)
  if game_hash[:home][:team_name] == name
    game_hash[:home]
  else
    game_hash[:away]
  end
end

def num_points_scored(name)
  find_player(name)[:points]
end

def shoe_size(name)
  find_player(name)[:shoe]
end

def team_colors(name)
  find_team(name)[:colors]
end

def team_names
  [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(name)
  find_team(name)[:players].collect {|k,v| v[:number]}
end

def player_stats(name)
  find_player(name)
end

def big_shoe_rebounds
  all = game_hash[:home][:players].merge(game_hash[:away][:players])
  biggest = 0
  rebound = 0
  all.each do |k, v|
    if (v[:shoe] > biggest)
      biggest = v[:shoe]
      rebound = v[:rebounds]
    end
  end
  rebound
end
