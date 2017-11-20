# Write your code here!
def game_hash
  teams = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        }, # close Alan hash

        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        }, #close Reggie hash

        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        }, #close Brook hash

        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        }, #close Mason hash


        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        } #close Jason hash

      } #close players hash
    }, #close home hash

    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
           :number => 4,
           :shoe => 18,
           :points => 10,
           :rebounds => 1,
           :assists => 1,
           :steals => 2,
           :blocks => 7,
           :slam_dunks => 2
         }, # close Jeff hash

         "Bismak Biyombo" => {
           :number => 0,
           :shoe => 16,
           :points => 12,
           :rebounds => 4,
           :assists => 7,
           :steals => 7,
           :blocks => 15,
           :slam_dunks => 10
         }, #close Bismak hash

         "DeSagna Diop" => {
           :number => 2,
           :shoe => 14,
           :points => 24,
           :rebounds => 12,
           :assists => 12,
           :steals => 4,
           :blocks => 5,
           :slam_dunks => 5
         }, #close DeSagna hash

         "Ben Gordon" => {
           :number => 8,
           :shoe => 15,
           :points => 33,
           :rebounds => 3,
           :assists => 2,
           :steals => 1,
           :blocks => 1,
           :slam_dunks => 0
         }, #close Ben hash

         "Brendan Haywood" => {
           :number => 33,
           :shoe => 15,
           :points => 6,
           :rebounds => 12,
           :assists => 12,
           :steals =>22,
           :blocks => 5,
           :slam_dunks => 12
         } #close Brendan hash
       }#close players hash

    } #close away hash
  } #close teams hash
end


def num_points_scored(player)
   game_hash.each do | location, team_data|
    team_data[:players].each do |player_name, stats_hash|
      if player_name == player
        return stats_hash[:points]
      end
    end
   end
 end

 def shoe_size(player)
  game_hash.each do |location, team_data|
   team_data[:players].each do |player_name, stats_hash|
     if player_name.include?(player)
        return stats_hash[:shoe]
      end
    end
  end
 end

 def team_colors(team)
   game_hash.each do |location, team_data|
   if team_data[:team_name].include?(team)
       return team_data[:colors]
     end
   end
 end

 def team_names
   game_hash.collect do |location, team_info|
      team_info[:team_name]
    end
 end

 def player_numbers(team)
   jersey_numbers = []
   game_hash.each do |location, team_data|
     if team_data[:team_name].include?(team)
       team_data[:players].collect do |player, stats|
       jersey_numbers << stats[:number]
     end
    end
   end
  jersey_numbers.sort
 end

 def player_stats(player)
    game_hash.each do |location, team_data|
     team_data[:players].each do |player_name, stats_hash|
       if player_name.include?(player)
        stats_hash.delete_if {|key, value| key == :name }
         return stats_hash
       end
     end
    end
  end


  def big_shoe_rebounds
    game_hash.each do |location, team_data|
     team_data[:players].find do |player, stats_hash|
     if stats_hash[:shoe] > 18
       return stats_hash[:rebounds]
     end
   end
  end
 end
