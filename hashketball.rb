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

def look_up_player_stats(player_in_question, stat, all_stats=false)
  game_hash.each do |team, team_keys|
    team_keys[:players].each do |player, stats|
      if player == player_in_question
        return stats if all_stats
        return stats[stat]
      end
    end
  end
  nil # returns nil if player not in game hash
end

def num_points_scored(player_in_question)
  look_up_player_stats(player_in_question, :points)
end

def shoe_size(player_in_question)
  look_up_player_stats(player_in_question, :shoe)
end

def team_colors(team_in_question)
  game_hash.each do |team, team_keys|
    if team_keys[:team_name] == team_in_question
      return team_keys[:colors]
    end
  end
  nil # returns nil if team not in game hash
end

def team_names
  game_hash.collect do |team, team_keys|
    team_keys[:team_name]
  end
end

def player_numbers(team_in_question)
  game_hash.each do |team, team_keys|
    if team_keys[:team_name] == team_in_question
      return team_keys[:players].collect do |player, stats|
        stats[:number]
      end
    end
  end
  nil # returns nil if team not in game hash
end

def player_stats(player_in_question)
  look_up_player_stats(player_in_question, nil, true)
end

def big_shoe_rebounds
  shoe_hash = {}
  game_hash.each do |team, team_keys|
    team_keys[:players].each do |player, stats|
      shoe_hash[player] = stats[:shoe]
    end
  end
  biggest_player = shoe_hash.max_by do |player, shoe_size|
    shoe_size
  end[0]
  look_up_player_stats(biggest_player, :rebounds)
end
