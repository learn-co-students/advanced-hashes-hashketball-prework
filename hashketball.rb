# Write your code here!
require "pry"


def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1
        },
        "Reggie Evans" => {
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7
        },
        "Brook Lopez" => {
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15
        },
        "Mason Plumlee" => {
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 12,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5
        },
        "Jason Terry" => {
        number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1
        },
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2
        },
        "Bismak Biyombo" => {
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 7,
        blocks: 15,
        slam_dunks: 10
        },
        "DeSagna Diop" => {
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5
        },
        "Ben Gordon" => {
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0
        },
        "Brendan Haywood" => {
        number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals: 22,
        blocks: 5,
        slam_dunks: 12
        },
      }
    }
  }

end

def num_points_scored(player)
  points = 0
  game_hash.each do |home_or_away, team_data|
    #go into team player data
      team_data[:players].each do |player_name, stats|
        if player_name == player
          points = stats[:points]
        end
      end
  end

points

end

def shoe_size(player)
  size = 0
  game_hash.each do |home_or_away, team_data|
    #go into team player data
      team_data[:players].each do |player_name, stats|
        if player_name == player
          size = stats[:shoe]
        end
      end
  end

size
end

def team_colors(team)
  colors = nil
  game_hash.each do |home_or_away, team_data|
    #go into team player data
    if team_data[:team_name] == team
      colors = team_data[:colors]
    end
  end

colors
end

def team_names
  game_hash.collect do |home_or_away, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team)
  numbers = []
  game_hash.each do |home_or_away, team_data|
    #go into team player data
    if team_data[:team_name] == team
      team_data[:players].each do |player_name, stats|
        numbers << stats[:number]
      end
    end
  end

numbers

end

def player_stats(player)
  statistics = nil
  game_hash.each do |home_or_away, team_data|
    #go into team player data
      team_data[:players].each do |player_name, stats|
        if player_name == player
           statistics = stats
        end
      end
  end

statistics
end

def big_shoe_rebounds
  largest_shoe_player = ""
  #get largest shoe player

  game_hash.each do |home_or_away, team_data|
    #go into the players stats
    team_data[:players].each do |player_name, stats|

      if shoe_size(player_name) > shoe_size(largest_shoe_player)
        largest_shoe_player = player_name
      end

    end
  end

  #get number of rebounds
  rebounds = 0
  game_hash.each do |home_or_away, team_data|
    #go into team player data
      team_data[:players].each do |player_name, stats|
        if player_name == largest_shoe_player
          rebounds = stats[:rebounds]
        end
      end
  end

rebounds
end
