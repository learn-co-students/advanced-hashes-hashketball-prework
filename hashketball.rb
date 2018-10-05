require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        }, {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        }, {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        }, {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        }, {
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
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        }, {
          player_name: "Bismak Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        }, {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        }, {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        }, {
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

def home_team_name
  game_hash[:home][:team_name]
end

def get_all_players
  team_players_array = game_hash.values.map do |team_data|
    team_data[:players]
  end

  team_players_array.flatten
end

def get_data_from_player(player_name, data)
  all_players = get_all_players

  all_players.reduce(nil) do |result, player_data|
    if(player_data[:player_name] == player_name)
      result = player_data[data]
    end

    result
  end
end

def num_points_scored(player_name)
  get_data_from_player(player_name, :points)
end

def shoe_size(player_name)
  get_data_from_player(player_name, :shoe)
end

def get_team(team_name)
  game_hash.values.find do |team_data|
    team_data[:team_name] == team_name
  end
end

def team_colors(team_name)
  team = get_team(team_name)
  team[:colors]
end

def team_names
  game_hash.map do |location, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team_name)
  team = get_team(team_name)
  team[:players].map do |player_data|
    player_data[:number]
  end
end

def player_stats(player_name)
  players = get_all_players
  players.find do |player_data|
    player_data[:player_name] == player_name
  end
end

def big_shoe_rebounds
  players = get_all_players

  biggest_shoe = players.reduce do |result, player_data|
    if(!result)
      result = player_data
    end

    result
  end

  biggest_shoe[:rebounds]
end

puts team_names

def most_points_scored
  player_scores = {}
  get_all_players.each { |player|
    player_scores[player[:player_name]] = player[:points]
  }
  players_sorted = player_scores.sort_by { |player_name, points| points }
  player_with_most_points = players_sorted[-1]
  puts "#{player_with_most_points[0]} is the player with most points at #{player_with_most_points[1]} points!"
end

most_points_scored

def winning_team
  team_scores = {}
  home_team_points = []
  away_team_points = []

  game_hash[:home][:players].each { |player|
    player.map { |stat, value|
      if stat == :points
        home_team_points << value
      end
    }
  }
  team_scores[:home] = home_team_points.inject(0, :+)

  charlotte_points = []
  game_hash[:away][:players].each { |player|
    player.map { |stat, value|
      if stat == :points
        away_team_points << value
      end
    }
  }
  team_scores[:away] = away_team_points.inject(0, :+)

  teams_sorted = team_scores.sort_by { |team, score| score }
  winning_team = teams_sorted.last[0] == :home ? "Brooklyn Nets" : "Charlotte Hornets"
  winning_score = teams_sorted.last[1]
  puts "The winning team is the #{winning_team} with a score of #{winning_score}!"
end

winning_team

def player_with_the_longest_name
  length_of_names = {}
  get_all_players.each { |player|
    length_of_names[player[:player_name]] = player[:player_name].size
  }
  names_sorted = length_of_names.sort_by { |name, length| length }
  @the_longest_name = names_sorted.last[0]
  length_of_the_longest_name = names_sorted.last[1]
  puts "The player with the longest name is #{@the_longest_name} with #{length_of_the_longest_name} characters in it!"
end

player_with_the_longest_name

def long_name_steals_a_ton?
  steals_per_player = {}
  get_all_players.each { |player|
    steals_per_player[player[:player_name]] = player[:steals]
  }
  steals_sorted = steals_per_player.sort_by { |name, steals| steals }
  player_with_most_steals = steals_sorted.last[0]
  number_of_steals = steals_sorted.last[1]

  if @the_longest_name == player_with_most_steals
    puts "Random fact! He also has the most steals!"
  else
    return false
  end
end

long_name_steals_a_ton?
