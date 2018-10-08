# Write your code here!
def game_hash
  {
    home:{
      team_name:"Brooklyn Nets",
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
    away:{
      team_name:"Charlotte Hornets",
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

def num_points_scored(player_name)
  hash = game_hash
  score = 0
  hash.each do |team, statistics|
    hash[team][:players].each do |player, stats|
      if player == player_name
        score = hash[team][:players][player][:points]
      end
    end
  end
  score
end

def shoe_size(player_name)
  hash = game_hash
  size = 0
  hash.each do |team, statistics|
    hash[team][:players].each do |player, stats|
      if player == player_name
        size = hash[team][:players][player][:shoe]
      end
    end
  end
  size
end

def team_colors(team_name)
  hash = game_hash
  hash.each do |team, statistics|
    hash[team].each do |stats, values|
      if hash[team][stats] == team_name
        return hash[team][:colors] 
      end
    end
  end
end

def team_names
  team_names = []
  hash = game_hash
  hash.each do |team, statistics|
    team_names << hash[team][:team_name]
  end
  team_names
end

def player_numbers(team_name)
  jersey_numbers = []
  hash = game_hash
  hash.each do |team, statistics|
    hash[team].each do |stats, values|
      if hash[team][stats] == team_name
        hash[team][:players].each do |player, stat| 
        jersey_numbers << hash[team][:players][player][:number]
        end
      end
    end
  end
  jersey_numbers
end

def player_stats(player_name)
  player_stats = nil
  hash = game_hash
  hash.each do |team, statistics|
    hash[team][:players].each do |player, stats|
      if player == player_name
        player_stats = hash[team][:players][player]
      end
    end
  end
  player_stats
end

def big_shoe_rebounds
  shoe_size = 0
  rebounds = 0
  hash = game_hash
  hash.each do |team, statistics|
    hash[team][:players].each do |player, stats|
      if hash[team][:players][player][:shoe] > shoe_size
        shoe_size = hash[team][:players][player][:shoe]
        rebounds = hash[team][:players][player][:rebounds]
      end
    end
  end
  rebounds
end




