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

def num_points_scored(player_name)
  game_hash.each do |team, info|
    info[:players].each do |attribute_hash|
      if attribute_hash[:player_name] == player_name
        return attribute_hash[:points]
        #binding.pry
      end
     end
  end
end

def shoe_size(player_name)
  game_hash.each do |team, info|
    info[:players].each do |attribute_hash|
      if attribute_hash[:player_name] == player_name
        return attribute_hash[:shoe]
        #binding.pry
      end
     end
  end
end

def team_colors(team_name)
  game_hash.each do |team, info|
    if info[:team_name] == team_name
      return info[:colors]
    end
  end
end

def team_names
  teams = []
  game_hash.each do |team, info|
    teams << info[:team_name]
  end
  teams
end

def player_numbers(team_name)
  num = []
  game_hash.each do |team, info|
    if info[:team_name] == team_name
      info[:players].each do |attribute_hash|
        num << attribute_hash[:number]
      end
    end
  end
  num
end

def player_stats(player_name)
  game_hash.each do |team, info|
    info[:players].each do |attribute_hash|
      if attribute_hash[:player_name] == player_name
        attribute_hash.delete(:player_name)
        return attribute_hash
      end
    end
  end
end

def big_shoe_rebounds
  game_hash.each do |team, info| # Top layer hash
    info[:players].each do |attribute_hash| # Array with each player info
      binding.pry
    end
  end
end
