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

def num_points_scored(players_name)
 game_hash.values.each do |i|
  i[:players].each do |t|
   if t[:player_name] == players_name
      return t[:points]
    end 
  end
 end
end 

def shoe_size(players_name)
  game_hash.values.each do |i|
    i[:players].each do |t|
      if t[:player_name] == players_name
        return t[:shoe]
      end 
    end
  end
end

def team_colors(team)
  game_hash.values.each do |i|
    if i[:team_name] == team
      return i[:colors]
    end  
  end
end  

def team_names
  team_array = []
  game_hash.values.each do |hash_values|
    team_array.push(hash_values[:team_name])
  end
team_array
end  

def player_numbers(team)
  player_number_array = []
  game_hash.values.each do |hash_values|
    if team == hash_values[:team_name]
        hash_values[:players].each do |i|
          player_number_array.push(i[:number])
      end 
    end
  end
  player_number_array
end

def players_stats(player)
  game_hash.values.each do |hash_values|
    hash_values[:players].each do |players|
      if players[:player_name] == player
        return players
      end
    end
  end 
end

# def big_shoe_rebounds
#   team_array = game_hash.values.map do |teams|
#     teams[:players]
#   end
#   team_array  
# end 

# big_shoe_rebounds 

def big_shoe_rebounds
  team_data = game_hash.values.map do |hash_values|
    hash_values[:players]
  end
  team_data = team_data.flatten

  shoe_size = 0
  return_value = '';

    team_data.each do |i|
      if i[:shoe] >  shoe_size 
      shoe_size = i[:shoe]
      return_value = i[:rebounds]
      end
    end
return_value
end   
