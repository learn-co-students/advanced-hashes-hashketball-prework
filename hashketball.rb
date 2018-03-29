# Write your code here!
def game_hash
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

def num_points_scored(player_name)
game_hash.each do |first, second|
  second.each do |first_key, first_value|
    if first_key == :players
      first_value.each do |name, info|
        if name.to_str == player_name
          return info[:points]
        end
      end
    end
  end
end
end

def shoe_size(player_name)
game_hash.each do |first, second|
  second.each do |first_key, first_value|
    if first_key == :players
      first_value.each do |name, info|
        if name.to_str == player_name
          return info[:shoe]
        end
      end
    end
  end
end
end

def team_colors(team_name)
  if team_name === "Brooklyn Nets"
    game_hash[:home][:colors]
  else team_name
    game_hash[:away][:colors]
  end
end

def team_names
  teams_array = []
  home_team = game_hash[:home][:team_name]
    teams_array<<home_team
  away_team = game_hash[:away][:team_name]
  teams_array<<away_team
end

def player_numbers(team_name)
player_numbers_array = []
game_hash.each do |first, second|
  if second[:team_name] == team_name
  second.each do |first_key, first_value|
    if first_key.to_s == "players"
      first_value.each do |name, info|
          player_numbers_array << info[:number]
      end
    end
  end
end
end
player_numbers_array
end

def shoe_size(player_name)
game_hash.each do |first, second|
  second.each do |first_key, first_value|
    if first_key == :players
      first_value.each do |name, info|
        if name.to_str == player_name
          return info[:shoe]
        end
      end
    end
  end
end
end

def player_stats(player_name)
game_hash.each do |first, second|
  second.each do |first_key, first_value|
    if first_key == :players
      first_value.each do |name, info|
        if name.to_str == player_name
          return info
        end
      end
    end
  end
end
end

def big_shoe_rebounds
shoe_size_array=[]
  game_hash.each do |first, second|
    second[:players].each do |name, data|
      shoe_size_array << [data[:shoe], data[:rebounds]]
    end
  end
  shoe_size_array = shoe_size_array.sort.reverse
  shoe_size_array[0][1]
end
