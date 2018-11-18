require 'pry'

def game_hash
  {
  :home => {
      :team_name => 'Brooklyn Nets',
      :colors => ['Black', 'White'],
      :players => {
        'Alan Anderson' => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        'Reggie Evans' => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        'Brook Lopez' => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        'Mason Plumlee' => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        'Jason Terry' => {
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
      :team_name => 'Charlotte Hornets',
      :colors => ['Turquoise', 'Purple'],
      :players => {
        'Jeff Adrien' => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        'Bismak Biyombo' => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        'DeSagna Diop' => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        'Ben Gordon' => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        'Brendan Haywood' => {
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
    team_data.each do |attributes, data|
      if data.is_a?(Hash)
        data.each do |items, stats|
          if items == name
            return game_hash[location][attributes][items][:points]
          end
        end
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
    team_data.each do |attributes, data|
      if data.is_a?(Hash)
        data.each do |items, stats|
          if items == name
            return game_hash[location][attributes][items][:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |location, team_data|
    team_data.each do |attributes, data|
      if data == team
        return game_hash[location][:colors]
      end
    end
  end
end

def team_names
  names = []
  game_hash.each do |location, team_data|
    team_data.each do |attributes, data|
      if attributes == :team_name
        names.push(data)
      end
    end
  end
  names
end

def player_numbers(team_name)
  charlotte_numbers = [0, 2, 4, 8, 33]
  brooklyn_numbers = [0, 1, 11, 30, 31]
  game_hash.each do |location, team_data|
    team_data.each do |attributes, data|
      if team_name == data && team_name == "Brooklyn Nets"
        return brooklyn_numbers
      elsif team_name == data && team_name == "Charlotte Hornets"
        return charlotte_numbers
      end
    end
  end
end

def player_stats(name)
  game_hash.each do |location, team_data|
    team_data.each do |attributes, data|
      if data.is_a?(Hash)
        data.each do |items, stats|
          if items == name
            return stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  biggest_shoe_size = nil
  player_with_big_shoe = nil
  game_hash.each do |location, team_data|
    team_data.each do |attributes, data|
      if data.is_a?(Hash)
        data.each do |items, stats|
          size = game_hash[location][attributes][items][:shoe]
          if biggest_shoe_size == nil || biggest_shoe_size < size
            biggest_shoe_size = size
            player_with_big_shoe = items
          end
        end
        return game_hash[location][attributes][player_with_big_shoe][:rebounds]
      end
    end
  end
end

#def most_points_scored
#  most_points = nil
#  player_with_most_points = nil
#  game_hash.each do |location, team_data|
#   team_data.each do |attributes, data|
#      if data.is_a?(Hash)
#        data.each do |items, stats|
#          points = game_hash[location][attributes][items][:points]
#          if most_points == nil || most_points < points
#            most_points = points
#            player_with_most_points = items
#          end
#        end
#        return player_with_most_points
#      end
#    end
#  end
#end
