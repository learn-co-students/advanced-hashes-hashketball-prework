
# Write your code here!
require "pry"


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




def find_player(name)
  hash = game_hash
  
  hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == name
           return hash[location][attribute][player]
          end
          end 
        end
    end
  end
end



def num_points_scored(name)
  find_player(name)[:points]
end



def shoe_size(name)
  find_player(name)[:shoe]
end



def find_team(name)
  hash = game_hash
  
  hash.each do |team, team_data|
    if team_data.values.include?(name)
     return hash[team]
    end
  end
end


      



def team_colors(name)
  find_team(name)[:colors]
end



def team_names
  hash = game_hash
  
  names = Array.new
  
  hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        names << data
     end
    end
  end
  names
end



def player_numbers(team_name)
  array = Array.new
  
  find_team(team_name)[:players].each do |player, stats|
    stats.collect do |info, num|
      if info == :number
        array << num
      end
   end
  end
  array
end



def player_stats(name)
  find_player(name)
end



def big_shoe_rebounds
  hash = game_hash

  shoe_size = 0
  rebounds = 0
  
  hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      if stats[:shoe] > shoe_size
        shoe_size = stats[:shoe]
        rebounds = stats[:rebounds]
      end
    end
  end
  rebounds
end
    
        



    
    
      


  
