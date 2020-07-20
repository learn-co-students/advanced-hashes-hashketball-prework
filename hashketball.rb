def game_hash
    hash = {
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
                        :rebounds => 11,
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
    }, :away => {
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
            "Bismack Biyombo" => {
                :number => 0,
                :shoe => 16,
                :points => 12,
                :rebounds => 4,
                :assists => 7,
                :steals => 22,
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
            "Kemba Walker" => {
                :number => 33,
                :shoe => 15,
                :points => 6,
                :rebounds => 12,
                :assists => 12,
                :steals => 7,
                :blocks => 5,
                :slam_dunks => 12
            }

         }
    }}
    end

def num_points_scored(player)
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if data.include?(player)
               return game_hash[location][attribute][player][:points]
                end
            end
        end
end

def shoe_size(player)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data.include?(player)
        return game_hash[location][attribute][player][:shoe]
end 
end 
end 
end 

def team_colors(name)
    game_hash.each do |location, team_data|
        if game_hash[location].values.include?(name)
            
            team_data.each do |attribute, value|
             
                if attribute == :colors

                    return value
                   
                    end
                end
            end
        end
    end
    
    def team_names
      team_array = [] 
      game_hash.each do |location, team_data|
        team_data.each do |attribute, value|
          if attribute == :team_name
            team_array << value
end 
end 
end 
return team_array
      
    end 
    
    
def player_numbers(team_name)
    number_array = []
 game_hash.each do |location, team_data|
   if game_hash[location].values.include?(team_name)
     team_data.each do |attribute, value|
       if attribute == :players
        value.each do |name, stats|
          number_array.push(game_hash[location][attribute][name][:number])
        end 
       end 
     end 
   end 
 end 
 return number_array
 end 
       
 def player_stats(player_name)
   hash = {}
   game_hash.each do |location, team_data|
     team_data.each do |attribute, data|
       if data.include?(player_name)
         hash = game_hash[location][attribute][player_name]
       end 
     end 
   end 
   hash
   end
   
   
   def big_shoe_rebounds
    player_rebound = nil 
    shoe_data = []
    biggest_shoe = nil
    
    game_hash.collect do |location, team_data|
      team_data[:players].collect do |attribute, data|
        shoe_data.push(data[:shoe])
        biggest_shoe = shoe_data.sort[-1]
        data.collect do |category, stat|
          if category == :shoe 
            if stat == biggest_shoe
              player_rebound = data[:rebounds]
            end 
          end 
        end 
      end 
    end 
    player_rebound
  end 
    
  
def most_points_scored 
   points_data = [] 
   most_points = nil
   
   name = nil 
      game_hash.each do |location, team_data|
      team_data[:players].each do |attribute, data|
      points_data.push(data[:points])
      most_points = points_data.sort[-1]
    end 
  end 
  game_hash.each do |location, team_data|
    name = team_data[:players].each do |name, stats|
      if stats[:points] == most_points
     return name 
   end 
 end 
 end 
end 


def winning_team
    home_team = [] 
    away_team = []
    game_hash.each do |location, team_data|
      game_hash[:home][:players].each do |attribute, data|
        home_team.push(data[:points])
      end 
    end 
    game_hash.each do |location, team_data|
      game_hash[:away][:players].each do |attribute, data|
        away_team.push(data[:points])
      end 
    end 
    if home_team.sum > away_team.sum 
      return game_hash[:home][:team_name]
    else 
      return game_hash[:away][:team_name]
    end 
  end 
    
    def player_with_longest_name
      list = [] 
      game_hash.each do |location, team_data|
        team_data[:players].each do |name, stats|
          list.push(name)
        end 
      end 
      list.max_by(&:length)
    end 
      
    def long_name_steals_a_ton? 
      list_names = [] 
      most_steals = [] 
      game_hash.each do |location, team_data|
        team_data[:players].each do |name, stats|
          list_names.push(name)
          most_steals.push(stats[:steals])
        end 
      end 
      game_hash.each do |location, team_data|
        team_data[:players].each do |name, stats|
          if name == list_names.max_by(&:length) && stats[:steals] ==  most_steals.max
            return true 
          end 
        end 
      end 
    
    
      
    end
    
    
    