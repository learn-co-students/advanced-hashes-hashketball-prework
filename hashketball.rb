# Write your code here!
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
  game_hash.each do |team, team_data|
    if team_data[:players].include?(name)
      return team_data[:players][name][:points]
    end
  end
end


def shoe_size(name)
  game_hash.each do |team, team_data|
    if team_data[:players].include?(name)
      return team_data[:players][name][:shoe]
    end
  end
end

def team_colors(team_name)
  game_hash.each do |team, team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  end
end

def team_names
  game_hash.collect {|team, team_data| team_data[:team_name]}
end

def player_numbers(team_name)
  array = []
  game_hash.each do |team, team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each do |name, stats|
        array << stats[:number]
      end
    end
  end
  array
end

def player_stats(name)
  game_hash.each do |team, team_data|
    if team_data[:players].include?(name)
      return team_data[:players][name]
    end
  end
end

def big_shoe_rebounds
  shoe_high_water_mark = 0
  rebounds = nil
  game_hash.each do |team, team_data|
    team_data[:players].each do |name, stats|
      if stats[:shoe] > shoe_high_water_mark
        shoe_high_water_mark = stats[:shoe]
        rebounds = stats[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  pts_hwm = 0
  sharp_shooter = nil
  game_hash.each do |team, team_data|
    team_data[:players].each do |name, stats|
      if stats[:points] > pts_hwm
        pts_hwm = stats[:points]
        sharp_shooter = name
      end
    end
  end
  sharp_shooter
end

def winning_team
  nets = game_hash[:home][:team_name]
  hornets = game_hash[:away][:team_name]
  score = {
    nets => 0,
    hornets => 0
  }
  game_hash.each do |team, team_data|
    team_data[:players].each do |name, stats|
      score[game_hash[team][:team_name]] += stats[:points]
    end
  end
  if score[nets] > score[hornets]
    return nets
  else
    return hornets
  end
end

def player_with_longest_name
  name_length_hwm = ""
  game_hash.each do |team, team_data|
    team_data[:players].each do |name, stats|
      if name.length > name_length_hwm.length
        name_length_hwm = name
      end
    end
  end
  name_length_hwm
end

def long_name_steals_a_ton?
  most_steals = 0
  longest_name_steals = 0
  game_hash.each do |team, team_data|
    team_data[:players].each do |name, stats|
      if stats[:steals] > most_steals
        most_steals = stats[:steals]
      end
      if name == player_with_longest_name
        longest_name_steals = stats[:steals]
      end
    end
  end
  longest_name_steals == most_steals ? true : false
end
