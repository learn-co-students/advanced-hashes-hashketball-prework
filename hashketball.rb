require "pry"

def game_hash
  {
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

def num_points_scored(player_name)
  game_hash.each do |team, total_info|
    total_info.each do |info, name|
      if info == :players
        name.each do |player, statistic|
          if player == player_name
            return statistic[:points]
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |team, total_info|
    total_info.each do |info, name|
      if info == :players
        name.each do |player, statistic|
          if player == player_name
            return statistic[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |team, total_info|
    total_info.each do |info, name|
      if name == team_name
        return game_hash[team][:colors]
      end
    end
  end
end

def team_names
  array = []
  game_hash.each do |team, total_info|
    total_info.each do |info, name|
      if info == :team_name
        array << name
      end
    end
  end
  array
end

def player_numbers(team_name)
  array = []
  game_hash.each do |team, total_info|
    total_info.each do |info, name|
      if info == :players && game_hash[team][:team_name] == team_name
        name.each do |player, statistic|
          array << statistic[:number]
        end
      end
    end
  end
  array
end

def player_stats(player_name)
  game_hash.each do |team, total_info|
    total_info.each do |info, name|
      if info == :players
        name.each do |player, statistic|
          if player == player_name
            return statistic
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  team_var = nil
  player_var = nil
  shoe_var = nil
  game_hash.each do |team, total_info|
    total_info.each do |info, name|
      if info == :players
        name.each do |player, statistic|
          if shoe_var == nil || shoe_var < statistic[:shoe]
            team_var = team
            player_var = player
            shoe_var = statistic[:shoe]
          end
        end
      end
    end
  end
  game_hash[team_var][:players][player_var][:rebounds]
end

def most_points_scored
  player_var = nil
  points_var = nil
  game_hash.each do |team, total_info|
    total_info.each do |info, name|
      if info == :players
        name.each do |player, statistic|
          if points_var == nil || points_var < statistic[:points]
            player_var = player
            points_var = statistic[:points]
          end
        end
      end
    end
  end
  player_var
end

def winning_team
  home_points = 0
  away_points = 0
  game_hash.each do |team, total_info|
    total_info.each do |info, name|
      if info == :players
        name.each do |player, statistic|
          if team == :home
            home_points += statistic[:points]
          elsif team == :away
            away_points += statistic[:points]
          end
        end
      end
    end
  end
  if home_points < away_points
    game_hash[:away][:team_name]
  elsif home_points > away_points
    game_hash[:home][:team_name]
  else
    "It's a tie!"
  end
end

def player_with_longest_name
  player_var = nil
  game_hash.each do |team, total_info|
    total_info.each do |info, name|
      if info == :players
        name.each do |player, statistic|
          if player_var == nil || player_var.length < player.length
            player_var = player
          end
        end
      end
    end
  end
  player_var
end

def long_name_steals_a_ton?
  player_steals = nil
  player_var = nil
  game_hash.each do |team, total_info|
    total_info.each do |info, name|
      if info == :players
        name.each do |player, statistic|
          if player_steals == nil || player_steals < statistic[:steals]
            player_steals = statistic[:steals]
            player_var = player
          end
        end
      end
    end
  end
  player_var == player_with_longest_name
end
