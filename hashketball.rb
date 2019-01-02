# Write your code here!
require "pry"

def game_hash
  hashketball = {
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

def num_points_scored(name)
  game_hash.each do |team_side, team_info|
    team_info.each do |key, info|
      if key == :players
        info.each do |player_name, stat|
          if player_name == name
            return stat[:points]
          end
        end
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |team_side, team_info|
    team_info.each do |key, info|
      if key == :players
        info.each do |player_name, stat|
          if player_name == name
            return stat[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |team_side, team_info|
    team_info.each do |key, info|
      if info == team_name
        return team_info.values[1]
      end
    end
  end
end

def team_names
  team_names = []
  game_hash.each do |team_side, team_info|
    team_info.each do |key, info|
      if key == :team_name
        team_names << info
      end
    end
  end
  team_names
end

def player_numbers(team_name)
  team_numbers = []
  game_hash.each do |team_side, team_info|
    team_info.each do |key, info|
      if info == team_name
        team_info.each do |key, info|
          if key == :players
            info.each do |player_name, stat|
              team_numbers << stat[:number]
            end
          end
        end
      end
    end
  end
  team_numbers
end

def player_stats(name)
  game_hash.each do |team_side, team_info|
    team_info.each do |key, info|
      if key == :players
        info.each do |player_name, stat|
          if player_name == name
            return stat
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  biggest_shoe = 0
  name = ""

  game_hash.each do |team_side, team_info|
    team_info.each do |key, info|
      if key == :players
        info.each do |player_name, stat|
          if shoe_size(player_name) > biggest_shoe
            biggest_shoe = shoe_size(player_name)
            name = player_name
          end
        end
      end
    end
  end

  game_hash.each do |team_side, team_info|
    team_info.each do |key, info|
      if key == :players
        info.each do |player_name, stat|
          if player_name == name
            return stat[:rebounds]
          end
        end
      end
    end
  end
end

def most_points_scored
  most_points = 0
  name = ""

  game_hash.each do |team_side, team_info|
    team_info.each do |key, info|
      if key == :players
        info.each do |player_name, stat|
          if num_points_scored(player_name) > most_points
            most_points = num_points_scored(player_name)
            name = player_name
          end
        end
      end
    end
  end
  name
end

def winning_team
  home_total = 0
  away_total = 0

  game_hash.each do |team_side, team_info|
    if team_side == :home
      team_info.each do |key, info|
        if key == :players
          info.each do |player_name, stat|
            home_total += num_points_scored(player_name)
          end
        end
      end
    elsif team_side == :away
      team_info.each do |key, info|
        if key == :players
          info.each do |player_name, stat|
            away_total += num_points_scored(player_name)
          end
        end
      end
    end
  end
  if home_total > away_total
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  longest_name = ""

  game_hash.each do |team_side, team_info|
    team_info.each do |key, info|
      if key == :players
        info.each do |player_name, stat|
          if player_name.length > longest_name.length
            longest_name = player_name
          end
        end
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  num_steals = 0
  most_steals = ""

  game_hash.each do |team_side, team_info|
    team_info.each do |key, info|
      if key == :players
        info.each do |player_name, stat|
          if stat[:steals] > num_steals
            num_steals = stat[:steals]
            most_steals = player_name
          end
        end
      end
    end
  end
  most_steals == player_with_longest_name ? true : false
end
