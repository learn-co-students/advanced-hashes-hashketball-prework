require "pry"
def game_hash
   {
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
    if game_hash[:home][:players].include?(name)
      game_hash[:home][:players][name][:points]
    elsif game_hash[:away][:players].include?(name)
      game_hash[:away][:players][name][:points]
    end
    end

def shoe_size(name)
  if game_hash[:home][:players].include?(name)
    game_hash[:home][:players][name][:shoe]
  elsif game_hash[:away][:players].include?(name)
    game_hash[:away][:players][name][:shoe]
  end
  end

  def team_colors(team_name)
    game_hash.each do |team, team_data|
      team_data.each do |key, value|
        if value == team_name
          return team_data[:colors]
        end
      end
    end
  end

  def team_names
    game_hash.collect do |team, team_hash|
      team_hash[:team_name]
    end
  end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |location, location_hash|
    location_hash.each do |location_hash, data|
      if data == team_name
        game_hash[location][:players].each do |name, stat|
          numbers << game_hash[location][:players][name][:number]
        end
      end
    end
  end
  numbers
end

def big_shoe_rebounds
  biggest_shoe = 0
  rebounds = 0
  game_hash.each_value do |team|
    team[:players].each_value do |stats|
      if stats[:shoe] > biggest_shoe
        rebounds = stats[:rebounds]
      end
    end
  end
  rebounds
end

def most_point_scored
  score = 0
  game_hash.each_value do |team|
    team[:players].each_value do |stats|
      if stats[:points] > score
        score = stats[:points]
      end
    end
  end
  score
end

def winning_team
  home_score = 0
  away_score = 0
  game_hash[:home][:players].each_value do |stats|
    home_score += stats[:points]
  end
  game_hash[:away][:players].each_value do |stats|
    away_score += stats[:points]
  end

  if home_score > away_score
    game_hash[:home][:team_name]
  else
    game_hash[:away][:away_name]
  end
end

def player_with_longest_name
  name =""
  game_hash.each_value do |team|
    team[:players].each_key do |player|
      if player.length > name.length
        name = player
      end
    end
  end
  name
end
