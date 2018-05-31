# Write your code here!
require('pry')

def game_hash
  {
    home: {
      team_name:"Brooklyn Nets",
      colors:["Black", "White"],
      players: 
      {
      "Alan Anderson":
        {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
      "Reggie Evans":
        {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
      "Brook Lopez":
        {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
      "Mason Plumlee":
        {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        
      "Jason Terry":
        {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors:["Turquoise", "Purple"],
      players: 
      {
      "Jeff Adrien":
        {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
      "Bismak Biyombo":
        {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
      "DeSagna Diop":
        {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
      "Ben Gordon":
        {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
      "Brendan Haywood":
        {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(name)
  points_scored = 0
  
  game_hash.each do |team_name, about_team|
    about_team[:players].each do |player_name, stats|
      if player_name.to_s == name
        points_scored = stats[:points]
      end
    end
  end
  
  points_scored
end

def shoe_size(name)
  shoe_size = 0 
  
  game_hash.each do |team_name, about_team|
    about_team[:players].each do |player_name, stats|
      if player_name.to_s == name
        shoe_size = stats[:shoe]
      end
    end
  end
  
  shoe_size
end 

def team_colors(input_team_name)
  team_colors = []
  
  game_hash.each do |team_type, about_team|
    if input_team_name == about_team[:team_name].to_s
      about_team[:colors].each {|color| team_colors << color}
    end 
  end
  
  team_colors
end

def team_names
  team_list = []
  
  game_hash.each do |team_name, about_team|
    team_list << about_team[:team_name]
  end
  
  team_list
end

def player_numbers(input_team_name)
  jerseys = []
  
  game_hash.each do |team_name, about_team|
    if input_team_name == about_team[:team_name]
      about_team[:players].each do |player_name, stats|
        jerseys << stats[:number]
      end 
    end
  end
  
  jerseys
end

def player_stats(name)
  output_stats = {}
  
  game_hash.each do |team_name, about_team|
    about_team[:players].each do |player_name, stats|
      if player_name.to_s == name
        output_stats = stats 
      end
    end
  end
  
  output_stats
end

def big_shoe_rebounds
  largest_shoe_tuple = [0, 0] 
  
  game_hash.each do |team_name, about_team|
    about_team[:players].each do |player_name, stats|
      if stats[:shoe] > largest_shoe_tuple[0]
        largest_shoe_tuple[0] = stats[:shoe]
        largest_shoe_tuple[1] = stats[:rebounds]
      end
    end
  end
  
  largest_shoe_tuple[1]
end

def most_points_scored
  most_points = 0 
  most_points_name = ""
  
  game_hash.each do |team_name, about_team|
    about_team[:players].each do |player_name, stats|
      if stats[:points] > most_points
        most_points = stats[:points]
        most_points_name = player_name.to_s
      end
    end
  end
  
  most_points_name
end

def winning_team
  highest_points = 0
  winning_team_name = ""
  
  game_hash.each do |team_name, about_team|
    total_points = 0
    
    about_team[:players].each do |player_name, stats|
      total_points += stats[:points]
    end
    
    if total_points > highest_points
      highest_points = total_points
      winning_team_name = about_team[:team_name].to_s
    end
  end
  
  winning_team_name
end

def player_with_longest_name
  longest_name_length = 0
  longest_name = ""
  
  game_hash.each do |team_name, about_team|
    about_team[:players].each do |player_name, stats|
      if player_name.to_s.length > longest_name_length
        longest_name_length = player_name.to_s.length
        longest_name = player_name.to_s
      end
    end
  end
  
  longest_name
end

def most_steals
  most_steals = 0 
  most_steals_name = ""
  
  game_hash.each do |team_name, about_team|
    about_team[:players].each do |player_name, stats|
      if stats[:steals] > most_steals
        most_steals = stats[:steals]
        most_steals_name = player_name.to_s
      end
    end
  end
  
  most_steals_name
end
  
def long_name_steals_a_ton?
  most_steals == player_with_longest_name
end  
  
      

