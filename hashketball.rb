# Write your code here!
require 'pry'
def game_hash
    {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          name: "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
      }, #<-- closing Alan Anderson hash
      {
          name: "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
      }, #<-- closing Reggie Evans hash
      {
          name: "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
      }, #<-- closing Brook Lopez hash
      {
          name: "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
      }, #<-- closing Mason Plumlee hash
      {
          name: "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
      } #<-- closing Jason Terry hash
    ] #<--:players array
  },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [{
        name: "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
      }, #<-- closing Jeff Adrien hash
      {
        name: "Bismak Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
      }, #<-- closing Bismak Biyombo hash
      {
        name: "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
      }, #<-- closing DeSagna Diop hash
      {
        name: "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
      }, #<-- closing Ben Gordon hash
      {
          name: "Brendan Haywood",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals =>22,
          :blocks => 5,
          :slam_dunks => 12
        } #<-- closing Brendan Haywood hash
      ] #<--:players array
    } #<-- closing :away key
  } #closing hash
end

def num_points_scored(player)
  game_hash.each do |location, team_data|
   team_data[:players].each do |player_info|
     if player_info[:name].include?(player)
       return player_info[:points]
     end
   end
  end
end

def shoe_size(player)
 game_hash.each do |location, team_data|
  team_data[:players].each do |player_info|
    if player_info[:name].include?(player)
       return player_info[:shoe]
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
      team_data[:players].collect do |player|
      jersey_numbers << player[:number]
    end
   end
  end
 jersey_numbers.sort
end

def player_stats(player)
  game_hash.each do |location, team_data|
   team_data[:players].each do |player_info|
     if player_info[:name].include?(player)
      player_info.delete_if {|key, value| key == :name }
       return player_info
     end
   end
  end
end

def big_shoe_rebounds
   game_hash.each do |location, team_data|
    team_data[:players].find do |player|
    if player[:shoe] > 18
      return player[:rebounds]
    end
  end
 end
end
