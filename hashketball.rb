require "pry"
# Write your code here!
def game_hash
    #binding.pry
    hash = Hash.new
    hash[:home] = {:team_name => "Brooklyn Nets", :colors => ["Black", "White"], :players => {"Alan Anderson" =>
        {:number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1}, "Reggie Evans" => {:number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7}, "Brook Lopez" => {:number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15}, "Mason Plumlee" => {:number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5}, "Jason Terry" => {:number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}}}
    hash[:away] = {
        :team_name => "Charlotte Hornets",
        :colors => ["Turquoise", "Purple"],
        :players => {
            "Jeff Adrien" => {
                :number => 4,
                :shoe =>18,
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
                :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
            "Ben Gordon" => {:number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0 },
            "Brendan Haywood" => {:number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12}}}
        hash
end

def num_points_scored(players)
    test = game_hash[:away][:players]
    home_test = game_hash[:home][:players]
    another_test = test.merge(home_test)
    #binding.pry
new_test = another_test.fetch(players)
new_test[:points]
end

def shoe_size(players_name)
    test = game_hash[:away][:players]
    home_test = game_hash[:home][:players]
    another_test = test.merge(home_test)
    #binding.pry
    new_test = another_test.fetch(players_name)
    new_test[:shoe]
end

def team_colors (team_name)
    #binding.pry
    
    if team_name == "Brooklyn Nets"
        #binding.pry
        game_hash[:home][:colors]
    elsif team_name == "Charlotte Hornets"
        game_hash[:away][:colors]
    end

end

def team_names
teams_array = []
teams_array.push(game_hash[:home][:team_name])
teams_array.push(game_hash[:away][:team_name])
end

def player_numbers (team_name)
    numbers_array = []
    if game_hash[:home][:team_name] == team_name
        game_hash[:home][:players].each do |name, stats|
            stats.each do |key, value|
                numbers_array.push(value) if (key == :number)
            end
        end
    else
        game_hash[:away][:players].each do |name, stats|
            stats.each do |key, value|
                numbers_array.push(value) if (key == :number)
                #binding.pry
            end
        end
    end
    
    numbers_array = numbers_array.sort
end

def player_stats(players_name)
    # binding.pry
     if game_hash[:home][:players].include?(players_name)
     #binding.pry
         game_hash[:home][:players][players_name]
        else
        game_hash[:away][:players].include?(players_name)
        game_hash[:away][:players][players_name]
     end
end

def big_shoe_rebounds
    new_array_large_person = []
    new_array_name = []
    test = game_hash[:away][:players]
    home_test = game_hash[:home][:players]
    another_test = test.merge(home_test)
    #binding.pry
    
#    new_test = another_test.fetch(players_name)
#    new_test[:shoe]
#
    another_test.each do |keys, values|
        #binding.pry
        
        values.each do |keys_info, values_info|
             new_array_large_person.push(values_info) if (keys_info == :shoe && values_info > 18)
             new_array_name.push(keys) if (keys_info == :shoe && values_info > 18)
             #binding.pry
            end
        end
    new_string = new_array_name.join(",")
    # binding.pry
   
        if another_test.include?(new_string)
            another_test[new_string][:rebounds]
            end
        # binding.pry
#new_array_large_person = new_array_large_person.join(",")
#new_array_large_person = new_array_large_person.to_i
end

def most_points_scored
points_scored_array = []

test = game_hash[:away][:players]
home_test = game_hash[:home][:players]
another_test = test.merge(home_test)

another_test.each do |keys, values|
    values.each do |keys_info, values_info|
        points_scored_array.push(keys) if (keys_info == :points && values_info > 30)
        end
    end
new_string = points_scored_array.join(",")
new_string
end

def winning_team
test = game_hash[:away][:players]
home_test = game_hash[:home][:players]
home_team_score = 0
away_team_score = 0

test.each do |keys, values|
    values.each do |keys_info, values_info |
        away_team_score += values_info if keys_info == :points
        end
    end
home_test.each do |keys, values|
    values.each do |keys_info, values_info|
        home_team_score += values_info if keys_info == :points
        end
    end
if home_team_score > away_team_score
    game_hash[:home][:team_name]
else
game_hash[:away][:team_name]
end
end

#def player_with_longest_name
#for this one we can push all the names of the players into an array and compare the length of the names of the players and return the longest one
#end

#def long_name_steals_a_ton?
#    we can grab the longest name of all the players and then we can set a boolean and compare if the longest name had the most steals or not
#end















