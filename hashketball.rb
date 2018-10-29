require "pry"

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
             :colors => ["Turquoise","Purple"],
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

def num_points_scored(player_name)
  game_hash.each do |location, info|
    info[:players].collect do |player, values|
      if player == player_name
        return info[:players][player][:points]
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, info|
    info[:players].collect do |player, values|
      if player == player_name
        return info[:players][player][:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, info|
    if info[:team_name] == team_name
      return info[:colors]
    end
  end
end

def team_names
  game_hash.collect do |location, info|
      info[:team_name]
    end
  end

  def player_numbers(team_name)
    jersey_numbers = []
    game_hash.each do |location, info|
      if info[:team_name] == team_name
        info[:players].collect do |player, values|
          jersey_numbers << info[:players][player][:number]
        end
      end
    end
    return jersey_numbers
  end

  def player_stats(player_name)
    game_hash.each do |location, info|
      info[:players].collect do |player, values|
        if player == player_name
          return values
        end
      end
    end
  end

  def big_shoe_rebounds
    big_shoe_player_stats = {}
    big_shoe = 0
    game_hash.each do |location, info|
        info[:players].each do |player, values|
          if values[:shoe] > big_shoe
            big_shoe = values[:shoe]
            big_shoe_player_stats = values
          end
      end
    end
    big_shoe_player_stats[:rebounds]
end

def most_points_scored
  top_scoring_player = ""
  top_score = 0
  game_hash.each do |location, info|
      info[:players].each do |player, values|
        if values[:points] > top_score
          top_score = values[:shoe]
          top_scoring_player = player
        end
    end
  end
  top_scoring_player
end

def winning_team
  home_points = 0
  away_points = 0
  game_hash.each do |location, info|
    info[:players].each do |player, stats|
    if location == :home
       home_points += stats[:points]
     elsif location == :away
       away_points += stats[:points]
    end
  end
end
  if home_points > away_points
    game_hash[:home][:team_name]
  elsif away_points > home_points
    game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  longest_name = ""
  game_hash.each do |location, info|
    info[:players].each do |player, stats|
      if player.length > longest_name.length
        longest_name = player
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  top_steals_player = ""
  top_steals = 0
  game_hash.each do |location, info|
      info[:players].each do |player, values|
        if values[:steals] > top_steals
          top_steals = values[:steals]
          top_steals_player = player
        end
    end
  end
  if player_with_longest_name == top_steals_player
    true
  else
    false
  end
end
