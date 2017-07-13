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
          :slam_dunks => 1,
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7,
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15,
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5,
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1,
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
          :slam_dunks => 2,
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10,
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5,
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0,
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12,
        },
      },
    },
  }
end



def num_points_scored(player_name)
  if game_hash[:home][:players].keys.include? player_name
    points = game_hash[:home][:players][player_name][:points]
  elsif game_hash[:away][:players].keys.include? player_name
    points = game_hash[:away][:players][player_name][:points]
  end
  points
end


def shoe_size(player_name)
  if game_hash[:home][:players].keys.include? player_name
    size = game_hash[:home][:players][player_name][:shoe]
  elsif game_hash[:away][:players].keys.include? player_name
    size = game_hash[:away][:players][player_name][:shoe]
  end
  size
end

def team_colors(team)
  if game_hash[:home][:team_name] == team
    colors = game_hash[:home][:colors]
  elsif game_hash[:away][:team_name] == team
    colors = game_hash[:away][:colors]
  end
  colors
end

def team_names
  names = []
  names << game_hash[:home][:team_name]
  names << game_hash[:away][:team_name]
end

def player_numbers(team)
  numbers = []
  if game_hash[:home][:team_name] == team
    game_hash[:home][:players].each do |player_name, player_data|
      numbers << game_hash[:home][:players][player_name][:number]
    end
  elsif game_hash[:away][:team_name] == team
    game_hash[:away][:players].each do |player_name, player_data|
      numbers << game_hash[:away][:players][player_name][:number]
    end
  end
  numbers
end

def player_stats(player_name)
  if game_hash[:home][:players].keys.include? player_name
    stats = game_hash[:home][:players][player_name]
  elsif game_hash[:away][:players].keys.include? player_name
    stats = game_hash[:away][:players][player_name]
  end
  stats
end

def big_shoe_rebounds
  biggest_shoe = 0
  biggest_player = ""
  biggest_player_rebound = 0

  game_hash[:home][:players].each do |player_name, player_data|
    if game_hash[:home][:players][player_name][:shoe] > biggest_shoe
      biggest_player = player_name
      biggest_shoe = game_hash[:home][:players][player_name][:shoe]
      biggest_player_rebound = game_hash[:home][:players][player_name][:rebounds]
    end
  end

  game_hash[:away][:players].each do |player_name, player_data|
    if game_hash[:away][:players][player_name][:shoe] > biggest_shoe
      biggest_player = player_name
      biggest_shoe = game_hash[:away][:players][player_name][:shoe]
      biggest_player_rebound = game_hash[:away][:players][player_name][:rebounds]
    end
  end

  biggest_player_rebound

end
