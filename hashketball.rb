require 'pry'

def game_hash
    {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
          :player_name => 'Alan Anderson',
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        }, {
          :player_name => 'Reggie Evans',
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        }, {
          :player_name => 'Brook Lopez',
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        }, {
          :player_name => 'Mason Plumlee',
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        }, {
          :player_name => 'Jason Terry',
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      ]
    },

    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
         {
          :player_name => 'Jeff Adrien',
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        }, {
          :player_name => 'Bismak Biyombo',
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        }, {
          :player_name => 'DeSagna Diop',
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        }, {
          :player_name => 'Ben Gordon',
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        }, {
          :player_name => 'Brendan Haywood',
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
      }
    ]
  }
}
end


def all_players
  home_team = game_hash[:home][:players]
  away_team = game_hash[:away][:players]

  both_teams = home_team + away_team

  both_teams
  # binding.pry
end


def num_points_scored(name)
  find_player = all_players.find {|player| player.fetch(:player_name) == name}
  find_player.fetch(:points)
end


# || Done with Matt ||

# def player_by_number(num)
#   find_player = all_players.find {|player| player.fetch(:number) == num}
#   find_player.fetch(:player_name)
# end


# iterate through all players[:number] to find if that matches "num", then return
# the name associated with that


def shoe_size(name)
  find_player = all_players.find {|player| player.fetch(:player_name) == name}
  find_player.fetch(:shoe)
end


def team_colors(team_name)
  if team_name == "Brooklyn Nets"
    team_colors = game_hash[:home][:colors]
  elsif team_name == "Charlotte Hornets"
    team_colors = game_hash[:away][:colors]
  else
    "Team doesn't exist"
  end
end


def team_names
  teams = [game_hash[:home][:team_name], game_hash[:away][:team_name]]
  teams
end


def player_numbers(team_name)
  team_numbers = []

  game_hash.each do |team, team_details|
    if team_details[:team_name] == team_name
      team_details[:players].each do |player|
        player.each do |key, value|
          if key == :number
            team_numbers << value
          end
        end
      end
    end
  end
  team_numbers
end


def player_stats(name)
  player_stats = find_player = all_players.find {|player| player.fetch(:player_name) == name}
  # binding.pry
  player_stats.delete(:player_name)

  return player_stats
end


def big_shoe_rebounds
  biggest_shoes_player = 0
  num_of_rebounds = 0
    game_hash.each do | team, team_stats|
      team_stats[:players].each do | stats |
        if stats[:shoe] > biggest_shoes_player
          # binding.pry
          biggest_shoes_player = stats[:shoe] # if conditional true, replaces big_shoes_guy, else it stays the same
          num_of_rebounds = stats[:rebounds]
          # binding.pry
        end
      end
    end
  num_of_rebounds
end


# Bonus Questions:
#
# Define methods to return the answer to the following questions:
#
# Which player has the most points? Call the method most_points_scored.
#
# Which team has the most points? Call the method winning_team.
#
# Which player has the longest name? Call the method player_with_longest_name.
#
# Super Bonus:
#
# Write a method that returns true if the player with the longest name had the
# most steals. Call the method long_name_steals_a_ton?.




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
