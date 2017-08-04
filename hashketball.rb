# Write your code here!
require "pry"

def game_hash

  game_hash = {
    :home => {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
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
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
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
      }
    }
  }
return game_hash
end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    #binding.pry
    #puts location
    team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        #binding.pry

      #puts attribute
      if attribute == :players
        data.each do |data_item|
          #puts data_item

        end
      end
    end
  end
end

def num_points_scored(player)

  points = 0

  game_hash.each do |key, value|
    value.each do |key2, value2|
      if key2 == :players
        value2.each do |key3, value3|
          if key3 == player
            value3.each do |key4, value4|
              if key4 == :points
                points = value4
                #puts value4
                return points
              end
            end
          end
        end
      end
    end
  end

  return points
end


def shoe_size(player)

  shoe = 0

  game_hash.each do |key, value|
    value.each do |key2, value2|
      if key2 == :players
        value2.each do |key3, value3|
          if key3 == player
            value3.each do |key4, value4|
              if key4 == :shoe
                shoe = value4
                #puts value4
                return shoe
              end
            end
          end
        end
      end
    end
  end

  return shoe
end

def team_colors(team)
  game_hash.each do |key, value|
    if value[:team_name] == team
      return value[:colors]
    end
  end
end


def team_names
  teams = []
  game_hash.each do |key, value|
    teams.push(value[:team_name])
  end
  return teams
end

def player_numbers(team)
  numbers = []
  game_hash.each do |key, value|
    puts key
    if value[:team_name] == team
      value[:players].each do |key2, value2|
        puts key2
          numbers.push(value2[:number])
      end
    end
  end
  return numbers
end


def player_stats(player)

  game_hash.each do |key, value|
    value.each do |key2, value2|
      if key2 == :players
        value2.each do |key3, value3|
          if key3 == player
            return value3
          end
        end
      end
    end
  end

end


def big_shoe_rebounds

  hash = {}
  maxShoe = 0
  maxShoePlayer = ""

  game_hash.each do |key, value|

    value.each do |key2, value2|
      if key2 == :players
        value2.each do |key3, value3|
          #puts key3
          value3.each do |key4, value4|
            if key4 == :shoe
              if value4 > maxShoe
                maxShoe = value4
                maxShoePlayer = key3
                hash = value3
              end
            end
          end
        end
      end
    end
  end

  #puts maxShoePlayer
  #puts hash[:rebounds]
  rebounds = hash[:rebounds]
  return rebounds
end

big_shoe_rebounds
