require "pry"

def game_hash
  game = {
    :home => {
      :team_name =>"Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
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
        },
      },
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
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
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        },
      },
    }
  }  
game
end

def num_points_scored(player_name)
  game = game_hash
  points = ""
  game.each { |location, data|
    game[location].each { |category, data|
      if category == :players
        game[location][category].each { |player, stats|
          if player == player_name
            points = game[location][category][player][:points]
          end
        }
      end  
    }
  }
  points
end

def shoe_size(player_name)
  game = game_hash
  shoe = ""
  game.each { |location, data|
    game[location].each { |category, data|
      if category == :players
        game[location][category].each { |player, stats|
          if player == player_name
            shoe = game[location][category][player][:shoe]
          end
        }
      end
    }
  }
  shoe
end

def team_colors(team_name)
  game = game_hash
  colors = []
  game.each { |location, data|
    game[location].each { |category, data|
      if category == :team_name
        if team_name == game[location][category]
          colors = game[location][:colors]
        end
      end
    }
  }
  colors
end

def team_names
  game = game_hash
  names = []
  game.each { |location, data|
    game[location].each { |category, data|
      if category == :team_name
        names << game[location][:team_name]
      end
    }
  }
  names
end

def player_numbers(team_name)
  game = game_hash
  numbers = []
    game.each { |location, data|
      game[location].each { |category, data|
      if category == :team_name
        if team_name == game[location][category]
          game[location][:players].each { |player, stats|
            game[location][:players][player].each { |category, stat|
              if category == :number
                numbers << game[location][:players][player][category]
              end
            }
          }
        end
      end
    }
  }
  numbers
end

def player_stats(player_name)
  game = game_hash
  player_stats = {}
  game.each { |location, data|
    game[location].each { |category, data|
      if category == :players
        game[location][category].each { |player, stats|
          if player == player_name
            player_stats = game[location][category][player]
          end
        }
      end  
    }
  }
  player_stats
end

def big_shoe_rebounds
  game = game_hash
  shoe = 0
  biggest_player = ""
  game.each { |location, data|
    game[location].each { |category, data|
      if category == :players
        game[location][category].each { |player, stats|
          if game[location][category][player][:shoe] > shoe
            shoe = game[location][category][player][:shoe]
            biggest_player = player
          end
        }
      end
    }
  }
  rebounds = ""
  game.each { |location, data|
    game[location].each { |category, data|
      if category == :players
        game[location][category].each { |player, stats|
          if player == biggest_player
            rebounds = game[location][category][player][:rebounds]
          end
        }
      end
    }
  }
  rebounds
end