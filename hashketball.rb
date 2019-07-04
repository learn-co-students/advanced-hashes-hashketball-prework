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
  game_hash.each do |location, details|
    details[:players].each do |name, stats|
      if player_name == name
        return stats[:points]
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, details|
    details[:players].each do |name, stats|
      if player_name == name
        return stats[:shoe]
      end
    end
  end
end

def team_colors(team)
  colors = []
  game_hash.each do |location, details|
    details.each do |item, value|
      if value == team
        colors << game_hash[location][:colors]
      end
    end
  end
  colors.flatten
end

def team_names
  team_names = []
  game_hash.each do |location, details|
    details.each do |item, value|
      if item == :team_name
        team_names << value
      end
    end
  end
  team_names
end

def player_numbers (team)
  player_numbers_list = []
  game_hash.each do |location, details|
    if details[:team_name] == team
      details[:players].each do |player, stuff|
        player_numbers_list << stuff[:number]
      end
    end
  end
  player_numbers_list
end

def player_stats(player_name)
  game_hash.each do |location, details|
    details[:players].each do |name, info|
      if player_name == name
        return info
      end
    end
  end
end

def big_shoe_rebounds
  shoe_size = 0
  rebounds = 0
  game_hash.each do |location, details|
    details[:players].each do |name, info|
      if info[:shoe] > shoe_size
        shoe_size = info[:shoe]
        rebounds = info[:rebounds]
      end
    end
  end
  rebounds
end