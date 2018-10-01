require 'pry'
def game_hash
 game = {
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
       }
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
       }
     }

   }
 }
end

# def good_practices
#   game_hash.each do |location, team_data|
#     binding.pry
#       team_data.each do |attribute, data|
#         binding.pry
#         if data.respond_to? :each
#           data.each do |data_item|
#             binding.pry
#           end
#         end
#       end
#   end
# end
# good_practices

def player_stats(player)
  stats = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data.respond_to? :each
        data.each do |the_player|
          if the_player[0] == player
            stats = the_player[1]
          end
        end
      end
    end
  end
  stats
end

def num_points_scored(player)
  player_stats(player)[:points]
end

def shoe_size(player)
  player_stats(player)[:shoe]
end

def rebounds(player)
  player_stats(player)[:rebounds]
end

def all_players
    names = []
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
          if data.respond_to? :each
            data.each do |more_data|
              if more_data.respond_to? :each
                names << more_data[0]
               end
           end
          end
        end
      end
    names
end

def team_colors(team)
  the_colors = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      the_colors = team_data[:colors]
    end
  end
  the_colors
end

def team_names
  teams = []
  game_hash.each { |location, team_data| teams<< team_data[:team_name]}
  teams
end

def player_numbers(team)
  numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      team_data.each do |attribute, data|
        if data.respond_to? :each
          data.each do |more_data|
            if more_data.respond_to? :each
              more_data.each do |the_player|
              if the_player.respond_to? :each
                numbers << the_player[:number]
                # binding.pry
              end
             end
           end
         end
        end
      end
    end
  end
  numbers
end

def big_shoe_rebounds
  temp = 0
  the_rebounds = 0
  all_players.each do |name|
    if shoe_size(name) > temp
      temp = shoe_size(name)
      the_rebounds = rebounds(name)
    end
  end
  the_rebounds
end
