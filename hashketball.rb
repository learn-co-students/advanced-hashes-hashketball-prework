# Write your code here!
require 'pry'
def game_hash
  hash = {
    :home => {
        team_name: "Brooklyn Nets",
        colors: ["Black", "White"],
        players: [
              {
                player_name: "Alan Anderson",
                number: 0,
                shoe: 16,
                points: 22,
                rebounds: 12,
                assists: 12,
                steals: 3,
                blocks: 1,
                slam_dunks: 1
              },
              {
                player_name: "Reggie Evans",
                number: 14,
                shoe: 12,
                points: 12,
                rebounds: 12,
                assists: 12,
                steals: 12,
                blocks: 12,
                slam_dunks: 1
            },
              {
                player_name: "Brook Lopez",
                number: 11,
                shoe: 17,
                points: 17,
                rebounds: 19,
                assists: 10,
                steals: 3,
                blocks: 1,
                slam_dunks: 15
            },
              {
                player_name: "Mason Plumlee",
                number: 1,
                shoe: 19,
                points: 26,
                rebounds: 12,
                assists: 6,
                steals: 3,
                blocks: 8,
                slam_dunks: 5
            },
              {
                player_name: "Jason Terry",
                number: 31,
                shoe: 15,
                points: 19,
                rebounds: 2,
                assists: 2,
                steals: 4,
                blocks: 11,
                slam_dunks: 1
            }
        ]
      },
      :away => {
        team_name: "Charlotte Hornets",
        colors: ["Turquoise", "Purple"],
        players: [
              {
                player_name: "Jeff Adrien",
                number: 4,
                shoe: 18,
                points: 10,
                rebounds: 1,
                assists: 1,
                steals: 4,
                blocks: 7,
                slam_dunks: 2
            },
              {
                player_name: "Bismak Biyombo",
                number: 0,
                shoe: 16,
                points: 12,
                rebounds: 4,
                assists: 7,
                steals: 7,
                blocks: 15,
                slam_dunks: 10
            },
              {
                player_name: "DeSagna Diop",
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5
            },
              {
                player_name: "Ben Gordon",
                number: 8,
                shoe: 15,
                points: 33,
                rebounds: 3,
                assists: 2,
                steals: 1,
                blocks: 1,
                slam_dunks: 0
            },
              {
                player_name: "Brendan Haywood",
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 22,
                blocks: 5,
                slam_dunks: 12

        }
      ]
    }
  }
end

def num_points_scored(name)
  game_hash.each do |location, game_data|
    game_hash[location].each do |player, info|
      if player == name
        return player[:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, game_data|
    game_hash[location].each do |player, info|
      if player == name
        return player[:shoe]
      end
    end
  end
end

def team_colors(tName)
  game_hash.each do |team, data|
    if game_hash[:team][:team_name] == tName
      return game_hash[team][:colors].to_a
    end
  end
end


def team_names(name)
  array_team = []
  game_hash.each do |team, data|
    if game_hash[:team][:team_name] == name
      array_team << game_hash[:team][:team_name]
    end
  end
end


def player_numbers(team)
  pNumber = []
  game_hash.each do |attrib, data|
    if game_hash[attrib][:team_name] == team
      game_hash[attrib][:players].each do |player, info|
        pNumber << info[:number]
      end
    end
  end
end


def player_stats(player)
  game_hash.each do |attrib, data|
    attrib[:players].each do |info|
      if info.has_value?(player)
        return info
      end
    end
  end
end

def big_shoe_rebounds
  largest_size = 0
  largest_player = " "
  game_hash.map do |attrib, data|
    attrib[:players].each do |info|
      if info[:shoe] > largest_size
        largest_player = info[:player_name]
        largest_size = info[:shoe]
      end
    end
  end
end
