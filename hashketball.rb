# Write your code here!
require 'pry'

def game_hash

  team_hash = {
    :home =>{
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" =>{
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
    :away=>{
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
        "Brendan Haywood" =>{
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


def num_points_scored (name)
  points_scored = 0
  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |data_item|
            if data_item[0] == name
              points_scored = data_item[1][:points]
          end
        end
      end
    end
  end
points_scored
end

def shoe_size (name)
  foot_size = 0
  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |data_item|
            if data_item[0] == name
              foot_size = data_item[1][:shoe]
          end
        end
      end
    end
  end
foot_size
end


def team_colors (team)
  color_array = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
       color_array = team_data[:colors]
    end
  end
  color_array
end

def team_names
  team_array = []
  game_hash.each do |location, team_data|

    if team_data [:team_name]
      team_array << team_data [:team_name]
    end
  end

  team_array
end

def player_numbers(team)
  player_num_array = []

  game_hash.each do |location, team_data|
      if team_data[:team_name] == team
        team_data.each do |attribute, data|
          if attribute == :players
            data.each do |stat_name, stat|
                player_num_array << stat[:number]
            end
          end
        end
      end
    end
  player_num_array
end


def player_stats (player)
statistics = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, stat|
          if player_name == player
            statistics = stat
          end
        end
      end
    end
  end
statistics
end

def big_shoe_rebounds
  current_biggest_shoe = 0
  current_rebounds = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, stat|
          if stat[:shoe] > current_biggest_shoe
             current_biggest_shoe = stat[:shoe]
             current_rebounds = stat[:rebounds]
           end
        end
      end
    end
  end
current_rebounds
end

def most_points_scored
  most_points_currently = 0
  most_points_player = ""

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, stats|
          if stats[:points] > most_points_currently
            most_points_currently = stats[:points]
            most_points_player = player_name
          end
        end
      end
    end
  end
  most_points_player
end


def winning_team
  points_home = 0
  points_away = 0
  home_team = game_hash[:home][:team_name]
  away_team = game_hash[:away][:team_name]

  game_hash.each do |location, team_data|
    if location == :home
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |player_name, stats|
            points_home += stats[:points]
          end
        end
      end
    else
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |player_name, stats|
            points_away += stats[:points]
          end
        end
      end
    end
  end

  if points_home > points_away
    home_team
  else
    away_team
  end

end

#winning_team

def player_with_longest_name
  most_name_currently = 0
  longest_named_player = ""

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, stats|
          if player_name.length > most_name_currently
            most_name_currently = player_name.length
            longest_named_player = player_name
          end
        end
      end
    end
  end
  longest_named_player
end

def long_name_steals_a_ton?
  highest_number_steals = 0
  most_steals = ""

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, stats|
          if stats[:steals] > highest_number_steals
            highest_number_steals= stats[:steals]
            most_steals = player_name
          end
        end
      end
    end
  end
  most_steals == player_with_longest_name
end
