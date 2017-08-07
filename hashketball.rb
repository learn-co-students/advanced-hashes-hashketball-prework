require "pry"

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
          slam_dunks: 1,
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7,
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15,
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5,
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1,
        },
      },
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
          slam_dunks: 2,
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10,
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5,
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0,
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12,
        },
      },
    },
  }
end

# helper functions
def get_players
  game_hash.values.map do |team_data|
    team_data[:players].map do |player_name, player_stats|
      player_stats[:name] = player_name
      player_stats
    end
  end.flatten
end

def find_player(players, player_name)
  players.find { |player| player[:name] == player_name}
end

def get_teams
  game_hash.values
end

# problem questions
def find_team(teams, team_name)
  teams.find { |team| team[:team_name] == team_name }
end

def num_points_scored(player_name)
  find_player(get_players, player_name)[:points]
end

def shoe_size(player_name)
  find_player(get_players, player_name)[:shoe]
end

def team_colors(team_name)
  find_team(get_teams, team_name)[:colors]
end

def team_names
  get_teams.map { |team| team[:team_name] }
end

def player_numbers(team_name)
  find_team(get_teams, team_name)[:players].map do |player_name, player_stats|
    player_stats[:number]
  end
end

def player_stats(player_name)
  stats = find_player(get_players, player_name)
  stats.delete(:name)
  stats
end

def big_shoe_rebounds
  # player_with_biggest_shoe = nil
  biggest_shoe = nil
  biggest_shoe_rebounds = nil

  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if biggest_shoe == nil
        # player_with_biggest_shoe = player_name
        biggest_shoe = player_stats[:shoe]
        biggest_shoe_rebounds = player_stats[:rebounds]
      elsif biggest_shoe < player_stats[:shoe]
        # player_with_biggest_shoe = player_name
        biggest_shoe = player_stats[:shoe]
        biggest_shoe_rebounds = player_stats[:rebounds]
      end
    end
  end

  biggest_shoe_rebounds
end

def most_points_scored
  player_with_most_points = nil
  most_points = nil

  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if player_with_most_points == nil
        player_with_most_points = player_name
        most_points = player_stats[:points]
      elsif most_points < player_stats[:points]
        player_with_most_points = player_name
        most_points = player_stats[:points]
      end
    end
  end

  player_with_most_points
end

def winning_team
  away_minus_home_pts = 0

  game_hash[:away][:players].each do |player_name, player_stats|
    away_minus_home_pts += player_stats[:points]
  end
  game_hash[:home][:players].each do |player_name, player_stats|
    away_minus_home_pts -= player_stats[:points]
  end

  if away_minus_home_pts > 0
    game_hash[:away][:team_name]
  else
    game_hash[:home][:team_name]
  end
end

def player_with_longest_name
  longest_name = nil

  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if longest_name == nil
        longest_name = player_name
      elsif longest_name.length < player_name.length
        longest_name = player_name
      end
    end
  end

  longest_name
end

def long_name_steals_a_ton?
  player_with_most_steals = nil
  most_steals = nil

  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if player_with_most_steals == nil
        player_with_most_steals = player_name
        most_steals = player_stats[:steals]
      elsif most_steals < player_stats[:steals]
        player_with_most_steals = player_name
        most_steals = player_stats[:steals]
      end
    end
  end

  player_with_most_steals == player_with_longest_name
end

# binding.pry
# ""
