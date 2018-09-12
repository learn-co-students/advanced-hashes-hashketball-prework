require 'pry'

def game_hash
  {
    home: {
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
        }, {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        }, {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        }, {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        }, {
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
    away: {
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
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        }, {
          player_name: "Bismak Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        }, {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        }, {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        }, {
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

def num_points_scored(player)
  player_points = nil
  game_hash.each do |team_location, team_data|
    players_array = team_data[:players]
    players_array.each do |player_details|
      if player_details[:player_name] == player
        player_points = player_details[:points]
      end
    end
  end
  player_points
end   

def shoe_size(player)
  game_hash.each do |team_location, team_data|
    if team_data[:team_name]
      players_array = team_data[:players]
      players_array.each do |player_details|
        if player_details[:player_name] == player 
          return player_details[:shoe]
        end
      end
    end
  end
end

def team_colors(team)  
  game_hash.each do |team_location, team_data|
    if team_data[:team_name] == team 
      return team_data[:colors]
    end
  end
end 

def team_names
  teams = []
  game_hash.each do |team_location, team_data|
    teams << team_data[:team_name]
  end
  teams
end 

def player_numbers(team)
  numbers = []
  game_hash.each do |team_location, team_data|
    if team_data[:team_name] == team 
      team_players_array = team_data[:players]
      team_players_array.each do |player|
        numbers << player[:number]
      end
    end
  end
  numbers
end


def player_stats(player)
  stats = {}
  game_hash.each do |team_location, team_data|
    players_array = team_data[:players]
    players_array.each do |player_details|
      if player_details[:player_name] == player
        stats = player_details
        stats.delete(:player_name)
      end
    end
  end
  stats
end


def big_shoe_rebounds
  biggest_shoes = 0
  rebounds = 0
  game_hash.each do |team_location, team_data|
    players_array = team_data[:players]
    players_array.each do |player_details|
      if player_details[:shoe] > biggest_shoes
        biggest_shoes = player_details[:shoe]
        rebounds = player_details[:rebounds]
      end
    end
  end
  rebounds
end
