# Write your code here!
require 'pry'
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
    game_dict = game_hash
    player_dict = game_dict[:home][:players][player] || game_dict[:away][:players][player]
    # binding.pry
    return !player_dict.nil? ? player_dict[:points] : nil
end

def shoe_size(player)
    game_dict = game_hash
    player_dict = game_dict[:home][:players][player] || game_dict[:away][:players][player]
    if !player_dict.nil?
        return player_dict[:shoe]
    end
    player_dict
end

def team_colors(team)
    game_dict = game_hash
    game_dict.each do |key, value|
        if value[:team_name] == team
            return value[:colors]
        end
    end
    nil
end

def team_names
    game_dict = game_hash
    game_dict.collect do |key, value|
        value[:team_name]
    end
end

def player_numbers(team)
    game_dict = game_hash
    game_dict.each do |key, value|
        if value[:team_name] == team
            return value[:players].collect do |key, value|
                value[:number]
            end
        end
    end
end

def player_stats(player)
    game_dict = game_hash
    player_dict = game_dict[:home][:players][player] || game_dict[:away][:players][player]
end

def big_shoe_rebounds
    game_dict = game_hash
    big_shoes_guy = 0
    rebounds = 0
    game_dict.each do |team, team_details|
      team_details[:players].each do |key, stats|
        if stats[:shoe] > big_shoes_guy
          big_shoes_guy = stats[:shoe]
          rebounds = stats[:rebounds]
        end
      end
    end
    rebounds
end
