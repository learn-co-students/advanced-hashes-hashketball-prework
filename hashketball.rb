require "pry"

def game_hash()
  hash = {
    :home => {:team_name => "Brooklyn Nets",
             :colors => ["Black", "White"],
             :players => [{:player_name => "Alan Anderson",
                           :number => 0,
                           :shoe => 16,
                           :points => 22,
                           :rebounds => 12,
                           :assists => 12,
                           :steals => 3,
                           :blocks => 1,
                           :slam_dunks => 1},
                          {:player_name => "Reggie Evans",
                           :number => 30,
                           :shoe => 14,
                           :points => 12,
                           :rebounds => 12,
                           :assists => 12,
                           :steals => 12,
                           :blocks => 12,
                           :slam_dunks => 7},
                           {:player_name => "Brook Lopez",
                            :number => 11,
                            :shoe => 17,
                            :points => 17,
                            :rebounds => 19,
                            :assists => 10,
                            :steals => 3,
                            :blocks => 1,
                            :slam_dunks => 15},
                           {:player_name => "Mason Plumlee",
                            :number => 1,
                            :shoe => 19,
                            :points => 26,
                            :rebounds => 11,
                            :assists => 6,
                            :steals => 3,
                            :blocks => 8,
                            :slam_dunks => 5},
                           {:player_name => "Jason Terry",
                            :number => 31,
                            :shoe => 15,
                            :points => 19,
                            :rebounds => 2,
                            :assists => 2,
                            :steals => 4,
                            :blocks => 11,
                            :slam_dunks => 1}]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [{:player_name => "Jeff Adrien",
                    :number => 4,
                    :shoe => 18,
                    :points => 10,
                    :rebounds => 1,
                    :assists => 1,
                    :steals => 2,
                    :blocks => 7,
                    :slam_dunks => 2},
                   {:player_name => "Bismack Biyombo",
                    :number => 0,
                    :shoe => 16,
                    :points => 12,
                    :rebounds => 4,
                    :assists => 7,
                    :steals => 22,
                    :blocks => 15,
                    :slam_dunks => 10},
                   {:player_name => "DeSagna Diop",
                    :number => 2,
                    :shoe => 14,
                    :points => 24,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 4,
                    :blocks => 5,
                    :slam_dunks => 5},
                   {:player_name => "Ben Gordon",
                    :number => 8,
                    :shoe => 15,
                    :points => 33,
                    :rebounds => 3,
                    :assists => 2,
                    :steals => 1,
                    :blocks => 1,
                    :slam_dunks => 0},
                   {:player_name => "Kemba Walker",
                    :number => 33,
                    :shoe => 15,
                    :points => 6,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 7,
                    :blocks => 5,
                    :slam_dunks => 12}]
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
 
      #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
      data.each do |data_item|
          binding.pry
      end
    end
  end
end

#good_practices

def num_points_scored(player_name)
  players_points = {}
  game_hash = game_hash()
  game_hash.each do |place, team|  
    team.each do |key, player_stats|      
      if key == :players
        player_stats.each do |stats|
        if stats[:player_name] == player_name
          return stats[:points]
        end  
        end
      end              
    end
  end
end

def shoe_size(player_name)
  game_hash = game_hash()
  game_hash.each do |place, team| 
    team[:players].each do |player_stats|
      if player_stats[:player_name] == player_name
        return player_stats[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  array = []
  game_hash = game_hash()
  game_hash.each do |place, team| 
    next if team[:team_name] != team_name    
    array = team[:colors]   
    # another way of writing using collect
    # return team[:colors].collect do |color| color 
  end
  array
end

def team_names()
  array = []
  game_hash = game_hash()
  game_hash.each do |place, team| 
    array.push(team[:team_name]) 
  end
  array
end

def player_numbers(team_name)
  array = []
  game_hash = game_hash()
  game_hash.each do |place, team|     
    next if team[:team_name] != team_name    
    team[:players].each do |player|
      array.push(player[:number])
    end  
  end
  array
end

def player_stats(player_name)
  player_hash = {}
  game_hash = game_hash()
  game_hash.each do |place, team| 
        
       
    team[:players].each do |player|
      next if player[:player_name] != player_name 
      player_hash = player
      player_hash.delete(:player_name)
    end  
  end
  player_hash
end

def big_shoe_rebounds()
  hash = {}
  game_hash = game_hash()
  game_hash.each do |place, team| 
    team[:players].each do |players|
    # puts players[:player_name]
      hash[players[:player_name]] = players[:shoe]
    end      
  end

  player_name = ""
  player_name = hash.key(hash.values.max)
  game_hash.each do |place, team| 
    team[:players].each do |player|
      next if player[:player_name] != player_name
      return player[:rebounds]
    end
  end
end

def most_points_scored()
  hash = {}
  game_hash = game_hash()
  game_hash.each do |place, team| 
    team.each do |key, value|
      if key == :players          
        value.each do |data|  
          hash[data[:player_name]]  = data[:points]
        end
      end      
    end
  end
  return hash.max_by{|k,v| v}[0]
end

def winning_team()
  point_hash = {}
  
  game_hash = game_hash()
  game_hash.each do |place, team|      
    total = 0
    team[:players].each do |stats|            
       total += stats[:points]           
    end  
    point_hash[team[:team_name]] = total
  end  
  
  point_hash.key(point_hash.values.max)
end

def player_with_longest_name()
  player_hash = {}
  total = 0
  game_hash = game_hash()
  game_hash.each do |place, team|                
    team[:players].each do |stats|            
       player_hash[stats[:player_name]] = stats[:player_name].length     
    end  
    
  end  
  
  player_hash.key(player_hash.values.max)
end

def most_steals()
hash = {}
  game_hash = game_hash()
  game_hash.each do |place, team| 
    team.each do |key, value|
      if key == :players          
        value.each do |data|  
          hash[data[:player_name]]  = data[:steals]
        end
      end      
    end
  end
  return hash.max_by{|k,v| v}[0]
end

def long_name_steals_a_ton?
  most_steals = most_steals()
  player_with_longest_name = player_with_longest_name()


  if player_with_longest_name == most_steals
    return true  
  end  
end










