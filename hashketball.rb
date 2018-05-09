# Write your code here!
def game_hash
  game_hash = {
    :home =>{
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
    :away =>{
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

def num_points_scored(player_name)
  player_points =[]
  
  game_hash.each do |team, data|
    
    data[:players].each do |player, stat|
      if player == player_name
        player_points.push(stat[:points])
      end
    end
  end
  
  return player_points[0]
  
end
  
def shoe_size(player_name)
  player_shoe_size = []
  
  game_hash.each do |team, data|
    
    data[:players].each do |player, stat|
      if player == player_name
        player_shoe_size.push(stat[:shoe])
      end
    end
  end
  
  return player_shoe_size[0]
end

def team_colors(team)
  colors = []
  
  game_hash.each do |teams, data|
    if team == data[:team_name]
      colors.push(data[:colors])
    end
  end
 
 return colors.flatten

end
    
def team_names
  teams = []
  
  game_hash.each do |which_team, data|
    
    teams.push(data[:team_name])
  end
  
  return teams
end

def player_numbers(team)
  player_jersey = []
  
  game_hash.each do |teams, data|
    if team == data[:team_name]
    data[:players].each do |player, stat|
        player_jersey.push(stat[:number])
      end
    end
  end
  
  return player_jersey
  
end

def player_stats(player_name)
  player_name_stats = []
  
  game_hash.each do |teams, data|
    data[:players].each do |player, stat|
      if player == player_name
        player_name_stats.push(stat)
      end
    end
  end
  
  return player_name_stats[0]
end

def big_shoe_rebounds
  shoe_size = []
  most_rebounds = []

  game_hash.each do |teams, data|
    data[:players].each do |player, stat|
      shoe_size.push(stat[:shoe])
    end
  end

  largest_shoe = shoe_size.sort[shoe_size.length - 1]

  game_hash.each do|teams,data|
    data[:players].each do |player, stat|
      if largest_shoe == stat[:shoe]
        most_rebounds.push(stat[:rebounds])
      end
    end
  end
  
  return most_rebounds[0]
  
end


