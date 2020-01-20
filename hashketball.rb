require "pry"

def game_hash
{
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
          { 
            :player_name => "Alan Anderson",
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1
          }, { 
            :player_name => "Reggie Evans",
            :number => 30,
            :shoe => 14,
            :points => 12,
            :rebounds => 12,
            :assists => 12,
            :steals => 12,
            :blocks => 12,
            :slam_dunks => 7
          }, {
            :player_name => "Brook Lopez",
            :number => 11,
            :shoe => 17,
            :points => 17,
            :rebounds => 19,
            :assists => 10,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 15
          }, { 
            :player_name => "Mason Plumlee",
            :number => 1,
            :shoe => 19,
            :points => 26,
            :rebounds => 11,
            :assists => 6,
            :steals => 3,
            :blocks => 8,
            :slam_dunks => 5
          }, { 
            :player_name => "Jason Terry", 
            :number => 31,
            :shoe => 15,
            :points => 19,
            :rebounds => 2,
            :assists => 2,
            :steals => 4,
            :blocks => 11,
            :slam_dunks => 1
          }
        ]
      }, 
      :away => {
        :team_name => "Charlotte Hornets",
        :colors => ["Turquoise", "Purple"],
        :players => [
          { 
            :player_name => "Jeff Adrien",
            :number => 4, 
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2
          }, { 
            :player_name => "Bismack Biyombo",
            :number => 0, 
            :shoe => 16,
            :points => 12,
            :rebounds => 4,
            :assists => 7,
            :steals => 22,
            :blocks => 15,
            :slam_dunks => 10
          }, { 
            :player_name => "DeSagna Diop",
            :number => 2, 
            :shoe => 14,
            :points => 24,
            :rebounds => 12,
            :assists => 12,              
            :steals => 4,
            :blocks => 5,
            :slam_dunks => 5
          }, { 
            :player_name => "Ben Gordon",
            :number => 8, 
            :shoe => 15,
            :points => 33,
            :rebounds => 3,
            :assists => 2,
            :steals => 1,
            :blocks => 1,
            :slam_dunks => 0
          }, { 
            :player_name => "Kemba Walker",
            :number => 33, 
            :shoe => 15,
            :points => 6,
            :rebounds => 12,
            :assists => 12,
            :steals => 7,
            :blocks => 5,
            :slam_dunks => 12
          }
        ]
    }
  }
end


def num_points_scored(player_name)
  
 players = game_hash.map do |team, team_attributes|
    team_attributes[:players]
  end.flatten

  player = players.find do |player| 
    player[:player_name] == player_name
  end
  # players.each do |player|
  #   if player[:player_name] == player_name
  #     player[:points]
  #   end
  player[:points]
end

def shoe_size(player_name)

 players = game_hash.map do |team, team_attributes|
   team_attributes[:players]
  end.flatten
  
  player = players.find do |player| 
    player[:player_name] == player_name
    end
  
  player[:shoe]
end

def home_team_name(team_name)
  game_hash[:home]
end

def team_colors(team_name)

  game_hash.each do |place,team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end

def team_names
  game_hash.map do |place, team|
    team[:team_name]
  end
end

def player_numbers(team_name)
  jersey_numbers = []
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      team.each do |attributes, data|
        if attributes == :players
          data.each do |player|
            jersey_numbers << player[:number]
          end
        end
      end
    end
  end
  jersey_numbers
end

def player_stats(players_name)
  new_hash = {}
  game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player|
          if player[:player_name] == players_name
            new_hash = player.delete_if do |k, v|
              k == :player_name
            end
          end
        end
      end
    end
  end
  new_hash
end



def big_shoe_rebounds
  
   player_stats_array = game_hash.map do |place, team|
    team[:players].map do |player|
      player
      end
  end.flatten

  shoe_array = player_stats_array.map do |player|
    player.key(:shoe)
    player[:shoe]
  end
    #binding.pry
    
  player_stats_array.each do |player|
    if player[:shoe] == shoe_array.max
      return player[:rebounds]
    #return number of rebounds associated w/ largest shoe size
    end
  end
end



def most_points_scored
   player_stats_array = game_hash.map do |place, team|
    team[:players].map do |player|
      player
      end
  end.flatten

  points_array = player_stats_array.map do |player|
    player.key(:points)
    player[:points]
  end
    
  player_stats_array.each do |player|
    if player[:points] == points_array.max
      return player[:player_name]
    end
  end
end


def winning_team
  
  home_player_stats_array = 
    game_hash[:home][:players].map do |player|
      player
      end.flatten
      
  away_player_stats_array = 
    game_hash[:away][:players].map do |player|
      player
      end.flatten
    
    home_team = game_hash[:home][:team_name]
    away_team = game_hash[:away][:team_name]
 
    home_points_array = 
      home_player_stats_array.map do |player|
        player.key(:points)
        player[:points]
        end
        
    away_points_array = 
      away_player_stats_array.map do |player|
        player.key(:points)
        player[:points]
        end
              
    home_total_points = home_points_array.reduce(:+)
    away_total_points = away_points_array.reduce(:+)
    
    if home_total_points > away_total_points 
      return home_team
    else 
      return away_team
    end
end


def player_with_longest_name
  
    player_stats_array = game_hash.map do |place, team|
      team[:players].map do |player|
      player
      end
    end.flatten
  
    player_name_array = player_stats_array.map do |player|
      player.key(:player_name)
      player[:player_name]
    end
    
  player_name_array.max_by { |word| word.length }
end


def long_name_steals_a_ton?
  
    player_stats_array = game_hash.map do |place, team|
      team[:players].map do |player|
      player
      end
    end.flatten
  
    player_steals_array = player_stats_array.map do |player|
      player.key(:player_name)
      player.key(:steals)
      player[:player_name]
      player[:steals]
    end
    
    most_steals = player_steals_array.max
    longest_name = player_with_longest_name
    
    player_stats_array.any? { |player| player[:player_name] == longest_name && player[:steals] == most_steals }
    #binding.pry
end


# team_names solved with .each
# def team_names
#   new_array = []
#   game_hash.each do |place, team|
#   new_array << team[:team_name]
#     end
# new_array
# end

#   game_hash[:team].key(team_name) == team_name
#   binding.pry
# end

  # team = game_hash.find do |team, team_attributes|
  #   team_attributes[:team_name] == team_name
  # end 
  # team[:colors]

  # team = game_hash.select do |team, team_attributes|
  #   team_attributes[:colors]
  #     binding.pry
  #   end
    
  #   colors = game_hash.map do |team, team_attributes|
  #   team_attributes[:colors]
  #   end
  
  # team_colors = 
  #   game_hash.map do |location, team_attributes|
  #     location[:colors]
  #   end
  #end
  
#helper method
# def players(game_hash)
#     game_hash.map do |team, team_attributes|
#         team_attributes[:players]
#       end.flatten
# end

#helper method
# def find_player(players_array, player)
#   players_array.find do |player| 
#       player[:player_name] == player_name
#     end
# end

#def num_points_scored(player_name)
# find_player(players, player_name)[:points]
# end

#generic function to search 
# def find_any_attribute_about_any_player_generic(player_name, string)
#   attribute = string.to_sym
#   find_player(players, player_name)[attribute]
# end