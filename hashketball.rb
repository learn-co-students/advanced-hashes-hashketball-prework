require "pry"
# Write your code here!

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

#
# def good_practices
#   game_hash.each do |location, team_data|
#     #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#     binding.pry
#       team_data.each do |attribute, data|
#         #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#         binding.pry
#
#         #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
#         data.each do |data_item|
#             binding.pry
#       end
#     end
#   end
# end
#
# good_practices


def player_stats(player_name)
  player_stats = nil

  game_hash.each do |team, team_properties|
    if team_properties[:players].include?(player_name)
      player_stats = team_properties[:players][player_name]
    end
  end

  player_stats
  # binding.pry
end

def get_team_info(team_name)
  team_info = nil

  game_hash.each do |team, team_properties|

    if team_properties[:team_name] == team_name
      team_info = team_properties
    end
  end

  team_info
end

# puts get_team_info("Brooklyn Nets")

def num_points_scored(player_name)
  # points_scored = nil
  #
  # game_hash.each do |team, team_properties|
  #   if team_properties[:players].include?(player_name)
  #     points_scored = team_properties[:players][player_name][:points]
  #      # binding.pry
  #   end
  # end
  #
  # points_scored
  player_stats(player_name)[:points]
end

def shoe_size(player_name)
  player_stats(player_name)[:shoe]
end

def team_colors(team_name)
  get_team_info(team_name)[:colors]
end

def team_names
  team_names = []

  game_hash.each do |team, team_properties|
    team_names << team_properties[:team_name]
  end

  team_names
end

def player_numbers(team_name)
  player_numbers = []

  get_team_info(team_name)[:players].each do |k, v|
     player_numbers << v[:number]
     # binding.pry
  end

  player_numbers
end

def every_player_in_the_game
  players = {}

  game_hash.each do |team, team_properties|
    players = team_properties[:players].merge(players)
  end

  players
end

def sorted_get_all_players_by_stat(stat)
  players_and_stats = {}

  every_player_in_the_game.each do |name, stats|
    players_and_stats[name] = stats[stat.to_sym]
  end

  output = players_and_stats.sort_by do |player, stat|
    stat
  end

  output
end

def player_with_largest_shoe
  sorted_get_all_players_by_stat("shoe").last[0]
end


def big_shoe_rebounds
  player_stats(player_with_largest_shoe)[:rebounds]
end

def most_points_scored
  sorted_get_all_players_by_stat("points").last[0]
end

def get_players_per_team(team_name)
  get_team_info(team_name)[:players]
end

def get_points_per_team(team_name)
  points = 0
  get_players_per_team(team_name).each do |k,v|
    points += v[:points]
  end

  points
end

def scoreboard
  scoreboard = {}
  game_hash.each do |team, team_properties|
    scoreboard[team_properties[:team_name]] = get_points_per_team(team_properties[:team_name])
  end

  scoreboard
end


def winning_team
  winning_team = scoreboard.max_by { |team, score| score }
  winning_team[0]
end


def player_with_longest_name
  player_names = []

  every_player_in_the_game.each do |name, stats|
    player_names << name
  end

  player_names.max { |name1, name2| name1.length <=> name2.length }
end

def player_with_the_most_steals
  sorted_get_all_players_by_stat("steals").last[0]
end

def long_name_steals_a_ton?
  player_stats(player_with_the_most_steals)[:steals] == player_stats(player_with_longest_name)[:steals]
end

long_name_steals_a_ton?
