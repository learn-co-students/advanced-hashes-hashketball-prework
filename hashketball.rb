# Write your code here!
def game_hash
  hash = {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black","White"],
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
    :colors => ["Turquoise","Purple"],
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

def num_points_scored(string)
  output = Hash.new
  game_hash.each do |team,data|
    data.each do |details,more_data|
      if more_data.is_a?(Hash)
        more_data.each do |key,value|
          output[key] = value
        end
      end
    end
  end
  output[string][:points]
end

def shoe_size(string)
  output = Hash.new
  game_hash.each do |team,data|
    data.each do |details,more_data|
      if more_data.is_a?(Hash)
        more_data.each do |key,value|
          output[key] = value
        end
      end
    end
  end
  output[string][:shoe]
end

def player_stats(string)
  output = Hash.new
  game_hash.each do |team,data|
    data.each do |details,more_data|
      if more_data.is_a?(Hash)
        more_data.each do |key,value|
          output[key] = value
        end
      end
    end
  end
  output[string]
end

def team_colors(string)
  output_array = Array.new
  game_hash.each do |team,data|
    output_array << data
  end
  output_array.select!{|hash| hash[:team_name].include?(string)}
  output_array[0][:colors]
end

def team_names
  teams = Array.new
  teams << game_hash[:home][:team_name]
  teams << game_hash[:away][:team_name]
  teams
end

def player_numbers(string)
  output_array = Array.new
  numbers = Array.new
  output = Hash.new
  game_hash.each do |team,data|
    output_array << data
  end
  output_array.select!{|hash| hash[:team_name].include?(string)}
  output_array[0].each do |key,value|
    if value.is_a?(Hash)
      output[key] = value
    end
  end
  output.each do |key,value|
    value.each do |names,stats|
      numbers << stats[:number]
    end
  end
  numbers
end

def big_shoe_rebounds
  output = Hash.new
  shoe_array = Array.new
  largest_shoe = nil
  shoe_size_hash = Hash.new
  big_shoe_player = nil
  game_hash.each do |team,data|
    data.each do |details,more_data|
      if more_data.is_a?(Hash)
        more_data.each do |key,value|
          output[key] = value
        end
      end
    end
  end
  output.each do |names,stats|
    shoe_array << stats[:shoe]
    shoe_size_hash[names] = stats[:shoe]
  end
  shoe_array.sort!
  largest_shoe = shoe_array[-1]
  big_shoe_player = shoe_size_hash.key(largest_shoe)
  output[big_shoe_player][:rebounds]
end

