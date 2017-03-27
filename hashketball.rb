require "pry"
def game_hash
    game_hash={
        :home => {
            :team_name=>"Brooklyn Nets",
            :colors => ["Black", "White"],
            :players => {
               "Alan Anderson" => {
                   :number =>0,
                   :shoe => 16,
                   :points => 22,
                   :rebounds => 12,
                   :assists => 12,
                   :steals => 3,
                   :blocks => 1,
                   :slam_dunks => 1
               },
               "Reggie Evans" => {
                   :number =>30,
                   :shoe => 14,
                   :points => 12,
                   :rebounds => 12,
                   :assists => 12,
                   :steals => 12,
                   :blocks => 12,
                   :slam_dunks => 7
               },
               "Brook Lopez" => {
                   :number =>11,
                   :shoe => 17,
                   :points => 17,
                   :rebounds => 19,
                   :assists => 10,
                   :steals => 3,
                   :blocks => 1,
                   :slam_dunks => 15
               },
               "Mason Plumlee" => {
                   :number =>1,
                   :shoe => 19,
                   :points => 26,
                   :rebounds => 12,
                   :assists => 6,
                   :steals => 3,
                   :blocks => 8,
                   :slam_dunks => 5
               },
               "Jason Terry" => {
                   :number =>31,
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
            :team_name=>"Charlotte Hornets",
            :colors => ["Turquoise", "Purple"],
            :players => {
                "Jeff Adrien" => {
                    :number =>4,
                    :shoe => 18,
                    :points => 10,
                    :rebounds => 1,
                    :assists => 1,
                    :steals => 2,
                    :blocks => 7,
                    :slam_dunks => 2
                },
                "Bismak Biyombo" => {
                    :number =>0,
                    :shoe => 16,
                    :points => 12,
                    :rebounds => 4,
                    :assists => 7,
                    :steals => 7,
                    :blocks => 15,
                    :slam_dunks => 10
                },
                "DeSagna Diop" => {
                    :number =>2,
                    :shoe => 14,
                    :points => 24,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 4,
                    :blocks => 5,
                    :slam_dunks => 5
                },
                "Ben Gordon" => {
                    :number =>8,
                    :shoe => 15,
                    :points => 33,
                    :rebounds => 3,
                    :assists => 2,
                    :steals => 1,
                    :blocks => 1,
                    :slam_dunks => 0
                },
                "Brendan Haywood" => {
                    :number =>33,
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

def  num_points_scored(player_name)
int = 0
   game_hash.each do |location, data|
       data.each do |category, detail|
           if category == :players
               detail.each do |name, stats|
                   if name == player_name
                       stats.each do |key, value|
                           if key==:points
                               int = value
                               end
                           end
                       end
                   end
               end
           end
        end
   int
   end
           
           

#game_hash[:away][:home][:players]["Brendan Haywood"][:points]

def shoe_size(player_name)
    int = 0
    game_hash.each do |location, data|
        data.each do |category, detail|
            if category == :players
                detail.each do |name, stats|
                    if name == player_name
                        stats.each do |key, value|
                            if key==:shoe
                                int = value
                            end
                        end
                    end
                end
            end
        end
    end
    int

end



def team_colors(team_name)
    game_hash.keys.each do |team|
        if game_hash[team][:team_name] == team_name
         return game_hash[team][:colors]
        end
    end
end


def team_names
    array=[]
    game_hash.keys.each do |team|
         array<<game_hash[team][:team_name]
         end
    array
end

def player_numbers(team_name)
    array=[]
    game_hash.keys.each do |team|
        if game_hash[team][:team_name] == team_name
            game_hash[team][:players].keys.each do |player|
               array<< game_hash[team][:players][player][:number]
               end
            end
        end
    array
end

def player_stats(player_name)
    game_hash.keys.each do |team|
        if game_hash[team][:players].include?(player_name)
           return  game_hash[team][:players][player_name]
            end
        end
end

def big_shoe_rebounds
   big_shoe = 0
   player_big_foot = ""
   home_away = ""
   game_hash.keys.each do |team|
       game_hash[team][:players].keys.each do |player|
           if game_hash[team][:players][player][:shoe] > big_shoe
               big_shoe = game_hash[team][:players][player][:shoe]
               player_big_foot = player
               home_away = team
               end
           end
       end
   game_hash[home_away][:players][player_big_foot][:rebounds]
   end

def most_points_scored
    points = 0
    player_most_points = ""
    home_away = ""
    game_hash.keys.each do |team|
        game_hash[team][:players].keys.each do |player|
            if game_hash[team][:players][player][:points] > points
                points =game_hash[team][:players][player][:points]
                player_most_points = player
                home_away = team
                end
            end
        end
       player_most_points
    end



