

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
        }, "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        }, "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        }, "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        }, "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
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
        }
      }
    }
  }
end

#-- DATA --#

def player_stats(player_name)
  game_hash[:home][:players].has_key?(player_name) ? game_hash[:home][:players][player_name] :  game_hash[:away][:players][player_name]
end

def jersey_data(team)
  jersey_numbers = []
  game_hash[team][:players].each{|player_name, player_stat| jersey_numbers << player_stat[:number]}

  jersey_numbers
end

def points_data(team)
  points = []
  game_hash[team][:players].each{|player_name, player_stat| points << player_stat[:points]}

  points
end

#-- METHODS --#

def num_points_scored(player_name)
  player_stats(player_name)[:points]
end


def shoe_size(player_name)
  player_stats(player_name)[:shoe]

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
  home = game_hash[:home][:players].values.sort{|playerA, playerB| playerA[:shoe] <=> playerB[:shoe]}.reverse[0]
  away = game_hash[:away][:players].values.sort{|playerA, playerB| playerA[:shoe] <=>  playerB[:shoe]}.reverse[0]

  home[:shoe] > away[:shoe] ? home[:rebounds] : away[:rebounds] 
end

def most_points_scored
  home = game_hash[:home][:players].values.sort{|playerA, playerB| playerA[:points] <=> playerB[:points]}.reverse[0]
  away = game_hash[:away][:players].values.sort{|playerA, playerB| playerA[:points] <=>  playerB[:points]}.reverse[0]
 
  home_player =  game_hash[:home][:players].select{|player_name, player_stat| player_stat[:points] === home[:points]}
  away_player =  game_hash[:away][:players].select{|player_name, player_stat| player_stat[:points] === away[:points]}

  home[:points] > away[:points] ? home_player.select{|player_name, player_stat| return player_name} : away_player.select{|player_name, player_stat| return player_name}
end

def winning_team
  home_points = points_data(:home).inject(:+)
  away_points = points_data(:away).inject(:+)
  home_points > away_points ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end