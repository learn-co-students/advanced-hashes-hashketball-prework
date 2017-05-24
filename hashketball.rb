require 'pry'
def game_hash

{
  :home => {
    :team_name => "Brooklyn Nets", :colors => ["Black", "White"],
    :players => {
      "Alan Anderson" =>
        {:number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
      "Reggie Evans" =>
        {:number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
      "Brook Lopez" =>
        {:number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
      "Mason Plumlee" =>
        {:number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
      "Jason Terry" =>
        {:number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}}
    },
  :away => {
    :team_name => "Charlotte Hornets", :colors => ["Turquoise", "Purple"],
    :players => {
      "Jeff Adrien" =>
        {:number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
      "Bismak Biyombo" =>
        {:number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10},
      "DeSagna Diop" =>
        {:number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
      "Ben Gordon" =>
        {:number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
      "Brendan Haywood" =>
      {:number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12}}
    }
}
end

#SOLVED
def num_points_scored(player_name)
  points = []
  game_hash.each do |location, data| #data=> :team_name, :colors, :players
    data[:players].each do |player, data_items| #filter only :players (hash)
      if player == "#{player_name}" #use arg to find particular player, control flow
        data_items.each do |k, v| #if above true, iterate through
          points << v if k == :points #find key, shovel value into array
        end
      end
    end
  end
  points.join.to_i #array --> string --> fixnum
end

#SOLVED
def shoe_size(player_name)
  feets = []
  game_hash.each do |location, data|
    data[:players].each do |player, data_item|
      if player == "#{player_name}"
        data_item.each do |k, v|
          feets << v if k == :shoe
        end
      end
    end
  end
  feets.join.to_i
end

#SOLVED
def team_colors(team_name) #string
  game_hash.each do |location, data|
    if data[:team_name] == "#{team_name}"
      return data[:colors]# WHY DO I HAVE TO WRITE RETURN????
#      binding.pry
    end
  end
end
#output array of team colors
#if convert hash to array, can access elements out of array
#.invert swaps k <=> v

#SOLVED
def team_names
  names = []
  game_hash.each do |location, data|
    names << data[:team_name]
  end
  names
end
#output array of team names


#SOLVED
def player_numbers(team_name)
  jersey_nums = []
  game_hash.each do |location, data|
    if data[:team_name] == "#{team_name}" #found match
      data[:players].each do |player, value|
        jersey_nums << value[:number]
      end
    end
  end
  jersey_nums
end
#returns array of jersey numbers for that team


#SOLVED
def player_stats(player_name)
  game_hash.each do |location, data|
    data[:players].each do |player, data_items|
      return data_items if player == "#{player_name}"
    end
  end
end
#returns hash of player stats


#SOLVED
def big_shoe_rebounds
  game_hash.values.each do |attribute|
    hash = attribute[:players]
    hash.values.each do |h|
      h.select { |k, v| k == :shoe }.sort.max
      return h[:rebounds]
    end
  end
end
=begin
-find the player with the largest shoe size
-return that player's number of rebounds
=end
