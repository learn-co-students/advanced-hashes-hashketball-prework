require 'pry'


def game_hash
  game_hash = {
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

def num_points_scored(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, info|
      if player == name
        return info[:points]
      end 
    end 
  end 
end 

def shoe_size(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, info|
      if player == name
        return info[:shoe]
      end 
    end 
  end 
end 

def team_colors(team)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team 
      return team_data[:colors]
    end 
  end 
end 

def team_names
  teams = []
  game_hash.each do |location, team_data|
    teams << team_data[:team_name]
  end 
  teams 
end 

def player_numbers(team)
  numbers = [] 
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team 
      team_data[:players].each do |player|
        numbers << player[1][:number]
      end 
    end 
  end 
  numbers
end 


def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player[0] == player_name
        return player[1]
        # binding.pry 
      end 
    end 
  end 
end


def game_hash
  game_hash = {
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
      "DiSangna Diop" => {
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

def num_points_scored(name)
  points = 0 
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, info|
      if player == name
        points += info[:points].to_i 
      end 
    end 
  end 
  points 
end 

def big_shoe_rebounds
  biggest_shoe = 0 
  shoe_rebounds = 0 
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player[1][:shoe] > biggest_shoe
        shoe_rebounds = player[1][:rebounds]
      end 
    end 
  end 
  shoe_rebounds
end 

def most_points_scored
  players_array = [] 
  points = 0 
  most_points = "" 
  game_hash.each do |location, team_data|
    players_array << team_data[:players].keys
  end 
  players_array.flatten.each do |player|
     player_points = num_points_scored(player)
    if player_points > points 
      most_points = player 
      points = player_points
    end 
  end 
  most_points 
end 

def winning_team
  winner = ""
  points_hash = {home: 0, away: 0}
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      points_hash[location] += player[1][:points]
    end 
  end 
  winner_array = points_hash.max_by{|k,v| v}
  game_hash.each do |location, team_data|
    if winner_array[0] == location 
      winner = game_hash[location][:team_name]
    end 
  end 
  puts winner 
end 

winning_team



