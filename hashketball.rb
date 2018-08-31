require 'pry'

def game_hash
 {
  home: {
    team_name: "Brooklyn Nets",
    colors: ["Black", "White"],
    players: {
      "Alan Anderson": {
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1
      },
      "Reggie Evans": {
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7
      },
      "Brook Lopez": {
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15
      },
      "Mason Plumlee": {
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 12,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5
      },
      "Jason Terry": {
        number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1
      }}
    },
    away: {
    team_name: "Charlotte Hornets",
    colors: ["Turquoise", "Purple"],
    players: {
      "Jeff Adrien": {
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2
      }, "Bismak Biyombo": {
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 7,
        blocks: 15,
        slam_dunks: 10
      },
      "DeSagna Diop": {
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5
      },
      "Ben Gordon": {
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0
      },
      "Brendan Haywood": {
        number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals: 22,
        blocks: 5,
        slam_dunks: 12
      }}
    }
  }
end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry

        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end
# good_practices - to move through each binding.pry type "quit"

#def num_points_scored(name)
#  points = 0
#  game_hash.each do |location, team_data|
#    team_data.each do |attribute, data|
#      if attribute == :players
#        data.each do |info|
#          info.each do |key, value|
#            binding.pry
#            if key == name
#              points = value[:points]
#            end
#          end
#        end
#      end
#    end
#  end
#  points
#end

#def num_points_scored(name)
#  if game_hash[:home][:players].has_key?(name)
#    game_hash[:home][:players].fetch(name)
#  else
#    game_hash[:away][:players].fetch(name)
#    binding.pry
#  end
#end

def num_points_scored(name)
  value=0
  game_hash.each do |team_location, team_data|
    team_data[:players].each do |key, values|
      if key.to_s == name
        return value = values[:points]
      end
    end
  end
end

def shoe_size(name)
  value=0
  game_hash.each do |team_location, team_data|
    team_data[:players].each do |key, values|
      if key.to_s == name
        return value = values[:shoe]
      end
    end
  end
end

def team_colors(name)
  game_hash.select do |team_location, team_data|
    if team_data[:team_name].to_s == name
      return team_data[:colors]
    end
  end
end

def team_names
  game_hash.collect do |team_location, team_data|
    team_data[:team_name]
  end
end

def player_numbers(name_of_team)
  return_value=[]
  game_hash.each do |team_location, team_data|
    if team_data[:team_name] == name_of_team
      team_data[:players].each do |key, values|
        return_value<<values[:number]
      end
    end
  end
  return_value
end

def player_stats(name)
  return_values = 0
  game_hash.each do |team_location, team_data|
    team_data[:players].each do |key, values|
      if name == key.to_s
        return_values = values
      end
    end
  end
  return_values
end

def big_shoe_rebounds
  shoes=[]
  person = 0
  max = 0
  return_value = 0
  game_hash.each do |team_location, team_data|
    team_data[:players].each do |key, values|
      shoes<< values[:shoe]
      max = shoes.max
      person = key
      return_value = team_data[:players][person][:rebounds]
    end
  end
  return_value
end

def most_points_scored
  array = []
  person = 0
  max = 0
  game_hash.each do |team_location, team_data|
    team_data[:players].each do |name, info|
      array<<info[:points]
    end
  end
  max = array.max
  person = name.to_s
  person
  binding.pry
end


=begin
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

def home_team_name
  game_hash[:home][:team_name]
end

def get_all_players
  team_players_array = game_hash.values.map do |team_data|
    team_data[:players]
  end

  team_players_array.flatten
end

def get_data_from_player(player_name, data)
  all_players = get_all_players

  all_players.reduce(nil) do |result, player_data|
    if(player_data[:player_name] == player_name)
      result = player_data[data]
    end

    result
  end
end

def num_points_scored(player_name)
  get_data_from_player(player_name, :points)
end

def shoe_size(player_name)
  get_data_from_player(player_name, :shoe)
end

def get_team(team_name)
  game_hash.values.find do |team_data|
    team_data[:team_name] == team_name
  end
end

def team_colors(team_name)
  team = get_team(team_name)
  team[:colors]
end

def team_names
  game_hash.map do |location, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team_name)
  team = get_team(team_name)
  team[:players].map do |player_data|
    player_data[:number]
  end
end

def player_stats(player_name)
  players = get_all_players
  players.find do |player_data|
    player_data[:player_name] == player_name
  end
end

def big_shoe_rebounds
  players = get_all_players

  biggest_shoe = players.reduce do |result, player_data|
    if(!result)
      result = player_data
    end

    result
  end

  biggest_shoe[:rebounds]
end

puts team_names
=end
