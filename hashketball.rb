def game_hash
  game_hash = {home:
    {team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {"Alan Anderson" => {number: 0,
                                    shoe: 16,
                                    points: 22,
                                    rebounds: 12,
                                    assists: 12,
                                    steals: 3,
                                    blocks: 1,
                                    slam_dunks: 1},
                  "Reggie Evans" => {number: 30,
                                      shoe: 14,
                                      points: 12,
                                      rebounds: 12,
                                      assists: 12,
                                      steals: 12,
                                      blocks: 12,
                                      slam_dunks: 7},
                  "Brook Lopez" => {number: 11,
                                      shoe: 17,
                                      points: 17,
                                      rebounds: 19,
                                      assists: 10,
                                      steals: 3,
                                      blocks: 1,
                                      slam_dunks: 15},
                  "Mason Plumlee" => {number: 1,
                                      shoe: 19,
                                      points: 26,
                                      rebounds: 12,
                                      assists: 6,
                                      steals: 3,
                                      blocks: 8,
                                      slam_dunks: 5},
                    "Jason Terry" => {number: 31,
                                      shoe: 15,
                                      points: 19,
                                      rebounds: 2,
                                      assists: 2,
                                      steals: 4,
                                      blocks: 11,
                                      slam_dunks: 1}
        }},
  away:
    {team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {"Jeff Adrien" => {number: 4,
                                    shoe: 18,
                                    points: 10,
                                    rebounds: 1,
                                    assists: 1,
                                    steals: 2,
                                    blocks: 7,
                                    slam_dunks: 2},
              "Bismak Biyombo" => {number: 0,
                                      shoe: 16,
                                      points: 12,
                                      rebounds: 4,
                                      assists: 7,
                                      steals: 7,
                                      blocks: 15,
                                      slam_dunks: 10},
                "DeSagna Diop" => {number: 2,
                                      shoe: 14,
                                      points: 24,
                                      rebounds: 12,
                                      assists: 12,
                                      steals: 4,
                                      blocks: 5,
                                      slam_dunks: 5},
                  "Ben Gordon" => {number: 8,
                                      shoe: 15,
                                      points: 33,
                                      rebounds: 3,
                                      assists: 2,
                                      steals: 1,
                                      blocks: 1,
                                      slam_dunks: 0},
              "Brendan Haywood" => {number: 33,
                                      shoe: 15,
                                      points: 6,
                                      rebounds: 12,
                                      assists: 12,
                                      steals: 22,
                                      blocks: 5,
                                      slam_dunks: 12}
        }}
  }
end

def num_points_scored(name)
  if game_hash[:home][:players].keys.include?(name)
    game_hash[:home][:players][name][:points]
  elsif game_hash[:away][:players].keys.include?(name)
      game_hash[:away][:players][name][:points]
  end
end

def shoe_size(name)
  if game_hash[:home][:players].keys.include?(name)
    game_hash[:home][:players][name][:shoe]
  elsif game_hash[:away][:players].keys.include?(name)
    game_hash[:away][:players][name][:shoe]
  end
end

def team_colors(team_name)
  if team_name == game_hash[:home][:team_name]
    game_hash[:home][:colors]
  elsif team_name == game_hash[:away][:team_name]
    game_hash[:away][:colors]
  end
end

def team_names
  teamsArray = []
  teamsArray.push(game_hash[:home][:team_name])
  teamsArray.push(game_hash[:away][:team_name])
end

def player_numbers(team_name)
  jerseyArray = []
  homePlayers = game_hash[:home][:players].keys
  awayPlayers = game_hash[:away][:players].keys
  if team_name == game_hash[:home][:team_name]
    i = 0
    until i == homePlayers.length
      jerseyArray.push(game_hash[:home][:players][homePlayers[i]][:number])
      i += 1
    end
  elsif team_name == game_hash[:away][:team_name]
    i = 0
    until i == awayPlayers.length
      jerseyArray.push(game_hash[:away][:players][awayPlayers[i]][:number])
      i += 1
    end
  end
  jerseyArray
end

def player_stats(name)
  if game_hash[:home][:players].keys.include?(name)
    game_hash[:home][:players][name]
  elsif game_hash[:away][:players].keys.include?(name)
      game_hash[:away][:players][name]
  end
end

def big_shoe_rebounds
  thePlayer = ""
  oldShoeSize = 0
  newShoeSize = 0
  homePlayers = game_hash[:home][:players].keys
  awayPlayers = game_hash[:away][:players].keys
  i = 0
  until i == homePlayers.length
    newShoeSize = game_hash[:home][:players][homePlayers[i]][:shoe]
    if newShoeSize > oldShoeSize
      oldShoeSize = newShoeSize
      thePlayer = homePlayers[i]
    end
    i += 1
  end
  until i == awayPlayers.length
    if game_hash[:away][:players][awayPlayers[i]][:shoe] > newShoeSize
      newShoeSize = game_hash[:away][:players][awayPlayers[i]][:shoe]
      thePlayer = awayPlayers[i]
    end
    i += 1
  end
  if game_hash[:home][:players].keys.include?(thePlayer)
    game_hash[:home][:players][thePlayer][:rebounds]
  elsif game_hash[:away][:players].keys.include?(thePlayer)
      game_hash[:away][:players][thePlayer][:rebounds]
  end
end
