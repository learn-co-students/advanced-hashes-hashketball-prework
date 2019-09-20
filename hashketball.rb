require "pry"

def game_hash()
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
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
        }
      }
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
        }
      }
    }
  }
end

def shoe_size(player_name_string)
  return_value = "No such player!"
  game_hash.each {|game_hash_key_symbol, game_hash_value_hash|
    if game_hash_value_hash[:players].keys.include? player_name_string
      return_value = game_hash_value_hash[:players][player_name_string][:shoe]
    end
  }
  return_value
end

def num_points_scored(player_name_string)
  return_value = "No such player!"
  game_hash.each {|game_hash_key_symbol, game_hash_value_hash|
    if game_hash_value_hash[:players].keys.include? player_name_string
      return_value = game_hash_value_hash[:players][player_name_string][:points]
    end
  }
  return_value
end

def team_colors(team_name_string)
  return_value = "No such team!"
  game_hash.each {|key, value|
    if value[:team_name] == team_name_string
      return_value = value[:colors]
    end
  }
  return_value
end

def team_names()
  game_hash.collect {|game_hash_key_symbol, game_hash_value_hash|
    game_hash_value_hash[:team_name]
  }
end

def player_numbers(team_name_string)
  return_value = []
  game_hash.each {|game_hash_key_symbol, game_hash_value_hash|
    if game_hash_value_hash[:team_name] == team_name_string
      game_hash_value_hash[:players].each {|players_key, players_value|
        players_value.each {|key, value|
          return_value.push(value) if key == :number
        }
      }
    end
  }
  return_value
end

def player_stats(player_name_string)
  return_value = "No such player!"
  game_hash.each {|game_hash_key_symbol, game_hash_value_hash|
    if game_hash_value_hash[:players].keys.include? player_name_string
      return_value = game_hash_value_hash[:players][player_name_string]
    end
  }
  return_value
end

def big_shoe_rebounds()
  biggest_shoe = 0
  return_value = "Error"
  game_hash.each {|first_keys, first_values|
    first_values[:players].each {|player_keys, player_values|
      if player_values[:shoe] > biggest_shoe
        biggest_shoe = player_values[:shoe]
        return_value = player_values[:rebounds]
      end
    }
  }
  return_value
end
