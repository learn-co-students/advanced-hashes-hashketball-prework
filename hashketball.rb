def game_hash
  {
    home:
    {
      team_name: "Brooklyn Nets",
      colors: ["Black","White"],
      players:
      {
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
    away:
    {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise","Purple"],
      players:
      {
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
  points_scored = 0
    game_hash[:home][:players].each do |player, player_stat|
      if player == name
        points_scored = player_stat[:points]
      end
    end
    game_hash[:away][:players].each do |player, player_stat|
      if player == name
        points_scored = player_stat[:points]
      end
    end
  return points_scored
end

def shoe_size(name)
  shoe_size = 0
  game_hash[:home][:players].each do |player, player_stat|
    if player == name
      shoe_size = player_stat[:shoe].to_i
    end
  end
  game_hash[:away][:players].each do |player, player_stat|
    if player == name
      shoe_size = player_stat[:shoe].to_i
    end
  end
  return shoe_size
end

def team_colors(name)
  colors = []
  game_hash.each do |location, team|
    if (team[:team_name] == name)
      colors = team[:colors]
    end
  end
  return colors
end

def team_names
  teams = [game_hash[:home][:team_name],game_hash[:away][:team_name]]
  return teams
end

def player_numbers(name)
  jerseys = []
  if (name == game_hash[:home][:team_name])
    game_hash[:home][:players].each do |player, player_stat|
      jerseys.push(player_stat[:number].to_i)
    end
  elsif(name == game_hash[:away][:team_name])
    game_hash[:away][:players].each do |player, player_stat|
      jerseys.push(player_stat[:number].to_i)
    end
  else
    puts "Wrong team name!"
  end
  return jerseys.sort
end

def player_stats(name)
  result = Hash.new
  game_hash[:home][:players].each do |player, player_stats|
    if name == player
      result = player_stats
    end
  end
  game_hash[:away][:players].each do |player, player_stats|
    if name == player
      result = player_stats
    end
  end
  return result
end

def big_shoe_rebounds
  shoe_size = 0
  rebounds = 0
  big_foot_player = ""
  team = "home"
  game_hash[:home][:players].each do |player, player_stats|
    if player_stats[:shoe] > shoe_size
      shoe_size = player_stats[:shoe]
      big_foot_player = player
    end
  end
  game_hash[:away][:players].each do |player, player_stats|
    if player_stats[:shoe] > shoe_size
      shoe_size = player_stats[:shoe]
      big_foot_player = player
      team = "away"
    end
  end

  if team == "home"
    game_hash[:home][:players].each do |player, player_stat|
      if player == big_foot_player
        rebounds = player_stat[:rebounds]
      end
    end
  else
    game_hash[:away][:players].each do |player, player_stat|
      if player == big_foot_player
        rebounds = player_stat[:rebounds]
      end
    end
  end
  return rebounds
end

def most_points_scored
  points_scored = 0
  high_player = ""
  game_hash[:home][:players].each do |player, player_stats|
    if player_stats[:points] > points_scored
      points_scored = player_stats[:points]
      high_player = player
    end
  end
  game_hash[:away][:players].each do |player, player_stats|
    if player_stats[:points] > points_scored
      points_scored = player_stats[:points]
      high_player = player
    end
  end
  return high_player
end

def winning_team
  won_team = ""
  home_pts = 0
  away_pts = 0
  game_hash[:home][:players].each do |player, player_stats|
    home_pts += player_stats[:points]
  end
  game_hash[:away][:players].each do |player, player_stats|
    away_pts += player_stats[:points]
  end
  if(home_pts > away_pts)
    won_team = game_hash[:home][:team_name]
  elsif(away_pts > home_pts)
    won_team = game_hash[:away][:team_name]
  else
    won_team = "Tie Game!"
  end
  return won_team
end

def player_with_longest_name
  long_name = ""
  game_hash[:home][:players].each do |player, player_stats|
    if player.length > long_name.length
      long_name = player
    end
  end
  game_hash[:away][:players].each do |player, player_stats|
    if player.length > long_name.length
      long_name = player
    end
  end
  return long_name
end

def long_name_steals_a_ton?
  steals = 0
  long_steals = ""
  long_name = player_with_longest_name

  game_hash[:home][:players].each do |player, player_stats|
    if player_stats[:steals] > steals
      steals = player_stats[:steals]
      long_steals = player
    end
  end
  game_hash[:away][:players].each do |player, player_stats|
    if player_stats[:steals] > steals
      steals = player_stats[:steals]
      long_steals = player
    end
  end

  return player_with_longest_name == long_steals ? true : false
end
