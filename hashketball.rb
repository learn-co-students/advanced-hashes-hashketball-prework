require "pry"

def game_hash
  game_hash = {
    :home=>{
      :team_name=>"Brooklyn Nets",
      :colors =>["Black", "White"],
      :players=>{
        "Alan Anderson"=>{
          :number=>0,
          :shoe=>16,
          :points=>22,
          :rebounds=>12,
          :assists=>12,
          :steals=>3,
          :blocks=>1,
          :slam_dunks=>1
        },
        "Reggie Evans"=>{
          :number=>30,
          :shoe=>14,
          :points=>12,
          :rebounds=>12,
          :assists=>12,
          :steals=>12,
          :blocks=>12,
          :slam_dunks=>7
        },
        "Brook Lopez"=>{
          :number=>11,
          :shoe=>17,
          :points=>17,
          :rebounds=>19,
          :assists=>10,
          :steals=>3,
          :blocks=>1,
          :slam_dunks=>15
        },
        "Mason Plumlee"=>{
          :number=>1,
          :shoe=>19,
          :points=>26,
          :rebounds=>12,
          :assists=>6,
          :steals=>3,
          :blocks=>8,
          :slam_dunks=>5
        },
        "Jason Terry"=>{
          :number=>31,
          :shoe=>15,
          :points=>19,
          :rebounds=>2,
          :assists=>2,
          :steals=>4,
          :blocks=>11,
          :slam_dunks=>1
        }

      }

    },



    :away => {
      :team_name=>"Charlotte Hornets",
      :colors =>["Turquoise", "Purple"],
      :players=> {
        "Jeff Adrien"=>{
          :number=>4,
          :shoe=>18,
          :points=>10,
          :rebounds=>1,
          :assists=>1,
          :steals=>2,
          :blocks=>7,
          :slam_dunks=>2
        },
        "Bismak Biyombo"=>{
          :number=>0,
          :shoe=>16,
          :points=>12,
          :rebounds=>4,
          :assists=>7,
          :steals=>7,
          :blocks=>15,
          :slam_dunks=>10
        },
        "DeSagna Diop"=>{
          :number=>2,
          :shoe=>14,
          :points=>24,
          :rebounds=>12,
          :assists=>12,
          :steals=>4,
          :blocks=>5,
          :slam_dunks=>5
        },
        "Ben Gordon"=>{
          :number=>8,
          :shoe=>15,
          :points=>33,
          :rebounds=>3,
          :assists=>2,
          :steals=>1,
          :blocks=>1,
          :slam_dunks=>0
        },
        "Brendan Haywood"=>{
          :number=>33,
          :shoe=>15,
          :points=>6,
          :rebounds=>12,
          :assists=>12,
          :steals=>22,
          :blocks=>5,
          :slam_dunks=>12
        }

      }

    }
  }
end

def num_points_scored(player_name) # method that takes in arg of player_name looking to return num of points of passed in player_name
  game_hash.collect do |location, team_data| # iterate over game_hash using .collect with block variables location & team_data
    if team_data[:players].keys.include?(player_name)
      # conditional statement checking to verify if players hash contains player_name(arg passed into method)
      return team_data[:players][player_name][:points] #if above condition is true, will return points of player_name within players hash
      # Once retirn statement is issued, it will stop executing method
    end
  end
end

def shoe_size (player_name) # same logic as above code block
  game_hash.collect do |location, team_data|
    if team_data[:players].keys.include?(player_name)
      return team_data[:players][player_name][:shoe]
    end
  end
end

def team_colors(team_name) # method that takes in an arg of team_name looking to return team_colors
  game_hash.collect do |location, team_data|
    if team_data[:team_name] == team_name # conditional statemnt checking to verify if value of team_name is equal to team_name passed in as arg
      # This is a way to check if we are looking at away or home location
      return team_data[:colors] #if above condition  is true, will return colors of team_name within team-data hash
    end
  end
end

def team_names # method that returns array of team names
  team_array = [] # create empty array to push team names into
game_hash.collect do |location, team_data| #iterate through game_hash with .collect
 team_array << team_data[:team_name] # shovel or push values of team names into team array
  end
  team_array # call team_array to retun array with values
end

def player_numbers(team_name)
  number_array = [] # create empty array to push player_numbers into
  game_hash.collect do |location, team_data|
    if team_data[:team_name] == team_name # conditional statemnt checking to verify if value of team_name is equal to team_name passed in as arg
      # This is a way to check if we are looking at away or home location
    team_data.collect do |k, v| # iterate through second layer of hashes
      if k == :players #conditional statement to verify if key is equal to players
      v.collect do |player_name, stats| #iterate through v hash nested within the players key
        number_array << stats[:number] #shovels blank array with each person's jersey num.
      end
    end
  end
  end
end
number_array # return updated array of jersey nums
end

def player_stats(player_name) # same logic as shoe_size & num_points_scored
game_hash.collect do |location, team_data|
  if team_data[:players].keys.include?(player_name)
    return team_data[:players][player_name]
end
end
end

def big_shoe_rebounds
  shoe_size = 0 # assigning the lowest possible num to compare each player's shoe size to
  biggest_shoe_player = "" # this variable will get reassigned once the largest shoe size is found
  game_hash.collect do |location, team_data|
    team_data.collect do |k, v|
      if k == :players
        v.collect do |player_name, stats|
          # done iterating down to player name and stats level
          if stats[:shoe] > shoe_size # this will compare each players shoe size to the shoe variable assigned on 188
            shoe_size = stats[:shoe] # reassigning shoe size variable
            biggest_shoe_player = player_name # reassigning biggest_shoe_player if 195 true
          end
        end
      end
    end
      if team_data[:players].keys.include?(biggest_shoe_player)
          return team_data[:players][biggest_shoe_player][:rebounds]
    end
  end
end


















# Write your code here!
