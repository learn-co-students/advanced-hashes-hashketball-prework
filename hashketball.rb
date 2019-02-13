







require "pry"


# Write your code here!
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

def num_points_scored(player)
  away_players = game_hash[:away][:players]
  if away_players.key?(player)
    game_hash[:away][:players][player][:points]
  else
    game_hash[:home][:players][player][:points]
  end
  #def home_team_name
  #  game_hash[:home][:team_name]
  #end
end
def shoe_size(player)
  away_players = game_hash[:away][:players]
  if away_players.key?(player)
    game_hash[:away][:players][player][:shoe]
  else
    game_hash[:home][:players][player][:shoe]

  end
end
def team_colors(team_name)
if game_hash[:home][:team_name] == team_name
  game_hash[:home][:colors]
else
  game_hash[:away][:colors]
  end
end
def team_names
  game_hash.collect do |key, value|
    game_hash[key][:team_name]
  end

end

def player_numbers(team)
  if game_hash[:home][:team_name] == team
    game_hash[:home][:players].collect do |key, value|
      value[:number]
    end
  else
    game_hash[:away][:players].collect do |key, value|
      value[:number]
    end
end


end
def player_stats(player)
  away_players = game_hash[:away][:players]
  if away_players.key?(player)
    game_hash[:away][:players][player]
  else
    game_hash[:home][:players][player]
  end

end
def big_shoe_rebounds
  players = {}
  highest_player = {
    :highest_rebound => 0,
    :highest_shoe => 0

  }
game_hash.each do |key, value|
  value[:players].each do |key, value|
  players[key] = {}
  players[key][:shoe] = value[:shoe]
  players[key][:rebounds] = value[:rebounds]
  end
  end

  players.each do |key, value|
    if value[:shoe] > highest_player[:highest_shoe]
      highest_player[:highest_rebound] = value[:rebounds]
      highest_player[:highest_shoe] = value[:shoe]
      highest_player[:name] = key
    end
  end
  highest_player[:highest_rebound]
end
