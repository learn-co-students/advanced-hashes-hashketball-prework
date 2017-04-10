# hashketball #game_hash returns a hash
# hashketball #game_hash returns the correct top-level keys
# hashketball #game_hash returns the correct team-level keys
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

# hashketball #num_points_scored knows the number of points scored by each player
def num_points_scored(player)
  game_hash.each do |home_or_away, team|
    if team[:players].include?(player)
      return team[:players][player][:points]
    end
  end
  return 0
end

# hashketball #shoe_size knows the shoe size of each player
def shoe_size(player)
  game_hash.each do |home_or_away, team|
    if team[:players].include?(player)
      return team[:players][player][:shoe]
    end
  end
  return 0
end

# hashketball #team_colors knows the Brooklyn Nets colors are Black and White
def team_colors(team_name)
  game_hash.each do |home_or_away, team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
  return 0
end

# hashketball #team_names returns the team names
def team_names()
  teams = []
  game_hash.each do |home_or_away, team|
    teams.push(team[:team_name])
  end
  teams
end

# hashketball #player_numbers returns the player jersey numbers
def player_numbers(team_name)
  numbers = []
  game_hash.each do |home_or_away, team|
    if team[:team_name] == team_name
      team[:players].each do |key, player|
        numbers.push(player[:number])
      end
    end
  end
  numbers
end

# hashketball #player_stats returns all stats for a given player
def player_stats(player_name)
  stats = nil
  game_hash.each do |home_or_away, team|
    team[:players].each do |key, player|
      if key == player_name
         stats = player
      end
    end
  end
  stats
end

# hashketball #big_shoe_rebounds returns the number of rebounds of the player with the biggest shoe size
def big_shoe_rebounds
  largest_shoe = nil
  rebounds = nil
  game_hash.each do |home_or_away, team|
    team[:players].each do |key, player|
      if largest_shoe == nil or player[:shoe] > largest_shoe
         largest_shoe = player[:shoe]
         rebounds = player[:rebounds]
      end
    end
  end
  rebounds
end

# bonus #most_points_scored returns Ben Gordon
def most_points_scored
  most_points = nil
  name = nil
  game_hash.each do |home_or_away, team|
    team[:players].each do |key, player|
      if most_points == nil or player[:points] > most_points
         most_points = player[:points]
         name = key
      end
    end
  end
  name
end

# bonus #winning_team returns the Brooklyn Nets
def winning_team
  home_points = 0
  away_points = 0
  game_hash[:home][:players].each do |key, player|
    home_points += player[:points]
  end
  game_hash[:away][:players].each do |key, player|
    away_points += player[:points]
  end
  if home_points > away_points
    game_hash[:home][:team_name]
  elsif home_points > away_points
    game_hash[:away][:team_name]
  else
    nil
  end
end

# bonus #player_with_longest_name returns Brendan Haywood
def player_with_longest_name
  name = nil
  game_hash.each do |home_or_away, team|
    team[:players].each do |key, player|
      if name == nil or name.size < key.size
         name = key
      end
    end
  end
  name
end

def most_steals
  steals = nil
  name = nil
  game_hash.each do |home_or_away, team|
    team[:players].each do |key, player|
      if steals == nil or player[:steals] > steals
         steals = player[:steals]
         name = key
      end
    end
  end
  name
end

# super bonus #long_name_steals_a_ton?
def long_name_steals_a_ton?
  most_steals == player_with_longest_name
end
