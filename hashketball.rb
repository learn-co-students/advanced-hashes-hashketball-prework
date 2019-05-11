require "pry"

def game_hash
{
              
              home: {
                  team_name: "Brooklyn Nets",
                  colors: ["Black", "White"],
                  players: {
                        "Alan Anderson" => 
                            {
                            number: 0,
                            shoe: 16,
                            points: 22,
                            rebounds: 12,
                            assists: 12,
                            steals: 3,
                            blocks: 1,
                            slam_dunks: 1
                            },
                        "Reggie Evans" => 
                            {
                            number: 30,
                            shoe: 14,
                            points: 12,
                            rebounds: 12,
                            assists: 12,
                            steals: 12,
                            blocks: 12,
                            slam_dunks: 7
                            },
                        "Brook Lopez" => 
                            {
                            number: 11,
                            shoe: 17,
                            points: 17,
                            rebounds: 19,
                            assists: 10,
                            steals: 3,
                            blocks: 1,
                            slam_dunks: 15
                            },
                        "Mason Plumlee" =>
                            {
                            number: 1,
                            shoe: 19,
                            points: 26,
                            rebounds: 12,
                            assists: 6,
                            steals: 3,
                            blocks: 8,
                            slam_dunks: 5
                            },
                        "Jason Terry" => 
                            {
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
                         "Jeff Adrien" => 
                            {
                            number: 4,
                            shoe: 18,
                            :points => 10,
                            rebounds: 1,
                            assists: 1,
                            steals: 2,
                            blocks: 7,
                            slam_dunks:2
                            },
                        "Bismak Biyombo"=>
                            {
                            number: 0,
                            shoe: 16,
                            points: 12,
                            rebounds: 4,
                            assists: 7,
                            steals: 7,
                            blocks: 15,
                            slam_dunks: 10
                            },
                        "DeSagna Diop" => 
                            {
                            number: 2,
                            shoe: 14,
                            points: 24,
                            rebounds: 12,
                            assists: 12,
                            steals: 4,
                            blocks: 5,
                            slam_dunks: 5
                            },
                        "Ben Gordon" => 
                            {
                            number: 8,
                            shoe: 15,
                            points: 33,
                            rebounds: 3,
                            assists: 2,
                            steals: 1,
                            blocks: 1,
                            slam_dunks: 0
                            },
                        "Brendan Haywood"=> 
                            {
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
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, player_attributes|
      if name == player
        return player_attributes[:points]
      end
    end
  end
end

def shoe_size(player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, player_attributes|
      if name == player
        return player_attributes[:shoe]
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |location, team_data|
   team_data.each do |team_name, name_of_team|
     if name_of_team == team
       return team_data[:colors]
     end
    end
  end
end

def team_names
  teams = []
  game_hash.each do |location, team_data|
    teams << team_data[:team_name].split(",")
  end
  teams.flatten
end

def player_numbers(team)
  jerseys = []
  game_hash.each do |location, team_data|
      if team_data[:team_name] == team
        team_data[:players].each do |player, stats|
        jerseys << stats[:number]
      end
    end
  end
  jerseys
end

def player_stats(player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, player_attributes|
      if name == player 
        return player_attributes  
      end
    end
  end
end

def big_shoe_rebounds
 biggest_shoe = nil
  big_shoe_player_rebounds = nil
  game_hash.each do |location, team_data|
    team_data.each do |data_label, data|
      if data_label == :players
        data.each do |player_name, stats|
          stats.each do |stat_name, value|
            if stat_name == :shoe
              if biggest_shoe == nil
                biggest_shoe = value
                big_shoe_player_rebounds = game_hash[location][:players][player_name][:rebounds]
              elsif value > biggest_shoe
                biggest_shoe = value
                big_shoe_player_rebounds = game_hash[location][:players][player_name][:rebounds]
              end
            end
          end
        end
      end
    end
  end
  big_shoe_player_rebounds


end

