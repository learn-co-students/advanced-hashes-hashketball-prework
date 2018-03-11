require("pry")

def game_hash
    game_hash = {
        :home => {
            :team_name => "Brooklyn Nets",
            :colors => ["Black", "White"],
            :players => {
                :"Alan Anderson" => {
                    :number => 0,
                    :shoe => 16,
                    :points => 22,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 1
                },
                :"Reggie Evans" => {
                    :number => 30,
                    :shoe => 14,
                    :points => 12,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 12,
                    :blocks => 12,
                    :slam_dunks => 7
                },
                :"Brook Lopez" => {
                    :number => 11,
                    :shoe => 17,
                    :points => 17,
                    :rebounds => 19,
                    :assists => 10,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 15
                },
                :"Mason Plumlee" => {
                    :number => 1,
                    :shoe => 19,
                    :points => 26,
                    :rebounds => 12,
                    :assists => 6,
                    :steals => 3,
                    :blocks => 8,
                    :slam_dunks => 5
                },
                :"Jason Terry" => {
                    :number => 31,
                    :shoe => 15,
                    :points => 19,
                    :rebounds => 2,
                    :assists => 2,
                    :steals => 4,
                    :blocks => 11,
                    :slam_dunks => 1
                }
            }
        },
        :away => {
            :team_name => "Charlotte Hornets",
            :colors => ["Turquoise", "Purple"],
            :players => {
                :"Jeff Adrien" => {
                    :number => 4,
                    :shoe => 18,
                    :points => 10,
                    :rebounds => 1,
                    :assists => 1,
                    :steals => 2,
                    :blocks => 7,
                    :slam_dunks => 2
                },
                :"Bismak Biyombo" => {
                    :number => 0,
                    :shoe => 16,
                    :points => 12,
                    :rebounds => 4,
                    :assists => 7,
                    :steals => 7,
                    :blocks => 15,
                    :slam_dunks => 10
                },
                :"DeSagna Diop" => {
                    :number => 2,
                    :shoe => 14,
                    :points => 24,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 4,
                    :blocks => 5,
                    :slam_dunks => 5
                },
                :"Ben Gordon" => {
                    :number => 8,
                    :shoe => 15,
                    :points => 33,
                    :rebounds => 3,
                    :assists => 2,
                    :steals => 1,
                    :blocks => 1,
                    :slam_dunks => 0
                },
                :"Brendan Haywood" => {
                    :number => 33,
                    :shoe => 15,
                    :points => 6,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 22,
                    :blocks => 5,
                    :slam_dunks => 12
                }
            }
        }
    }
end


def home_team_name
    game_hash[:home] [:team_name]
end

def good_practices(name)
    x = nil
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute == :players
                if data[name.to_sym] != nil
                    x = location[name.to_sym][:rebounds]
                end
            end
        end
    end
    x
end

def num_points_scored(player_name)
    y = nil
    game_hash.each do |team, team_hash|
        team_hash[:players].each do |player, player_hash|
            if player == player_name.to_sym
                y = team_hash[:players][player_name.to_sym][:points]
            end
        end
    end
    y
end

def shoe_size(player_name)
    y = nil
    game_hash.each do |team, team_hash|
        team_hash[:players].each do |player, player_hash|
            if player == player_name.to_sym
                y = team_hash[:players][player_name.to_sym][:shoe]
            end
        end
    end
    y
end

def team_colors(team_name)
    y = nil
    game_hash.each do |team, team_hash|
        if game_hash[team][:team_name] == team_name
            y = game_hash[team][:colors]
        end
    end
    y
end

def team_names
    team_name_array = []
    game_hash.each do |team, team_hash|
        team_name_array << game_hash[team][:team_name]
    end
    team_name_array
end


def player_numbers(team_name)
    jersey_numbers_array = []
    game_hash.each do |team, team_hash|
        if game_hash[team][:team_name] == team_name
            team_hash[:players].each do |player, player_hash|
                jersey_numbers_array << player_hash[:number]
                end
        end
    end
    jersey_numbers_array
end

def player_stats(player_name)
    y = nil
    game_hash.each do |team, team_hash|
        team_hash[:players].each do |player, player_hash|
            if player == player_name.to_sym
                y = player_hash
            end
        end
    end
    y
end

def big_shoe_rebounds
    biggest_shoe = 0
    rebounds_with_biggest_shoes = 0
    game_hash.each do |team, team_hash|
        team_hash[:players].each do |player, player_hash|
            if player_hash[:shoe] > biggest_shoe
                biggest_shoe = player_hash[:shoe]
                rebounds_with_biggest_shoes = player_hash[:rebounds]
            end
        end
    end
    rebounds_with_biggest_shoes
end
                
                
