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
          },
        },
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
          },
        },
      },
  }
end

def num_points_scored(players_name)
  # points = 0
  game_hash.each do |location, team_info|
    team_info.each do |team_attributes, values|
      if team_attributes == :players
        values.each do |name, stats|
          if name == players_name
            return points = stats[:points]
          end
        end
      end
      # if players_name == values[:players_name]
      #   points = values[:points]
      # end
      # binding.pry
    end
  end
  # points
end

def shoe_size(players_name)
  game_hash.each do |location, team_info|
    team_info[:players].each do |name, stats|
      if name == players_name
        return stats[:shoe]
      end
    end
  end
end

def team_colors(name)
  game_hash.each do |location, team_info|
    if name == team_info[:team_name]
      return team_info[:colors]
    end
  end
end

def team_names
  names_array = []
  game_hash.each do |location, team_info|
      team_info.each do |team_attributes, values|
        if team_attributes == :team_name
          names_array << values
        end
      end
  end
  names_array
end

def player_numbers(team_name)
  numbers_array = []
  game_hash.each do |location, team_info|
    if team_info[:team_name] == team_name
      team_info[:players].each do |name, stats|
        numbers_array << stats[:number]
      end
    end
  end
  numbers_array
end

def player_stats(players_name)
  game_hash.each do |location, team_info|
    team_info[:players].each do |name, stats|
      if name == players_name
        return stats
      end
    end
  end
end

def big_shoe_rebounds
  largest_size = 0
  players_name = ""
  game_hash.each do |location, team_info|
    team_info[:players].each do |name, stats|
      if stats[:shoe] > largest_size
        largest_size = stats[:shoe]
        players_name = name
      end
    end
    return team_info[:players][players_name][:rebounds]
  end
end

def most_points_scored
  biggest_points = 0
  players_name = ""
  game_hash.each do |location, team_info|
    team_info[:players].each do |name, stats|
      if stats[:points] > biggest_points
        biggest_points = stats[:points]
        players_name = name
      end
    end
  end
  players_name
end

def winning_team
  home_scores = 0
  away_scores = 0
  game_hash[:home][:players].each do |name, stats|
    home_scores += stats[:points]
  end
  game_hash[:away][:players].each do |name, stats|
    away_scores += stats[:points]
  end
  if home_scores > away_scores
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  length = 0
  players_name = ""

  game_hash.each do |location, team_info|
    team_info[:players].each do |name, stats|
      if name.length > length
        length = name.length
        players_name = name
      end
    end
  end
players_name
end

def long_name_steals_a_ton?
  steals = 0
  players_name = ""
  game_hash.each do |location, team_info|
    team_info[:players].each do |name, stats|
      if stats[:steals] > steals
        steals = stats[:steals]
        players_name = name
      end
    end
  end
binding.pry
player_with_longest_name == players_name
end
