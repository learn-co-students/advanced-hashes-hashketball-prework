# Write your code here!
require 'pry'

def game_hash
hash = {
    :home => {
        :team_name => "Brooklyn Nets",
        :colors => ["Black", "White"],
        :players => {
            "Alan Anderson" => {
                :number => 0,
                :shoe => 16,
                :points => 22,
                :rebounds => 12,
                :assists => 12,
                :steals => 3,
                :blocks => 1,
                :slam_dunks => 1 
            },
            "Reggie Evans" => {                
                :number => 30,
                :shoe => 14,
                :points => 12,
                :rebounds => 12,
                :assists => 12,
                :steals => 12,
                :blocks => 12,
                :slam_dunks => 7
        },
            "Brook Lopez" => {
                :number => 11,
                :shoe => 17,
                :points => 17,
                :rebounds => 19,
                :assists => 10,
                :steals => 3,
                :blocks => 1,
                :slam_dunks => 15
            },
            "Mason Plumlee" => {
                :number => 1,
                :shoe => 19,
                :points => 26,
                :rebounds => 12,
                :assists => 6,
                :steals => 3,
                :blocks => 8,
                :slam_dunks => 5
            },
            "Jason Terry" => {
                :number => 31,
                :shoe => 15,
                :points => 19,
                :rebounds => 2,
                :assists => 2,
                :steals => 4,
                :blocks => 11,
                :slam_dunks => 1
            },
        }
    },
    :away => {
        :team_name => "Charlotte Hornets",
        :colors => ["Turquoise", "Purple"],
        :players => {
            "Jeff Adrien" => {
                :number => 4,
                :shoe => 18,
                :points => 10,
                :rebounds => 1,
                :assists => 1,
                :steals => 2,
                :blocks => 7,
                :slam_dunks => 2 
            },
            "Bismak Biyombo" => {                
                :number => 0,
                :shoe => 16,
                :points => 12,
                :rebounds => 4,
                :assists => 7,
                :steals => 7,
                :blocks => 15,
                :slam_dunks => 10
        },
            "DeSagna Diop" => {
                :number => 2,
                :shoe => 14,
                :points => 24,
                :rebounds => 12,
                :assists => 12,
                :steals => 4,
                :blocks => 5,
                :slam_dunks => 5
            },
            "Ben Gordon" => {
                :number => 8,
                :shoe => 15,
                :points => 33,
                :rebounds => 3,
                :assists => 2,
                :steals => 1,
                :blocks => 1,
                :slam_dunks => 0
            },
            "Brendan Haywood" => {
                :number => 33,
                :shoe => 15,
                :points => 6,
                :rebounds => 12,
                :assists => 12,
                :steals => 22,
                :blocks => 5,
                :slam_dunks => 12
            },
        }
    },
}
end

def num_points_scored(name)
    name_points = ""
    game_hash.each do |team, team_data|
        team_data.each do |data, value|
            if data == :players 
                value.each do |person, personnel_data|
                    if person == name
                    name_points = personnel_data[:points]
                    end
                end
            end
        end
    end
    return name_points
end

num_points_scored("Ben Gordon")

def shoe_size(name)
    shoe_size = ""
    game_hash.each do |team, team_data|
        team_data.each do |data, value|
            if data == :players 
                value.each do |person, personnel_data|
                    if person == name
                    shoe_size = personnel_data[:shoe]
                    end
                end
            end
        end
    end
    return shoe_size
end

def team_colors(team_name)
    team_colors = []
    game_hash.each do |team, team_data|
        team_data.each do |data, value|
            if data == :team_name
                    if value == team_name
                    team_colors = team_data[:colors]
                    end
            end
        end
    end
    return team_colors
end

def team_names
    team_names_array = []
    game_hash.each do |team, team_data|
        team_data.each do |data, value|
            if data == :team_name
                team_names_array.push(value)
            end
        end
    end
    return team_names_array
end

def player_numbers(team_name)
    player_numbers = []
    boo_var = false
    game_hash.each do |team, team_data|
        team_data.each do |data, value|
            if data == :team_name
                if value == team_name
                    boo_var = true
                else
                    boo_var = false
                end
            end
            if data == :players && boo_var == true
                value.each do |player_name, player_stat|
                    player_stat.each do |stat, p_value|
                        if stat == :number
                        player_numbers.push(p_value)
                        end
                    end
                end
            end
        end
    end
    return player_numbers
end

def player_stats(player)
    #return has of player stats
    player_stats = {}
    game_hash.each do |team, team_data|
        team_data.each do |data_point, data_value|
            if data_point == :players
                data_value.each do |player_name, player_stat|
                    if player_name == player
                        player_stat.each do |p_stat, p_value|
                            player_stats[p_stat] = p_value
                        end
                    end
                end
            end
        end
    end
    return player_stats
end

def big_shoe_rebounds
#find player with most rebounds
    #create arrays to store initial location of players & shoe sizes, sort shoe sizes
    players = []
    shoe_sizes = []
    sorted_shoe_sizes = []
    game_hash.each do |team, team_data|
        team_data.each do |data_point, data_value|
            if data_point == :players
                data_value.each do |player_name, player_stat|
                    players.push(player_name)
                        player_stat.each do |p_stat, p_value|
                            if p_stat == :shoe
                                shoe_sizes.push(p_value)
                            end
                        end
                    end
                end
            end
        end
    #sort shoes into sorted shoe array
    sorted_shoe_sizes = shoe_sizes.each do |element| sorted_shoe_sizes.push(element) end
    sorted_shoe_sizes = sorted_shoe_sizes.sort
    
    #find player name with largest shoe
    largest_shoe = sorted_shoe_sizes[-1]
    largest_shoe_index = shoe_sizes.index(largest_shoe)
    largest_shoe_player = players[largest_shoe_index]
    
    #find rebounds of player found above
    rebounds = ""
    game_hash.each do |team, team_data|
        team_data.each do |data, value|
            if data == :players 
                value.each do |person, personnel_data|
                    if person == largest_shoe_player
                    rebounds = personnel_data[:rebounds]
                    end
                end
            end
        end
    end
    return rebounds
end

def most_points_scored
end

def winning_team
end

def player_with_longest_name
end

def long_name_steals_a_ton?
end









