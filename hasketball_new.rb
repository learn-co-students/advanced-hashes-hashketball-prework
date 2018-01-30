
def game_hash
  hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [{
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
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
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

  away: {
     team_name: "Charlotte Hornets",
     colors: ["Turquoise", "Purple"],
     players: [{
         player_name: "Jeff Adrien",
         number: 4,
         shoe: 18,
         points: 10,
         rebounds: 1,
         assists: 1,
         steals: 2,
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

def get_players
  game_hash.values.map do |data|
    data[:players]
  end.flatten
end

def find_player(all_players, name)
  all_players.find do |player|
    player[:player_name] == name
  end
end

def num_points_scored(name)
  players = get_players
end

def shoe_size(name)
  players = get_players
  find_player(players, name)[:shoe]
end

def team_colors(team)
  game_hash.values.find do |data|
    if data[:team_name] == team
      return data[:colors]
    end
  end
end

def team_names
  game_hash.values.map do |data|
    data[:team_name]
  end.flatten
end

def player_numbers(team)
  one_team = game_hash.values.find do |data|
    data[:team_name] == team
  end

  one_team[:players].map do |player|
    player[:number]
  end.flatten
end

def player_stats(name)
  players = get_players
  found_player = find_player(players, name)
  found_player.select do |k, v|
    k != :player_name
  end
end

def big_shoe_player
  big_shoe = 0
  player = nil
  players = get_players

  players.each do |name|
    if name[:shoe] > big_shoe
      big_shoe = name[:shoe]
      player = name
    end
  end
  big_shoe_player
end

def big_shoe_rebounds
  big_shoe_player[:rebounds]
end

def most_points_scored
  most_points = 0
  player_name = ""

  game_hash.each do |team, data|
    data[:players].each do |player, stats|
      if stats[:points] > most_points
        most_points = stats[:points]
        player_name = player
      end
    end
  end
  player_name
end
