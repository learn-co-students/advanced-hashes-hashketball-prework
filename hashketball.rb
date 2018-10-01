require 'pry'
def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" =>
        {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" =>
        {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" =>
        {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" =>
        {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" =>
        {
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
        "Jeff Adrien" =>
        {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" =>
        {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" =>
        {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" =>
        {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" =>
        {
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
  game_hash.each do |location, team| #keys are home/away values = hashes 
    team.each do |team_info, data| #keys are :team_name etc.
      if team_info == :players
        data.each do |name, stat_hash| 
          if name == player_name
            return stat_hash[:points]
          end
        end
      end
    end
  end 
end

def shoe_size(player_name)
  game_hash.each do |location, team|
    team.each do |team_info, data|
      if team_info == :players
        data.each do |name, stat_hash|
          if name == player_name
            return stat_hash[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team|
    team.each do |team_info, data|
      if team_info == :team_name && data == team_name
        return team[:colors]
      end
    end
  end 
end

def team_names
  teams = []
 game_hash.each do |location, team|
   team.each do |team_data, data|
   if team_data == :team_name
     teams << team[:team_name]
    end
  end
end
teams
end

def player_numbers(team_name)
  jerseys = []
  game_hash.each do |location, team|
    team.each do |team_info, data|
      if data == team_name
        team[:players].each do |name, stats|
          jerseys << stats[:number]
        end
      end
    end
  end  
  jerseys
end

def player_stats(player_name)
  game_hash.each do |location, team|
    team.each do |team_info, data|
      if team_info == :players
        data.each do |name, stats|
          if name == player_name
            return stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  biggest_size = 0 
  most_rebounds = nil 
  game_hash.each do |location, team| #key away/home #value hashes
    team.each do |team_info, data|
      if team_info == :players
         data.each do |name, player_stats| #value is hash of stats
           if player_stats[:shoe] > biggest_size
             biggest_size = player_stats[:shoe]
             most_rebounds = player_stats[:rebounds]
           end 
        end
      end
      end
    end
  most_rebounds
end