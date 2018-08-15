require "pry"


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
good_practices

def game_hash
  {
    
  }
end 


def num_points(player_name)
  
end


def shoe_size(player_name)
  
end 


def team_colors(team_name)
  
end 


def team_names
  
end


def player_numbers(team_name)
  
end 


def player_stats(player_name)
  
end 


def big_shoe rebounds
  
end  


def most_points_scored 
  
end 


def winning_team
  
end 


def player_with_longest_name
  
end 


def long_name_steals_a_ton?
# So create an array_of_steal _values 
# player_stats(pass player_with_longest_name)[steals] == array_of_steal_values.sort[-1]
end 