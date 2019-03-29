# Write your code here!
require "pry"
def game_hash
  hash = {
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
          :rebounds=> 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds=> 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds=> 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds=> 2,
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
          :rebounds=> 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds=> 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds=> 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds=> 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds=> 12,
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
  game_hash.each do |location, info|
    info.each do |attribute, data|
      if data.include?(name)
        return game_hash[location][attribute][name][:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, info|
    info.each do |attribute, data|
      if data.include?(name)
        return game_hash[location][attribute][name][:shoe]
      end
    end
  end
end

def team_colors(team_name)
  array = []
  game_hash.each do |location, info|
    if game_hash[location].values.include? (team_name)
      info.each do |attribute, data|
        if attribute == :colors
          return data
        end
      end
    end
  end
end

def team_names
  array = []
  game_hash.each do |city, desc|
    desc.each do |info, data|
      if info == :team_name
        array << data
      end
    end
  end
  return array
end

def player_numbers(team_name)
  array = []
  if game_hash[:home][:team_name] == team_name
    game_hash[:home][:players].each do |name, stats|
      stats.each do |label, points|
        if label == :number
          array << points
        end
      end
    end
  else
    game_hash[:away][:team_name] == team_name
    game_hash[:away][:players].each do |name, stats|
      stats.each do |label, points|
        if label == :number
          array << points
        end
      end
    end
  end
  return array
end

def player_stats(name)
  game_hash.each do |which, desc|
    desc.each do |data, attribute|
      if attribute.include?(name) 
        return game_hash[which][data][name]
      end
    end
  end
end

def big_shoe_rebounds
  biggest_shoe = nil
  player_rebounds = nil
  game_hash.each do |which, desc|
    desc.each do |data, attribute|
      if data == :players
        attribute.each do |name, stats|
          stats.each do |spec, value|
            if spec == :shoe
              if biggest_shoe == nil
                biggest_shoe = value
                player_rebounds = game_hash[which][:players][name][:rebounds]
              else
                if value > biggest_shoe
                  biggest_shoe = value
                  player_rebounds = game_hash[which][:players][name][:rebounds]
                end
              end
            end
          end
        end
      end
    end
  end
  return player_rebounds
end

big_shoe_rebounds