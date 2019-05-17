# Write your code here!
require 'pry'

def game_hash
    game_hash = {
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

def good_practices
    game_hash.each do |location, team_data|
        #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
        binding.pry
        team_data.each do |attribute, data|
            #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
            binding.pry
            
            #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
            data.each do |data_item|
                binding.pry
            end
        end
    end
end

def num_points_scored(player_name)
    points = 0
    game_hash.each do |place, data|
        if data[:players].include? player_name
        points = data[:players][player_name][:points]
        end
    end
    points
end

def shoe_size(player_name)
    size = 0
    game_hash.each do |place, data|
        if data[:players].include? player_name
            size = data[:players][player_name][:shoe]
        end
    end
    size
end

def team_colors(team_name)
    colors = []
    game_hash.each do |place, data|
        if data[:team_name] == team_name
           colors = data[:colors]
        end
        end
    colors
end

def team_names
    game_hash.collect do |place, data|
        data[:team_name]
    end
end

def player_numbers(team)
    numbers = []
    game_hash.each do |place, data|
        if data[:team_name].include? team
            data[:players].each do |name, attribute|
                attribute.each do |key, value|
                    if key == :number
                        numbers << value
                    end
                end
            end
        end
    end
    numbers
end
    
def player_stats(player)
    stats = {}
    game_hash.each do |place, data|
        if data[:players].include? player
            stats = data[:players][player]
        end
    end
    stats
end
    
def big_shoe_rebounds
    stats = {}
    game_hash.each do |place, data|
        data[:players].each do |name, attribute|
            if stats == {} || stats[:shoe] < attribute[:shoe]
                stats = attribute
            end
        end
    end
    stats[:rebounds]
end

def most_points_scored
    stats = {}
    player = ""
    game_hash.each do |place, data|
        data[:players].each do |name, attribute|
            if stats == {} || stats[:points] < attribute[:points]
                stats = attribute
                player = name
            end
        end
    end
    player
end

def winning_team
    team_home = 0
    team_away = 0
    game_hash[:home][:players].each do |name, attribute|
        team_home += attribute[:points]
    end
    game_hash[:away][:players].each do |name, attribute|
        team_away += attribute[:points]
    end
    if team_home > team_away
        return game_hash[:home][:team_name]
    else
        return game_hash[:away][:team_name]
    end
end

def player_with_longest_name
    player = ""
    game_hash.each do |place, data|
        data[:players].each do |name, attribute|
            if name == "" || player.split(//).length < name.split(//).length
                player = name
            end
        end
    end
    player
end

def long_name_steals_a_ton
    stats = {}
    player_compare = ""
    game_hash.each do |place, data|
        data[:players].each do |name, attribute|
            if stats =={} || stats[:steals] < attribute[:steals]
                stats = attribute
                player_compare = name
            end
        end
    end
    player_compare == player_with_longest_name
end


    
    
    
