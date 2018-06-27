# Write your code here!
def game_hash
  
  hash = {
    
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players => {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        }, 
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
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
    
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
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
  return hash
end

def num_points_scored(player_name)
  stat = []
  game_hash.each do |top,second| 
    second.each do |second_key,third|
      if third.include?(player_name)
      third.each do |player,stats|
        if player == player_name 
          stats.each{|x,y| stat.push(y) }
        end
        end
      end
    end
  end
stat[2]
end

def shoe_size(player_name)
  stat = []
  game_hash.each do |top,second| 
    second.each do |second_key,third|
      if third.include?(player_name)
      third.each do |player,stats|
        if player == player_name 
          stats.each{|x,y| stat.push(y) }
        end
        end
      end
    end
  end
stat[1]
end

def team_colors(team_name)
  colors = []
  game_hash.each do |team, team_hash|
    if team_hash[:team_name] == team_name
      team_hash[:colors].collect do |color|
      colors.push(color)
      end
    end
  end
return colors
end

def team_names
  names = []
  game_hash.each do |team, team_hash|
    names.push(team_hash[:team_name])
  end
  return names
end

def players_numbers(team_name)
  names = []
  game_hash.each do |team, team_hash|
    team_hash[:team_name]
  end
  return names
end

def player_numbers(string)
  names = []  
  game_hash.each do |team,team_name| 
  if team_name[:team_name] == string
    team_name[:players].each do |x,y| 
      names.push(y[:number])
    end
  end
end
names
end

def player_stats(string)
game_hash.each do |team,team_name| 
  if game_hash[team][:players].include?(string)
    return game_hash[team][:players][string]
    end
  end
end