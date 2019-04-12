







require "pry"


# Write your code here!













def game_hash
   {
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

 def num_points_scored(player_name)
     game_hash.each do |location, data|
       data[:players].each do |name, stat|
         if player_name == name
           return stat[:points]
         end
       end
     end
   end
   p num_points_scored("Brendan Haywood")

   def team_colors(name)
    game_hash.each do |location, data|
      if data[:team_name] == name
       return data[:colors]
      end
    end
  end
   p team_colors("Charlotte Hornets")

   def shoe_size(player_name)
     game_hash.each do |location, data|
       data[:players].each do |name, stat|
         if player_name == name
           return stat[:shoe]
         end
       end
     end
   end
   p shoe_size("Ben Gordon")

 def team_names
   teams = []
   game_hash.each do |location, data|
     teams << data[:team_name]
   end
   teams
 end
 p team_names

   # def players_numbers(team)
   #   numbers = []
   #   game_hash.each do |location, data|

   #     data[:players].each do |name, stat|
   #      numbers << stat[:number]
   #      end
   #   end
   # return numbers
   # end
   # p players_numbers("Brooklyn Nets")

 def player_numbers(team)
   if game_hash[:home][:team_name] == team
     game_hash[:home][:players].map do |name, stat|
       stat[:number]
     end
   else
     game_hash[:away][:players].map do |name, stat|
         stat[:number]
     end
   end
 end
 p player_numbers("Brooklyn Nets")
 # p players_numbers("Charlotte Hornets")

 def player_stats(player_name)
   game_hash.each do |location, data|
     data[:players].each do |name, stat|
       if player_name == name
         return stat
       end
     end
   end
 end
 p player_stats("DeSagna Diop")

 # start with a variable such as largest_shoe_size
 # additional variable with players_stats
 # need something like random shoe size to start to compare to all other players shoe size
 # return largest shoe's rebounds
 def big_shoe_rebounds
   largest_shoe_size = game_hash[:home][:players].values.sample[:shoe]
   player = nil

   game_hash.each do |location, data|
     data[:players].each do |name, stat|
       if stat[:shoe] >= largest_shoe_size
        largest_shoe_size = stat[:shoe]
        player = stat
       end
     end
   end
   player[:rebounds]
 end
 p big_shoe_rebounds
