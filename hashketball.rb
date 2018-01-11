def game_hash
  hash = {
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
         points: 6,
         shoe: 15,
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

def num_points_scored(name)
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]

  home_players.each do |player, stats|
    if player == name
      return home_players["#{name}"][:points]
    end
  end

  away_players.each do |player, stats|
    if player == name
      return away_players["#{name}"][:points]
    end
  end
end

def shoe_size(name)
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]

  home_players.each do |player, stats|
    if player == name
      return home_players["#{name}"][:shoe]
    end
  end

  away_players.each do |player, stats|
    if player == name
      return away_players["#{name}"][:shoe]
    end
  end
end

def team_colors(team)
  if game_hash[:home][:team_name] == team
    return game_hash[:home][:colors]
  elsif game_hash[:away][:team_name] == team
    return game_hash[:away][:colors]
  end
end

def team_names
  teams = []

  teams << game_hash[:home][:team_name]
  teams << game_hash[:away][:team_name]

  teams
end

def player_numbers(team)
  numbers = []

  if game_hash[:home][:team_name] == team
    game_hash[:home][:players].each do |player, stats|
      numbers << stats[:number]
    end
  end

  if game_hash[:away][:team_name] == team
    game_hash[:away][:players].each do |player, stats|
      numbers << stats[:number]
    end
  end
  numbers
end

def player_stats(name)
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]

  home_players.each do |player, stats|
    if player == name
      return home_players["#{name}"]
    end
  end

  away_players.each do |player, stats|
    if player == name
      return away_players["#{name}"]
    end
  end
end

def big_shoe_rebounds
  shoe_sizes = []
  largest_shoe = 0
  largest_shoe_player = nil

  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]

  home_players.each do |player, stats|
    shoe_sizes << stats[:shoe]
  end
  away_players.each do |players, stats|
    shoe_sizes << stats[:shoe]
  end

  largest_shoe = shoe_sizes.sort.reverse[0]

  home_players.each do |player, stats|
    if stats[:shoe] == largest_shoe
      return stats[:rebounds]
    end
  end
  away_players.each do |player, stats|
    if stats[:shoe] == largest_shoe
      return stats[:rebounds]
    end
  end
end
