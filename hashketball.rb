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

def players
  home = game_hash[:home][:players]
  away = game_hash[:away][:players]
  home + away
end

def find_player(player_name)
  players.find do |player|
    player[:player_name] == player_name
  end
end

def num_points_scored(player_name)
  player = find_player(player_name)
  player[:points]
end

def shoe_size(player_name)
  player = find_player(player_name)
  player[:shoe]
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
  # team[:players][:number]
  # binding.pry
end

def player_stats(player_name)
  player = find_player(player_name)
  player[:player_name] = player_name
end

def player_biggest_shoe_size
  players.sort_by do |player|
    player[:shoe]
  end.last
end

def big_shoe_rebounds
  player = player_biggest_shoe_size

  player[:rebounds]
  # binding.pry
end

#bonus:
def most_points_scored
  all_players = players
  all_players.sort_by do |player|
    player[:points]
  end.last[:player_name]
end

# def team_points
#   game_hash.each do |home_away, team_data|
#       team_points = 0
#     team_data[:players].each do |player|
#       team_points += player[:points]
#     end
#   end
#   puts total_points
# end

def winning_team
  total_points = 0
  winner = ""
  game_hash.each do |home_away, team_data|
    team_points = 0
    team_name = game_hash[home_away][:team_name]
    # puts home_away
    team_data[:players].each do |player|
      points = player[:points]
      team_points += points
    end
    if team_points > total_points
      winner, total_points = team_name, team_points
    end
    # puts home = game_hash[:home][:players][:points]
    # away = game_hash[:away][:players][:points]
  end
  winner
end

def player_with_longest_name
  longest = ""
  longest_length = 0
  game_hash.each do |home_away, team_data|
    team_data[:players].each do |player|
      name_length = player[:player_name].length

      if name_length > longest_length
        longest, longest_length = player[:player_name], name_length
      end
    end
  end
  return longest
  binding.pry
end
#super bonus:
def long_name_steals_a_ton?
  #
  # game_hash.each do |home_away, team_data|
  #   team_data[:players].each do |player|
  #     puts player[:steals]
  #   end
  # end
end
