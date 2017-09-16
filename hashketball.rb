# Write your code here!
require "pry"

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe =>  16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe =>  14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe =>  17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe =>  19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe =>  15,
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
          :shoe =>  18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe =>  16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe =>  14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe =>  15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe =>  15,
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
  answer = nil
  game_hash.each do |role, data|
    data.each do |team, attributes|
      if team == :players
        attributes.each do |player, stats|
          if player == player_name
            answer = stats[:points]
          end
        end
      end
    end
  end
  answer
end

def shoe_size(player_name)
  answer = nil
  game_hash.each do |role, data|
    data.each do |team, attributes|
      if team == :players
        attributes.each do |player, stats|
          if player == player_name
            answer = stats[:shoe]
          end
        end
      end
    end
  end
  answer
end

def team_colors(team_name)
  answer = nil
  game_hash.each do |role, data|
    if data[:team_name] == team_name
      answer = data[:colors]
    end
  end
  answer
end

def team_names
  answer = Array.new
  game_hash.each do |role, data|
    answer << data[:team_name]
  end
  answer
end

def player_numbers(team_name)
  answer = Array.new
  game_hash.each do |role, data|
    if data[:team_name] == team_name
      data[:players].each do |player, stats|
        answer << stats[:number]
      end
    end
  end
  answer
end

def player_stats(player_name)
  answer = Hash.new
  game_hash.each do |role, data|
    data.each do |team, attributes|
      if team == :players
        attributes.each do |player, stats|
          if player == player_name
            answer = stats
          end
        end
      end
    end
  end
  answer
end

def big_shoe_rebounds
  biggest_shoe_size = 0
  biggest_shoe_size_player = nil
  answer = nil
  game_hash.each do |role, data|
    data.each do |team, attributes|
      if team == :players
        attributes.each do |player, stats|
          if stats[:shoe] > biggest_shoe_size
            biggest_shoe_size = stats[:shoe]
            biggest_shoe_size_player = player
          end
        end
      end
    end
  end
  game_hash.each do |role, data|
    data.each do |team, attributes|
      if team == :players
        attributes.each do |player, stats|
          if player == biggest_shoe_size_player
            answer = stats[:rebounds]
          end
        end
      end
    end
  end
  answer
end
