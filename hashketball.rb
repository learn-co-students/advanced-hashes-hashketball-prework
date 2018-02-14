require "pry"

def game_hash
    game = {
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

def num_points_scored(player_name)
    game_hash.each do |location, team_data|
    
        team_data[:players].each do |name, info|
        
            if name == player_name
                return info[:points]
            end
        end
    end
end

def shoe_size(player_name)
    game_hash.each do |location, team_data|
        
        team_data[:players].each do |name, info|
            
            if name == player_name
                return info[:shoe]
            end
        end
    end
end

def team_colors(team_name)
   game_hash.each do |location, team_data|
       
       if team_data[:team_name] == team_name
           return team_data[:colors]
       end
   end
end

def team_names
    home_name = game_hash[:home][:team_name]
    away_name = game_hash[:away][:team_name]
    names = [home_name, away_name]
end

def player_numbers(team_name)
    numbers = []
    
    game_hash.each do |location, team_data|
        
        if team_data[:team_name] == team_name
            
            team_data[:players].each do |name, info|
                numbers << info[:number]
            end
        end
    end
    
    numbers
end

def player_stats(player_name)
    game_hash.each do |location, team_data|
        
        team_data[:players].each do |name, info|
            
            if name == player_name
                return info
            end
        end
    end
end

def big_shoe_rebounds
    largest_size = nil
    rebounds = nil
    
    game_hash.each do |location, team_data|
       
       team_data[:players].each do |name, info|
           size = shoe_size(name)
           
           if largest_size == nil || size > largest_size
               largest_size = size
               rebounds = info[:rebounds]
           end
       end
    end
    
    rebounds
end

def most_points_scored
    most_points = nil
    player = nil
    
    game_hash.each do |location, team_data|
        
        team_data[:players].each do |name, info|
            points = info[:points]
            
            if most_points == nil || points > most_points
                most_points = points
                player = name
            end
        end
    end
    
    player
end

def winning_team
    home_points = 0
    away_points = 0
    
    game_hash[:home][:players].each do |name, info|
        home_points += info[:points]
    end
    
    game_hash[:away][:players].each do |name, info|
        away_points += info[:points]
    end
    
    if home_points > away_points
        game_hash[:home][:team_name]
    elsif away_points > home_points
        game_hash[:away][:team_name]
    else
        "TIE"
    end
end

def player_with_longest_name
    longest_length = nil
    player = nil
    
    game_hash.each do |location, team_data|
        
        team_data[:players].each do |name, info|
            
            if longest_length == nil || name.length > longest_length
                longest_length = name.length
                player = name
            end
        end
    end
    
    player
end

def player_with_most_steals
    most_steals = nil
    player = nil
    
    game_hash.each do |location, team_data|
        
        team_data[:players].each do |name, info|
            steals = info[:steals]
            
            if most_steals == nil || steals > most_steals
                most_steals = steals
                player = name
            end
        end
    end
    
    player
end

def long_name_steals_a_ton?
    player_with_longest_name == player_with_most_steals
end


