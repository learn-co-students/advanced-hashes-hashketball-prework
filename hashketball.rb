

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

#-- DATA --#
def team_players(team)
  game_hash[team][:players].collect{|player| player[:player_name]}
end

def player_data(team, player_name)
   game_hash[team][:players].select{|player| player if player[:player_name] == player_name}[0]
end

def jersey_data(team)
  game_hash[team][:players].collect{|player_data| player_data[:number]}
end

#-- METHODS --#

def num_points_scored(player_name)
  
  if team_players(:home).include?(player_name)
    player_stat = player_data(:home, player_name)
  else 
    player_stat= player_data(:away, player_name)
  end

  player_stat[:points]
end

def shoe_size(player_name)
  if team_players(:home).include?(player_name)
    player_stat = player_data(:home, player_name)
  else 
    player_stat= player_data(:away, player_name)
  end

  player_stat[:shoe]
end

def team_colors(team)
  game_hash[:home][:team_name] === team ? game_hash[:home][:colors] : game_hash[:away][:colors] 
end

def team_names
 [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(team_name)
  game_hash[:home][:team_name] == team_name ? jersey_data(:home) :jersey_data(:away)
end

def big_shoe_rebounds
  home = game_hash[:home][:players].sort{|playerA, playerB| playerA[:shoe] <=> playerB[:shoe]}[0]
  away = game_hash[:away][:players].sort{|playerA, playerB| playerA[:shoe] <=>  playerB[:shoe]}[0]
  
  if home[:shoe] >= away[:shoe] then home[:rebounds] end
end