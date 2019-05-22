# Write your code here!
require 'pry'

def game_hash
{
    :home => {
        :team_name =>"Brooklyn Nets",
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
            }
        }
    },
    :away => {
        :team_name =>"Charlotte Hornets",
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
    game_hash.each do |team, data|
        if data[:players].include?(player_name)
            return data[:players][player_name][:points]
        end
    end
end

def shoe_size(player_name)
    game_hash.each do |team, data|
        if data[:players].include?(player_name)
            return data[:players][player_name][:shoe]
        end
    end
end

def team_colors(team_name)
    game_hash.each do |team, data|
        if data[:team_name].include?(team_name)
            return data[:colors]
        end
    end
end

def team_names
    game_hash.collect do |team, data|
        data[:team_name]
    end

end

def player_numbers(team_name)
    game_hash.each do |team, data|
        if data[:team_name].include?(team_name)
            return data[:players].collect do |person, stats|
                stats[:number]
            end
        end
    end
end

def player_stats(player)
    game_hash.each do |team, data|
        if data[:players].include?(player)
            return data[:players][player]
        end
    end
end

def big_shoe_rebounds
    players = []
    game_hash.each do |team, data|
        players += data[:players].sort_by do |players, stats|
            stats[:shoe] && stats[:rebounds]
        end
    end
    players.last.last[:rebounds]
end


def most_points_scored
    players = []
    game_hash.each do |team, data|
        players += data[:players].sort_by do |players, stats|
            stats[:points]
        end
    end
    players.last[0]
end

def winning_team
    
    home_score = 0
    away_score = 0
    
    game_hash.each do |team, data|
        
    if team == :home
        
        data.each do |atts, stat|
            
            if atts == :players
                
                stat.each do |person, stats|
                    home_score += stats[:points]
                end
            end
        end
    else
        data.each do |atts, stat|
    
            if atts == :players
            
                stat.each do |person, stats|
                    away_score += stats[:points]
                end
            end
        end
    end
end

if home_score > away_score
    game_hash[:home][:team_name]
else
    game_hash[:away][:team_name]
end

end

def player_with_longest_name
    current_long_name = 0
    longest_name = ""
    
    game_hash.each do |place, data|
        data.each do |atts, stats|
            if atts == :players
                stats.each do |person, stat|
                    if person.length > current_long_name
                        current_long_name = person.length
                        longest_name = person
                    end
                end
            end
        end
    end
    longest_name
end

def long_name_steals_a_ton?
    current_most_steals = 0
    most_steals = ""
    
    game_hash.each do |place, data|
        data.each do |atts, stats|
            if atts == :players
                stats.each do |person, stat|
                    if stat[:steals] > current_most_steals
                        current_most_steals = stat[:steals]
                        most_steals = person
                    end
                end
            end
        end
    end
    most_steals == player_with_longest_name
end 
    
    

    


