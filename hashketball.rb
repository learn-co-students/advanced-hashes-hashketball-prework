# Write your code here!

def game_hash
  game_hash = {
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

def num_points_scored(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      if name == player_name
        return player_data[:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      if name == player_name
        return player_data[:shoe]
      end
    end
  end
end

def team_colors(name)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == name
      return team_data[:colors]
    end
  end
end

def team_names
  result = []
  game_hash.each do |location, team_data|
    result << team_data[:team_name]
  end
  result
end

def player_numbers(name)
  result = []
  game_hash.each do |location, team_data|
    if name == team_data[:team_name]
      team_data[:players].each do |player_name, player_data|
        result << player_data[:number]
      end
    end
  end
  result
end

def player_stats(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      if name == player_name
        return player_data
      end
    end
  end
end

def big_shoe_rebounds
  largest_shoe = nil
  rebounds_result = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      shoe_size = player_data[:shoe]
      rebounds = player_data[:rebounds]
      if largest_shoe == nil || shoe_size > largest_shoe
        largest_shoe = shoe_size
        rebounds_result = rebounds
      end
    end
  end
  rebounds_result
end

def most_points_scored
  most_points = nil
  name = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      points = player_data[:points]
      if most_points == nil || points > most_points
        most_points = points
        name = player_name
      end
    end
  end
  name
end


def winning_team
  highest_score = nil
  winner = nil
  game_hash.each do |location, team_data|
    score = 0
    team_data[:players].each do |player_name, player_data|
      score += player_data[:points]
    end
    if highest_score == nil || score > highest_score
      highest_score = score
      winner = team_data[:team_name]
    end
  end
  winner
end

def player_with_longest_name
  name = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      if name == nil || player_name.length > name.length
        name = player_name
      end
    end
  end
  name
end

def long_name_steals_a_ton?
  most_steals = nil
  name = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      steals = player_data[:steals]
      if most_steals == nil || steals > most_steals
        most_steals = steals
        name = player_name
      end
    end
  end
  name == player_with_longest_name
end
