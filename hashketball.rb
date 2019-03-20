require 'pry'

def game_hash
  hash = {:home => 
           {:team_name => "Brooklyn Nets",
            :colors => ["Black", "White"], 
            :players => 
              {"Alan Anderson" => {:number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
               "Reggie Evans" => {:number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
               "Brook Lopez" => {:number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
               "Mason Plumlee" => {:number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
               "Jason Terry" => {:number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
              } 
           },
          :away => 
          {:team_name => "Charlotte Hornets",
           :colors => ["Turquoise", "Purple"], 
           :players => 
             { "Jeff Adrien" => {:number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
               "Bismak Biyombo" => {:number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10},
               "DeSagna Diop" => {:number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
               "Ben Gordon" => {:number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
               "Brendan Haywood" => {:number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12}
             } 
          } 
         }  
end

def num_points_scored(player_name)
  game_hash.each do |location, attribute|
      attribute.each do |detail, value|
        if detail == :players
          value.each do |key, value2|
             if key == player_name
               value2.each do |stat_name, stat_value|
                 if stat_name == :points
                   return stat_value.to_i
                end
              end  
            end  
          end
       end  
    end
  end  
end  

def shoe_size(players_name)
  game_hash.each do |location, attributes|
      attributes.each do |attribute_type, attribute_value|
        if attribute_type == :players
          attribute_value.each do |name, stat_value|
            if players_name == name
              return stat_value[:shoe].to_i
            end  
          end
        end    
      end  
  end 
end  

def team_colors(team_name)
  game_hash.each do |location, attribute|
      if attribute[:team_name] == team_name 
        attribute.each do |attribute_type, attribute_value|
          if attribute_type == :colors
            return attribute_value
          end  
        end  
      end  
    end
end  

def team_names
  team_ary = []
  game_hash.each do |location, attributes|
    attributes.each do |attribute_type, attribute_value|
      if attribute_type == :team_name 
        team_ary = team_ary << attribute_value 
      end
    end  
  end
  return team_ary
end  

def player_numbers(team_name_passed_in)
  number_ary = []
  game_hash.each do |location, attributes|
        if attributes[:team_name] == team_name_passed_in
           attributes.each do |attribute_type, attribute_value|
             if attribute_type == :players
               attribute_value.each do |name, stats|
                 stats.each do |stat_name, stat_value|
                   if stat_name == :number
                    number_ary = number_ary.push(stat_value.to_i)
                   end 
                 end
               end   
             end   
           end
        end
   
  end 
  return number_ary
end

def player_stats(player_name)
  game_hash.each do |location, attributes|
      attributes[:players].each do |name, stats|
          if player_name == name
           return stats
          end  
      end
  end  
end  

def big_shoe_rebounds
  biggest_shoe = 0
  game_hash.each do |location, attributes|
    attributes[:players].each do |name, stats|
      stats.each do |stat_name, stat_value|
        if stat_name == :shoe
          if stat_value > biggest_shoe 
            biggest_shoe = stat_value
            return stats[:rebounds]
          end  
        end  
      end 
    end  
  end
end  
