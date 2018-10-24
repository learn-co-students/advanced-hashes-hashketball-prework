# Write your code here!
require "pry"

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ['black','white'],
      :players => [
        {
          :name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1,
        },
        {
          :name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7,
        },
         {
          :name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15,
        },
         {
          :name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5,
        },
         {
          :name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1,
        }
        ]
    },
:away => {
      :team_name => "Charlotte Hornets",
      :colors => ['Turquoise', 'purple'],
      :players => [
        {
          :name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2,
        },
        {
          :name => "Bismak Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10,
        },
        {
          :name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5,
        },
        {
          :name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0,
        },
        {
          :name => "Brendan Haywood",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12,
        }
        ]
      }
  }
end

def good_practices
  game_hash.each do |location, team_data|
    binding.pry
team_data.each do |attribute, data|
  binding.pry
  data.each do |data_item|
            binding.pry
      end
    end
  end
end

def num_points_scored(name)
  answer = nil
  game_hash.each do |team, points|
    players_array = points[:players]
    players_array.each do |player_points|
      if player_points[:name] == name
        answer = player_points[:points]
      end
    end
  end
answer
end

def shoe_size(name)
  answer = nil
   game_hash.each do |team, shoe|
    players_array = shoe[:players]
    players_array.each do |player_shoe|
      if player_shoe[:name] == name
        answer = player_shoe[:shoe]
      end
    end
  end
answer

end

def team_colors(team)
  
  game_hash.values.each do |team_info|
    if team_info.has_value?(team) 
      return team_info[:colors].map(&:capitalize)
    end
 end
end

def team_names
  game_hash.values.map {|value| value[:team_name]}

end

def player_numbers(team)
game_hash.values.each do |team_info|
  if team_info.has_value?(team)
    return team_info[:players].map { |player| player[:number]}
    end
  end
end


def player_stats(player_name)
  player_stats = {}
  game_hash.each do |team, team_details|
    team_details[:players].each do |stats|
      if stats[:name] == player_name
        stats.delete(:name)
        player_stats = stats
      end
    end
  end
  player_stats
end

def big_shoe_rebounds
  biggest_shoe = 0 
  player_rebounds = 0 
  game_hash.values.each do |team_info|
    team_info[:players].each do |player|
      if player[:shoe] > biggest_shoe
        biggest_shoe = player[:shoe]
        player_rebounds = player[:rebounds]
      end
    end
  end
  return player_rebounds
end
