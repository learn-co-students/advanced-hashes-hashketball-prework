require "pry"

def game_hash
  {
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

def num_points_scored(name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, player_data|
          if player == name
            player_data.each do |category, data|
              if category == :points
                return data
              end
          end
        end
      end
    end
  end
end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, player_data|
          if player == name
            player_data.each do |category, data|
              if category == :shoe
                return data
              end
            end
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name && data == team_name  
        return game_hash[location][:colors]
      end
    end
  end
end

def team_names
  result = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        result << data
      end
    end
  end
  result
end

def player_numbers(team_name)
  jerseys = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name && data == team_name
        game_hash[location][:players].each do |player, player_data|
          player_data.each do |category, data|
            if category == :number
              jerseys << data
            end
          end
        end
      end
    end
  end
  jerseys
end

def player_stats(name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, data|
          if player == name
            return data
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  largest_shoe_size = 0
  largest_shoe_player = ""
  team = :none

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, data|
          data.each do |category, data|
            if category == :shoe
              if largest_shoe_size == 0 || data > largest_shoe_size
                largest_shoe_size = data
                largest_shoe_player = player
                team = location
              end
            end
          end
        end
      end
    end
  end
  game_hash[team][:players][largest_shoe_player][:rebounds]
end

def most_points_scored
  most_points = 0
  most_points_player = ""

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, data|
          data.each do |category, data|
            if category == :points
              if most_points == 0 || data > most_points
                most_points = data
                most_points_player = player
              end
            end
          end
        end
      end
    end
  end
  most_points_player
end

def winning_team
  home_score = 0
  away_score = 0

  game_hash[:home][:players].each do |player, data|
    data.each do |category, data|
      if category == :points
        home_score += data
      end
    end
  end

  game_hash[:away][:players].each do |player, data|
    data.each do |category, data|
      if category == :points
        away_score += data
      end
    end
  end

  if home_score > away_score
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  longest_name = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, data|
            if longest_name == "" || player.length > longest_name.length
              longest_name = player
            end
          end
        end
      end
    end
  longest_name
end

def long_name_steals_a_ton?
  most_steals = 0
  most_steals_player = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, data|
          data.each do |category, data|
            if category == :steals
              if most_steals == 0 || data > most_steals
                most_steals = data
                most_steals_player = player
              end
            end
          end
        end
      end
    end
  end

  most_steals_player == player_with_longest_name
end






























