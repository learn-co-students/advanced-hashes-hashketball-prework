# Write your code here!
#require "pry"

def game_hash
  {
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

# def good_practices
#   game_hash.each do |location, team_data|
#     #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#     binding.pry
#       team_data.each do |attribute, data|
#         #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#         binding.pry
#
#         #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
#         data.each do |data_item|
#             binding.pry
#       end
#     end
#   end
# end
# good_practices

def num_points_scored (name)

  x = game_hash[:away][:players]
  y = game_hash[:home][:players]

  x.each do |player_name, value|
    if player_name === name
      return x[name][:points]
    end
  end

  y.each do |player_name, value|
    if player_name === name
      return y[name][:points]
    end
  end

end

def shoe_size (name)
  x = game_hash[:away][:players]
  y = game_hash[:home][:players]

  x.each do |player_name, value|
    if player_name === name
      return x[name][:shoe]
    end
  end

  y.each do |player_name, value|
    if player_name === name
      return y[name][:shoe]
    end
  end
end

def team_colors (name)
  final = []

  x = game_hash[:home]
  y = game_hash[:away]

  x.each do |key, value|
    if x[key] === name
      j = 0
      while j < x[:colors].length
        final << x[:colors][j]
        j+=1
      end
    end
  end

  y.each do |key, value|
    if y[key] === name
      i = 0
      while i < y[:colors].length
        final << y[:colors][i]
        i+=1
      end
    end
  end
  final
end

def team_names
  final = []
  final << game_hash[:home][:team_name]
  final << game_hash[:away][:team_name]
  final
end

def player_numbers (team_name)
  final = []
  game_hash.each do |location, values|
    values.each do |keys, info|
      if info === team_name
        x = game_hash[location][:players]
          x.each do |name, attributes|
            final << x[name][:number]
          end
      end
    end
  end
  return final
end

def player_stats (player_name)

  x = game_hash[:home][:players]
  y = game_hash[:away][:players]

  x.each do |name, stats|
    if name === player_name
      return x[name]
    end
  end

  y.each do |name, stats|
    if name === player_name
      return y[name]
    end
  end

end

def big_shoe_rebounds
  final = []
  game_hash.each do |location, info|
    game_hash[location][:players].each do |name, attributes|
      game_hash[location][:players][name].each do |key, value|
      end
      final << game_hash[location][:players][name][:shoe]
    end
  end

  final.sort!

  game_hash.each do |location, info|
    game_hash[location][:players].each do |name, attributes|
      game_hash[location][:players][name].each do |key, value|
        if game_hash[location][:players][name][:shoe] === final.last
          return game_hash[location][:players][name][:rebounds]
        end
      end
    end
  end
end
