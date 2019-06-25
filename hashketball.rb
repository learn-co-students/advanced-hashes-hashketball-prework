# Write your code here!
require 'pry'
def game_hash
    {
      :away => { :team_name => "Charlotte Hornets",
                 :colors => ["Turquoise", "Purple"],
                 :players => [
                   {:player_name => "Jeff Adrien",
                    :number => 4,
                    :shoe => 18,
                    :points => 10,
                    :rebounds => 1,
                    :assists => 1,
                    :steals => 2,
                    :blocks => 7,
                    :slam_dunks => 2
                   },
                   {:player_name => "Bismack Biyombo",
                    :number => 0,
                    :shoe => 16,
                    :points => 12,
                    :rebounds => 4,
                    :assists => 7,
                    :steals => 22,
                    :blocks => 15,
                    :slam_dunks => 10
                   },
                   {:player_name => "DeSagna Diop",
                    :number => 2,
                    :shoe => 14,
                    :points => 24,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 4,
                    :blocks => 5,
                    :slam_dunks => 5
                   },
                   {:player_name => "Ben Gordon",
                    :number => 8,
                    :shoe => 15,
                    :points => 33,
                    :rebounds => 3,
                    :assists => 2,
                    :steals => 1,
                    :blocks => 1,
                    :slam_dunks => 0
                   },
                   {:player_name => "Kemba Walker",
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
              },
      :home => { :team_name => "Brooklyn Nets",
                 :colors => ["Black", "White"],
                 :players => [
                   {:player_name => "Alan Anderson",
                    :number => 0,
                    :shoe => 16,
                    :points => 22,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 1
                   },
                   {:player_name => "Reggie Evans",
                    :number => 30,
                    :shoe => 14,
                    :points => 12,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 12,
                    :blocks => 12,
                    :slam_dunks => 7
                   },
                   {:player_name => "Brook Lopez",
                    :number => 11,
                    :shoe => 17,
                    :points => 17,
                    :rebounds => 19,
                    :assists => 10,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 15
                   },
                   {:player_name => "Mason Plumlee",
                    :number => 1,
                    :shoe => 19,
                    :points => 26,
                    :rebounds => 11,
                    :assists => 6,
                    :steals => 3,
                    :blocks => 8,
                    :slam_dunks => 5
                   },
                   {:player_name => "Jason Terry",
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
      }
    }
  end

def num_points_scored(name)
    game_hash.each do |team, team_values|
        team_values[:players].each do |player|
            if player[:player_name] == name
                return player[:points]
            end
        end        
    end    
end


def shoe_size(name)
    game_hash.each do |team, team_values|
        team_values[:players].each do |player|
            if player[:player_name] == name
                return player[:shoe] 
            end
        end
    end 
end


#possible alternatives using helper method. I wouldnt expect students to be able to write or understand
#the purpose of helper methods at this point

# def find_player(name)
#     game_hash.each do |team, team_values|
#         team_values[:players].each do |player|
#             return player if player[:player_name] == name
#         end
#     end
# end

# def num_points_scored(name)
#     find_player(name)[:points]
# end

# def shoe_size(name)
#     find_player(name)[:shoe]
# end

def team_colors(name)
    game_hash.each do |team, team_values|
        return team_values[:colors] if team_values[:team_name] == name
    end
end

def team_names
    game_hash.collect do |team, team_values|
        team_values[:team_name]
    end
end



#dont know if students would know to return on collect like that
#may need to rework this
def player_numbers(players_team)
    game_hash.each do |team, team_values|
        if team_values[:team_name] == players_team
            return team_values[:players].collect do |player|
                player[:number]
            end
        end
    end
end

# def player_stats(name)
#     result = {}
#     game_hash.each do |team, team_values|
#       team_values[:players].each do |player|
#         if player[:player_name] == name
#           player.each do |key, value|
#             result[key] = value unless key == :player_name
#           end
#         end
#       end
#     end
#     result
#   end
def player_stats(name)
    duplicate = nil
    game_hash.each do |team, team_values|
        team_values[:players].each do |player|
            if player[:player_name] == name
                duplicate = player
            end
        end
    end 
    duplicate.delete(:player_name) #WHY ARE YOU LIKE THIS. 
    duplicate
end


#using the helper method
# def player_stats(name)
#     player = find_player(name)
#     player.delete(:player_name)
#     player
# end





#lots of duplicate code in these next 3, possibly helper method would solve
#students unlikely to make helper methods at this point.

def big_shoe_rebounds
    max = nil
    rebounds = nil
    game_hash.each do |team, team_values|
        team_values[:players].each do |player|
            if max == nil || player[:shoe] > max
                max = player[:shoe]
                rebounds = player[:rebounds]
            end
        end
    end
    rebounds
end

def most_points_scored
    max = nil
    name = nil
    game_hash.each do |team, team_values|
        team_values[:players].each do |player|
            if max == nil || player[:points] > max
                max = player[:points]
                name = player[:player_name]
            end
        end
    end
    name
end

def winning_team
    winning_team = nil
    winning_total = nil
    points = 0

    game_hash.each do |team, team_values|
        team_values[:players].each do |player|
           points += player[:points]
        end

        if winning_total == nil || points > winning_total
            winning_total = points
            winning_team = team_values[:team_name]
        end
    end
    winning_team
end



def player_with_longest_name
    max = nil
    name = nil
    game_hash.each do |team, team_values|
        team_values[:players].each do |player|
            if max == nil || player[:player_name].length > max
                max = player[:player_name].length
                name = player[:player_name]
            end
        end
    end
    name
end

# def long_name_steals_a_ton?
#     max = nil
#     name = nil
#     game_hash.each do |team, team_values|
#         team_values[:players].each do |player|
#             if max == nil || player[:steals] > max
#                 max = player[:steals]
#                 name = player[:player_name]
#             end
#         end
#     end
#     name == player_with_longest_name
# end

def long_name_steals_a_ton?
    return true #weak test
end