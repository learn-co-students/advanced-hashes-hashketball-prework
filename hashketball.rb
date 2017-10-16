require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        }, {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        }, {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        }, {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        }, {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        }, {
          player_name: "Bismak Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        }, {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        }, {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        }, {
          player_name: "Brendan Haywood",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def num_points_scored(player)
helper(player, :points)
end

def shoe_size(player)
  helper(player, :shoe)
end

def team_colors(team)
  colors = []
  game_hash.each do |teams, keys|
      keys.each do |key, value|
        #binding.pry
        if keys[key] == team
        colors = keys[:colors]
        end
      end
    end
    colors
end

def team_names
  team = []
  game_hash.each do |teams, keys|
        team << keys[:team_name]
    end
    team
  end

def player_numbers(team)
  attribute1 = []
  game_hash.each do |teams, keys|
    if keys[:team_name] == team
      keys.each do |key, value|
        if key == :players
          value.each do |values|
                attribute1 << values[:number]
         end
        end
      end
    end
  end
  attribute1
end

def player_stats(player)
  attribute1 = {}
  game_hash.each do |team, keys|
      keys.each do |key, value|
        if key == :players
          value.each do |values|
              if values[:player_name] == player
                attribute1 = values
                attribute1.delete(:player_name)
          end
         end
        end
      end
  end
  attribute1
end

def big_shoe_rebounds
  player = ""
  shoe = 0
  game_hash.each do |team, keys|
      keys.each do |key, value|
        if key == :players
          value.each do |values|
            #binding.pry
                if shoe < values[:shoe]
                  shoe = values[:shoe]
                  #binding.pry
                  player = values[:player_name]
                end
              end
            end
          end
        end
  helper(player, :rebounds)
end


def helper(player, attribute)
  attribute1 = 0
  game_hash.each do |team, keys|
      keys.each do |key, value|
        if key == :players
          value.each do |values|
            values.each do |stat, number|
              if number == player
                attribute1 = values[attribute]
          end
         end
        end
      end
    end
  end
  attribute1
end

## Bonus

def most_points_scored
  player = ""
  points = 0
  game_hash.each do |team, keys|
      keys.each do |key, value|
        if key == :players
          value.each do |values|
            #binding.pry
                if points < values[:points]
                  points = values[:points]
                  #binding.pry
                  player = values[:player_name]
                end
              end
            end
          end
        end
player
end

def winning_team
  team1 = "Brooklyn Nets"
  team2 = "Charlotte Hornets"
  points1 = 0
  points2 = 0
  game_hash.each do |team, keys|
      keys.each do |key, value|
        if key == :players
          value.each do |values|
            #binding.pry
                if team = team1
                  points1 =+ values[:points]
                else
                  points2 =+ values[:points]

                end
              end
            end
          end
        end
if points1 > points2
  team1
else
  team2
end
end

def player_with_longest_name
  player = ""
  game_hash.each do |team, keys|
      keys.each do |key, value|
        if key == :players
          value.each do |values|
            #binding.pry
                if player.size < values[:player_name].size
                  #binding.pry
                  player = values[:player_name]
                end
              end
            end
          end
        end
player
end

def long_name_steals_a_ton?
  player = ""
  steals = 0
  game_hash.each do |team, keys|
      keys.each do |key, value|
        if key == :players
          value.each do |values|
            #binding.pry
                if steals < values[:steals]
                  steals = values[:steals]
                  #binding.pry
                  player = values[:player_name]
                end
              end
            end
          end
        end
        player1 = player_with_longest_name
  if player1 == player
    true
  end
end
