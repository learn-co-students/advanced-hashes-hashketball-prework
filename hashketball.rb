require 'pry'

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
  game_hash.each do |team, team_data|
    team_data[:players].each do |name, stats|
      if name == player_name
        return stats[:points]
     end
    end
  end
end


def shoe_size(player_name)
  game_hash.each do |team, team_data|
    team_data[:players].each do |name, stats|
      if player_name == name
        return stats[:shoe]
      end
    end
  end
end


def team_colors(team_name)
  game_hash.each do |team, team_data|
    #binding.pry
    if team_data[:team_name] == team_name
      #binding.pry
      return team_data[:colors]
    end
  end
end


def team_names
  a_names = []
  game_hash.each do |team, data|
    a_names << data[:team_name]
    end
  a_names
end
    

def player_numbers(team)
  #returns an array of the player numbers of given team (team)
  jerseys = []
  game_hash.each do |location, data|
    if data[:team_name] == team
      data[:players].each do |player, stats|
        jerseys << stats[:number]
      end
    end
  end
  jerseys
end


def player_stats(player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      # binding.pry
      if name == player
        return stats
      end
    end
  end
end


def big_shoe_rebounds
  # returns rebounds for player with biggest shoe size
  shoes = []
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      shoes << stats[:shoe]
      shoes.max
      if stats[:shoe] == shoes.max
        return stats[:rebounds]
      end
    end
  end
end

# bonus

def most_points_scored
  points_scored = []
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      points_scored << stats[:points]
    end
  end
  points_scored.max
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if points_scored.max == stats[:points]
        return name
      end
    end
  end
end


def winning_team
  scores = []
  game_hash.each do |location, team_data|
    list = Array.new
    team_data[:players].each do |name, stats|
      list << stats[:points]
      if list.length == 5
        scores << list.inject(0) { |sum, x| sum + x }
      end
    end
  end
  scores
  game_hash.each do |location, team_data|
    list_compare = Array.new
    team_data[:players].each do |name, stats|
      list_compare << stats[:points]
      new_thing = list_compare.inject(0) { |sum, x| sum + x }
      if new_thing == scores.max
        return team_data[:team_name]
      end
    end
  end
end


def player_with_longest_name
  name_lengths = []
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      name_lengths << name.length
    end
  end
  name_lengths
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if name.length == name_lengths.max
        return name
      end
    end
  end
end


def long_name_steals_a_ton?
  # return true if player with longest name had the most steals
  stolen = []
  king_thief = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      stolen << stats[:steals]
    end
  end
  stolen.max
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if stats[:steals] == stolen.max
        king_thief << name
      end
    end
  end
  if king_thief == player_with_longest_name
    true
  end
end

