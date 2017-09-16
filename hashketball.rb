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

def num_points_scored(player)
  game_hash.each do |home_away, team_data|
    team_data[:players].each do |name, stats_hash|
      return stats_hash[:points] if player == name
    end
  end
end

def shoe_size(player)
  game_hash.each do |home_away, team_data|
    return team_data[:players][player][:shoe] if team_data[:players].keys.include?(player)
  end
end

def team_colors(team_name)
  game_hash.each do |home_away, team_data|
    return team_data[:colors] if team_data[:team_name] == team_name
  end
end

def team_names
  game_hash.map do |home_away, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |home_away, team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each {|name, stats_hash| numbers << stats_hash[:number]}
    end
  end
  numbers
end

def player_stats(name)
  game_hash.each do |home_away, team_data|
    return team_data[:players][name] if team_data[:players].keys.include?(name)
  end
end

def big_shoe_rebounds
  biggest_shoe = ""
  biggest = 0
  #find player with biggest shoe
  game_hash.each do |home_away, team_data|
    team_data[:players].each do |name, stats_hash|
      if stats_hash[:shoe] > biggest
        biggest = stats_hash[:shoe]
        biggest_shoe = name
      end
    end
  end
  #return number of rebounds
  game_hash.each do |home_away, team_data|
    return team_data[:players][biggest_shoe][:rebounds] if team_data[:players].keys.include?(biggest_shoe)
  end
end

def most_points_scored
  most_points = 0
  most_points_name = ""
  game_hash.each do |home_away, team_data|
    team_data[:players].each do |name, stats_hash|
      if stats_hash[:points] > most_points
        most_points = stats_hash[:points]
        most_points_name = name
      end
    end
  end
  most_points_name
end

def winning_team
    home_total = 0
    game_hash[:home][:players].each do |name, stats_hash|
      home_total += stats_hash[:points]
    end
    away_total = 0
    game_hash[:away][:players].each do |name, stats_hash|
      away_total += stats_hash[:points]
    end
    home_total > away_total ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end

def player_with_longest_name
  all_players = game_hash[:home][:players].keys + game_hash[:away][:players].keys
  all_players.sort_by {|name| name.length }.last
end

def long_name_steals_a_ton?
  steals_name = ""
  num_steals = 0
  game_hash.each do |home_away, team_stats|
    team_stats[:players].each do |name, stats_hash|
      if stats_hash[:steals] > num_steals
        num_steals = stats_hash[:steals]
        steals_name = name
      end
    end
  end
  player_with_longest_name == steals_name
end
