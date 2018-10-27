require "pry"

def game_hash

game_hash = {home: {
  team_name: "Brooklyn Nets",
  colors: ["Black", "White"],
  players: {"Alan Anderson" => {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1}, "Reggie Evans" => {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12,  blocks: 12, slam_dunks: 7}, "Brook Lopez" => {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3,  blocks: 1, slam_dunks: 15}, "Mason Plumlee" => {number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3,  blocks: 8, slam_dunks: 5}, "Jason Terry" => {number: 31 , shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4,  blocks: 11, slam_dunks: 1}}
},
away: {
  team_name: "Charlotte Hornets",
  colors: ["Turquoise", "Purple"],
  players: {"Jeff Adrien" => {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2,  blocks: 7, slam_dunks: 2}, "Bismak Biyombo" => {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7,  blocks: 15, slam_dunks: 10}, "DeSagna Diop" => {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4,  blocks: 5, slam_dunks: 5}, "Ben Gordon" => {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1,  blocks: 1, slam_dunks: 0},
  "Brendan Haywood" => {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22,  blocks: 5, slam_dunks: 12}}
  }}


end

def num_points_scored(player_name)
# merged_hash = game_hash[:home].merge(game_hash[:away])

#score = nil
if game_hash[:home][:players].include?(player_name)
  game_hash[:home][:players][player_name][:points]
elsif game_hash[:away][:players].include?(player_name)
  game_hash[:away][:players][player_name][:points]
end
# score = game_hash[:away][:players].fetch(player_name)

  # game_hash.each do |level_1k, level_1v|
  #
  #       if level_1v[:players].include?(player_name)
  #
  #           score = level_1v[:players][player_name][:points]

end

def shoe_size(player_name)

  if game_hash[:home][:players].include?(player_name)
    game_hash[:home][:players][player_name][:shoe]
  elsif game_hash[:away][:players].include?(player_name)
    game_hash[:away][:players][player_name][:shoe]
  end
end


def team_colors(team)
collect_colors = nil
  game_hash.collect do |team_place, data|
    data.collect do |data_keys, v|
      if v == team
    collect_colors = game_hash[team_place][:colors]


end
end
end
return collect_colors
end

def team_names
teams = []

  game_hash.map do |team_place, team_data|

     if team_data.include?(:team_name)
      teams.push(game_hash[team_place][:team_name])

  end
end
  teams
end

def player_numbers(team_name)

  team_numbers = []

  game_hash.map do |team_place, team_data|
    if game_hash[team_place][:team_name] == team_name
      team_data[:players].map do |team_players, team_stats|
          team_numbers.push(team_stats[:number])
end
end
end
team_numbers
end

def player_stats(player_name)
stats_hash = {}
  game_hash.each do |team_place, team_data|

    team_data[:players].each do |players, stats|


      if players == player_name

          stats_hash = game_hash[team_place][:players][players]

  end
end

end
stats_hash
end

def big_shoe_rebounds
shoes = []
hash_shoes = {}
hash_sorted = nil
largest_shoe = nil
rebounds_final = nil

   game_hash.each do |team_place, team_data|
    team_data[:players].each do |players, stats|
      hash_shoes[players] = stats[:shoe]

    hash_sorted = hash_shoes.sort_by { |k, v| v}
  largest_shoe = hash_sorted[-1]
          if players == largest_shoe[0]
     rebounds_final = game_hash[team_place][:players][largest_shoe[0]][:rebounds]


  end
end
end
return rebounds_final 
end









# team_colors("Brooklyn Nets")
