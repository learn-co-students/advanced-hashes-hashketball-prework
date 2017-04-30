require 'pry'

def game_hash
  game = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players:
      [
        {
          name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1,
        }, {
          name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7,
        }, {
          name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15,
        }, {
          name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5,
        }, {
          name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1,
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players:
      [
        {
          name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2,
        }, {
          name: "Bismak Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10,
        }, {
          name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5,
        }, {
          name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0,
        }, {
          name: "Brendan Haywood",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12,
        }
       ]
     }
  }
end

def players
  home = game_hash.fetch(:home).fetch(:players)
  away = game_hash.fetch(:away).fetch(:players)
  home + away
end

def find_player(name)
  players.find {|player| player.fetch(:name) == name}
end

def find_team(team_name)
  game_hash.values.find {|team| team.fetch(:team_name) == team_name}
end

def num_points_scored(name)
  player = find_player(name)
  player.fetch(:points)
end

def shoe_size(name)
  player = find_player(name)
  player.fetch(:shoe)
end

def team_colors(team)
  team = find_team(team)
  team.fetch(:colors)
end

def team_names
  home = game_hash.fetch(:home).fetch(:team_name)
  away = game_hash.fetch(:away).fetch(:team_name)
  result = []
  result << home
  result << away
end

def player_numbers(name)
  find_team(name)[:players].map {|player| player[:number]}
end

def player_stats(name)
  find_player(name).reject {|key, value| key == :name}
end

def big_shoe
  players.sort_by {|player| player.fetch(:shoe)}.last
end

def big_shoe_rebounds
  name = big_shoe
  name.fetch(:rebounds)
end
