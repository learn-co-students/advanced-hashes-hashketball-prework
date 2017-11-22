
require 'pry'

def game_hash
    hash = {
        home: {
            team_name: ("Brooklyn Nets"),
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
            team_name: ("Charlotte Hornets"),
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
                }
            }
        }
    }
end


def num_points_scored(name)
    result = []
    game_hash.each do |location, team_data|
        team_data.each do |attribute,data|
            if attribute == :players
                data.each do |players, stats|
                    if players == name
                        stats.each do |stat,value|
                            if stat == :points
                                result << value
                            end
                        end
                    end
                end
            end
        end
    end
    result.join.to_i
end

def shoe_size(name)
    result = []
    game_hash.each do |location, team_data|
        team_data.each do |attribute,data|
            if attribute == :players
                data.each do |players, stats|
                    if players == name
                        stats.each do |stat,value|
                            if stat == :shoe
                                result << value
                            end
                        end
                    end
                end
            end
        end
    end
    result.join.to_i
end

def team_colors(team)
    result = []
    game_hash.each do |location, team_data|
        team_data.each do |attribute,data|
            if attribute == :team_name && data == team
                result << team_data[:colors]
            end
        end
    end
    result.flatten
end

def team_names
    results = []
    game_hash.each do |location, team_data|
        team_data.each do |attribute,data|
            if attribute == :team_name
                results << data
            end
        end
    end
    results
end

def player_numbers(team)
    results = []
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if data == team
                team_data[:players].each do |player, stats|
                    results << stats[:number]
                end
            end
        end
    end
    results
end

def player_stats(players_name)
    results = {}
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute == :players
                data.each do |player, stats|
                    if player == players_name
                        results = stats
                    end
                end
            end
        end
    end
    results
end

def largest_shoe_size
    shoe_sizes = {}
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute == :players
                data.each do |player, stats|
                    shoe_sizes[player] = stats[:shoe]
                end
            end
        end
    end
    shoe_sizes.key(shoe_sizes.values.max)
end

def big_shoe_rebounds
    #largest_shoe_size -- this is the player that we need to find the number of rebounds
    results = []
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute == :players
                data.each do |player, stats|
                    if player == largest_shoe_size
                        results << stats[:rebounds]
                    end
                end
            end
        end
    end
    results.join.to_i
    
end

