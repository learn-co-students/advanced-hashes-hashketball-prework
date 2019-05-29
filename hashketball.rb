require 'pry'


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

def num_points_scored(player_name)
  score = ""
  game_hash.each do |location, team_data|
    team_data.each do |team_keys, player_and_team_names|
      if team_keys == :players
        player_and_team_names.each do |name, stats|
          if name == player_name
            stats.each do |stats, value|
              if stats == :points
                score = value
              end
            end
          end
        end
      end
    end
  end
  score
end

def shoe_size(player_name)
  size = ""
  game_hash.each do |location, team_data|
    team_data.each do |team_keys, player_and_team_names|
      if team_keys == :players
        player_and_team_names.each do |name, stats|
          if name == player_name
            stats.each do |stats, value|
              if stats == :shoe
                size = value
              end
            end
          end
        end
      end
    end
  end
  size
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    team_data.each do |team_keys, data|
      color = []
      if game_hash[location][team_keys] == team_name
      return game_hash[location][:colors]
      end
    end
  end
end

def team_names
  names_array = []
  game_hash.each do |location, team_data|
    team_data.each do |team_keys, player_and_team_names|
      if team_keys == :team_name
        names_array << player_and_team_names
      end
    end
  end
  names_array
end

def player_numbers(team_name)
  num_array = []
  values_array = []
  game_hash.each do |location, team_data|
    values_array = team_data.values
    if values_array.include? team_name
      team_data.each do |team_keys, player_and_team_names|
        if team_keys == :players
          player_and_team_names.each do |player_name, stats|
            stats.each do |key, value|
              if key == :number
                num_array << value
              end
            end
          end
        end
      end
    end
  end
  num_array
end

def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |team_keys, player_and_team_names|
      if team_keys == :players
        player_and_team_names.each do |name, stats|
          if name == player_name
            return stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  big_shoe_player = ""
  biggest_shoe_size = 0

  game_hash.each do |location, team_data|
    team_data.each do |team_keys, player_and_team_names|
      if team_keys == :players
        player_and_team_names.each do |name, stats|
          stats.each do |category, number|
            if category == :shoe
              if number > biggest_shoe_size
                big_shoe_player = name
                biggest_shoe_size = number
              end
            end
          end
        end
      end
    end
  end

  game_hash.each do |location, team_data|
    team_data.each do |team_keys, player_and_team_names|
      if team_keys == :players
        player_and_team_names.each do |name, stats|
          if name == big_shoe_player
            stats.each do |category, number|
              if category == :rebounds
                return number
              end
            end
          end
        end
      end
    end
  end

end
