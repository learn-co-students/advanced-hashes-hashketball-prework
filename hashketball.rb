# Write your code here!
require "pry"

def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number:0, shoe:16, points:22, rebounds:12, assists:12, steals:3, blocks:1, slam_dunks:1
        },
        "Reggie Evans" => {
          number:30, shoe:14, points:12, rebounds:12, assists:12, steals:12, blocks:12, slam_dunks:7
        },
        "Brook Lopez" => {
          number:11, shoe:17, points:17, rebounds:19, assists:10, steals:3, blocks:1, slam_dunks:15
        },
        "Mason Plumlee" => {
          number:1, shoe:19, points:26, rebounds:12, assists:6, steals:3, blocks:8, slam_dunks:5
        },
        "Jason Terry" => {
          number:31, shoe:15, points:19, rebounds:2, assists:2, steals:4, blocks:11, slam_dunks:1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number:4, shoe:18, points:10, rebounds:1, assists:1, steals:2, blocks:7, slam_dunks:2
        },
        "Bismak Biyombo" => {
          number:0, shoe:16, points:12, rebounds:4, assists:7, steals:7, blocks:15, slam_dunks:10
        },
        "DeSagna Diop" => {
          number:2, shoe:14, points:24, rebounds:12, assists:12, steals:4, blocks:5, slam_dunks:5
        },
        "Ben Gordon" => {
          number:8, shoe:15, points:33, rebounds:3, assists:2, steals:1, blocks:1, slam_dunks:0
        },
        "Brendan Haywood" => {
          number:33, shoe:15, points:6, rebounds:12, assists:12, steals:22, blocks:5, slam_dunks:12
        }
      }
    }
  }
end




def num_points_scored(name)
  num = 0
  game_hash.each { |team, atts|
    atts.each { |att, val|
      if att == :players
        val.each{ |player, stats|
          if player == name
            num = stats[:points]
          end
        }
      end
    }
  }
  num
end

def shoe_size(name)
  num = 0
  game_hash.each { |team, atts|
    atts.each { |att, val|
      if att == :players
        val.each{ |player, stats|
          if player == name
            num = stats[:shoe]
          end
        }
      end
    }
  }
  num
end

def team_colors(team_name)
  colors_team = []
  game_hash.select { |team, atts|
    if atts[:team_name] == team_name
      colors_team = atts[:colors]
    end
  }
  colors_team
end

def team_names
  names = []
  game_hash.each { |team, atts|
    names.push(atts[:team_name])
  }
names
end

def player_numbers(name)
  jersey_nos = []
  game_hash.each { |team, atts|
    if atts[:team_name] == name
      atts[:players].each { |player, stats|
        jersey_nos.push(stats[:number])
      }
    end
  }
  jersey_nos
end

def player_stats(player_name)
  player_stats = {}
  game_hash.each { |team, atts|
    atts[:players].each { |player, stats|
      if player == player_name
        player_stats = stats
      end
    }
  }
  player_stats
end

def big_shoe_rebounds
    player_name = ""
    curr_shoe_size = 0
    game_hash.each { |team, atts|
      atts[:players].each { |player, stats|
        if stats[:shoe] > curr_shoe_size
          curr_shoe_size = stats[:shoe]
          player_name = player
        end
      }
    }
    player_stats(player_name)[:rebounds]
end
