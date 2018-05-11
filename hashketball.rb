# Write your code here!
require "pry"

def game_hash
  {
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

def home_team_name
  game_hash[:home][:team_name]
end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry

        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        #  It will break when team_name is called because you cannot iterate with .each over a string
        data.each do |data_item|
            binding.pry
        end
      end
  end
end

def num_points_scored(person)
  score = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      if player_name == person
        score = player_data[:points]
      end
    end
  end
  score
end

def shoe_size(person)
  shoe = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      if player_name == person
        shoe = player_data[:shoe]
      end
    end
  end
  shoe
end

def team_colors(team_name)
  colors = nil
  game_hash.each do |location, team_data|
    team_name == team_data[:team_name] ? (colors = team_data[:colors]) : nil
  end
  colors
end

def team_names
  result = Array.new
  game_hash.each do |location, team_data|
    result.push(team_data[:team_name])
  end
  result
end

def player_numbers(team)
  result = Array.new
  game_hash.each do |location, team_data|
    if team == team_data[:team_name]
      team_data[:players].each do |player_name, player_data|
        result.push(player_data[:number])
      end
    end
  end
  result
end

def player_stats(player)
  player_statistics = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      if player_name == player
        player_statistics = player_data
      end
    end
  end
  player_statistics
end

def big_shoe_rebounds
  biggest_shoe = 0
  person_with_biggest_shoe = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      if player_data[:shoe] > biggest_shoe
        biggest_shoe = player_data[:shoe]
        person_with_biggest_shoe = player_data
      end
    end
  end
  person_with_biggest_shoe[:rebounds]
end

def most_points_scored
  most_points = 0
  person_with_most_points = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      if player_data[:points] > most_points
        most_points = player_data[:points]
        person_with_most_points = player_name
      end
    end
  end
  person_with_most_points
end

def winning_team
  away = 0
  home = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      if location == :home
        home += player_data[:points]
      else
        away += player_data[:points]
      end
    end
  end

  home > away ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end

def player_with_longest_name
  longest_name_length = 0
  player_longest_name = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      if player_name.length > longest_name_length
        longest_name_length = player_name.length
        player_longest_name = player_name
      end
    end
  end
  player_longest_name
end

def long_name_steals_a_ton?
  most_steals = 0
  person_with_most_steals = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      if player_data[:steals] > most_steals
        most_steals = player_data[:steals]
        person_with_most_steals = player_name
      end
    end
  end
  person_with_most_steals == player_with_longest_name
end
