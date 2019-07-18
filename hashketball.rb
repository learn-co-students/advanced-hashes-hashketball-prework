require "pry"

def game_hash
    game_data = {
        :home => {
            :team_name => "Brooklyn Nets",
            :colors => ["Black", "White"],
            :players => [
                { 
                    :player_name => "Alan Anderson",
                    :number => 0,
                    :shoe => 16,
                    :points => 22,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 1
                },
                {
                    :player_name => "Reggie Evans",
                    :number => 30,
                    :shoe => 14,
                    :points => 12,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 12,
                    :blocks => 12,
                    :slam_dunks => 7   
                },
                {
                    :player_name => "Brook Lopez",
                    :number => 11,
                    :shoe => 17,
                    :points => 17,
                    :rebounds => 19,
                    :assists => 10,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 15
                },
                {
                    :player_name => "Mason Plumlee",
                    :number => 1,
                    :shoe => 19,
                    :points => 26,
                    :rebounds => 11,
                    :assists => 6,
                    :steals => 3,
                    :blocks => 8,
                    :slam_dunks => 5
                },
                {
                    :player_name => "Jason Terry",
                    :number => 31,
                    :shoe => 15,
                    :points => 19,
                    :rebounds => 2,
                    :assists => 2,
                    :steals => 4,
                    :blocks => 11,
                    :slam_dunks => 1
                },
            ]
        },
        :away => {
            :team_name => "Charlotte Hornets",
            :colors => ["Turquoise", "Purple"],
            :players => [
                {
                    :player_name => "Jeff Adrien",
                    :number => 4,
                    :shoe => 18,
                    :points => 10,
                    :rebounds => 1,
                    :assists => 1,
                    :steals => 2,
                    :blocks => 7,
                    :slam_dunks => 2
                },
                {
                    :player_name => "Bismack Biyombo",
                    :number => 0,
                    :shoe => 16,
                    :points => 12,
                    :rebounds => 4,
                    :assists => 7,
                    :steals => 22,
                    :blocks => 15,
                    :slam_dunks => 10
                },
                {
                    :player_name => "DeSagna Diop",
                    :number => 2,
                    :shoe => 14,
                    :points => 24,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 4,
                    :blocks => 5,
                    :slam_dunks => 5
                },
                {
                    :player_name => "Ben Gordon",
                    :number => 8,
                    :shoe => 15,
                    :points => 33,
                    :rebounds => 3,
                    :assists => 2,
                    :steals => 1,
                    :blocks => 1,
                    :slam_dunks => 0
                },
                {
                    :player_name => "Kemba Walker",
                    :number => 33,
                    :shoe => 15,
                    :points => 6,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 7,
                    :blocks => 5,
                    :slam_dunks => 12
                },
            ]
        }
    }
    game_data
end

def num_points_scored(player_name)
    data = game_hash()
    data.each do |location, info|
        info.each do |info_key, info_value|
            if info_key == :players
                info_value.each do |p_key, p_value_of_obj|
                    if p_key[:player_name] == player_name
                        return p_key[:points]
                    end
                end
            end
        end
    end
end

def shoe_size(player_name)
    data = game_hash()
    data.each do |location, info|
        info.each do |info_key, info_value|
            if info_key == :players
                info_value.each do |p_key, p_value_of_obj|
                    if p_key[:player_name] == player_name
                        return p_key[:shoe]
                    end
                end
            end
        end
    end
end

def team_colors(team_name)
    data = game_hash
    data.each do |location, info|
        if info[:team_name] == team_name
            return info[:colors]
        end
    end
end

def team_names
    data = game_hash
    teams = []
    data.each do |location, info|
        info.each do |k, v|
            if k == :team_name
                teams << v
            end
        end
    end
    teams
end

def player_numbers(team)
    data = game_hash
    numbers = []
    data.each do |location, info|
        info.each do |k, v|
            if k == :team_name && v == team
                info[:players].each do |a, b|
                    numbers << a[:number]
                end
            end
        end
    end
    numbers
end

def player_stats(player)
    data = game_hash
    return_hash = {}
    data.each do |location, info|
        info.each do |info_key, info_value|
            if info_key == :players
                info_value.each do |p_key, p_value_of_obj|
                    if p_key[:player_name] == player
                        return_hash = p_key
                    end
                end
            end
        end
    end
    return_hash.delete(:player_name)
    return_hash
end

def big_shoe_rebounds
    data = game_hash
    player_hold = 0
    shoe_hold = 0
    data.each do |location, info|
        info.each do |info_key, info_value|
            if info_key == :players
                info_value.each do |k, v|
                    if k[:shoe] > shoe_hold
                        player_hold = k[:rebounds]
                        shoe_hold = k[:shoe]
                    end
                end
            end
        end
    end
    player_hold
end

def most_points_scored
    data = game_hash
    player_hold = 0
    points_hold = 0
    data.each do |location, info|
        info.each do |info_key, info_value|
            if info_key == :players
                info_value.each do |k, v|
                    if k[:points] > points_hold
                        player_hold = k[:player_name]
                        points_hold = k[:points]
                    end
                end
            end
        end
    end
    player_hold
end

def winning_team
    data = game_hash
    home_points = 0
    away_points = 0
    home_team = data[:home][:team_name]
    away_team = data[:away][:team_name]
    data.each do |location, info|
        info.each do |info_key, info_value|            
            if info_key == :players
                info_value.each do |k, v|
                    if location == :home
                        home_points += k[:points]
                    else 
                        away_points += k[:points]
                    end
                end
            end
        end
    end
    home_points > away_points ? home_team : away_team
end

def player_with_longest_name
    data = game_hash
    player_hold = 0
    length_hold = 0
    data.each do |location, info|
        info.each do |info_key, info_value|
            if info_key == :players
                info_value.each do |k, v|
                    len = k[:player_name]
                    if len.size > length_hold
                        player_hold = k[:player_name]
                        length_hold = len.size
                    end
                end
            end
        end
    end
    player_hold
end

def long_name_steals_a_ton?
    data = game_hash
    player_hold = 0
    steal_hold = 0
    player_long = player_with_longest_name
    data.each do |location, info|
        info.each do |info_key, info_value|
            if info_key == :players
                info_value.each do |k, v|
                    if k[:steals] > steal_hold
                        player_hold = k[:player_name]
                        steal_hold = k[:steals]
                    end
                end
            end
        end
    end
    player_long == player_hold ? true : false
end