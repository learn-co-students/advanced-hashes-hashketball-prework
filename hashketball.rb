def game_hash
  {
  home: {
    team_name: "Brooklyn Nets",
    colors: ["Black","White"],
    players: {
      "Alan Anderson" => {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
      "Reggie Evans" => {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
      "Brook Lopez" => {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
      "Mason Plumlee" => {number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
      "Jason Terry" => {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
    }
  },
  away: {
    team_name: "Charlotte Hornets",
    colors: ["Turquoise","Purple"],
    players: {
      "Jeff Adrien" => {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
      "Bismak Biyombo" => {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
      "DeSagna Diop" => {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
      "Ben Gordon" => {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
      "Brendan Haywood" => {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
    }
  }
}
end

# def num_points_scored(player_name)
#   game_hash.each do |team, values|
#     values.each do |data, values|
#       if values.class == Hash
#         values.each do |player, scores|
#           if player == player_name
#             return scores[:points]
#           end
#         end
#       end
#     end
#   end
# end
#
# def shoe_size(player_name)
#   game_hash.each do |team, values|
#     values.each do |data, values|
#       if values.class == Hash
#         values.each do |player, scores|
#           if player == player_name
#             return scores[:shoe]
#           end
#         end
#       end
#     end
#   end
# end
#
# def player_stats(player_name)
#   game_hash.each do |team, values|
#     values.each do |data, values|
#       if values.class == Hash
#         values.each do |player, scores|
#           if player == player_name
#             return scores
#           end
#         end
#       end
#     end
#   end
# end
#
# def big_shoe_rebounds
#   largest_shoe = 0
#   largest_rebound = String.new
#   game_hash.each do |team, values|
#     values.each do |data, values|
#       if values.class == Hash
#         values.each do |player, scores|
#           if scores[:shoe] > largest_shoe
#             largest_shoe = scores[:shoe]
#             largest_rebound = scores[:rebounds]
#           end
#         end
#       end
#     end
#   end
#   largest_rebound
# end
#
# def team_names
#   game_hash.collect do |team, values|
#      values[:team_name]
#   end
# end
#
# def team_colors(team_arg)
#   game_hash.each do |team, values|
#     if values[:team_name] == team_arg
#       return values[:colors]
#     end
#   end
# end
#
# def player_numbers(team_arg)
#   output = []
#   game_hash.each do |team, values|
#     if values[:team_name] == team_arg
#       values.each do |data, values|
#         if values.class == Hash
#           output = values.collect do |player, scores|
#             scores[:number]
#           end
#         end
#       end
#     end
#   end
#   output
# end

# --Better solution--

# player helper method
def player_stats(player)
  game_hash.each do |key, data|
    if game_hash[key][:players].has_key?(player)
      return game_hash[key][:players][player]
    end
  end
end

def num_points_scored(player)
  player_stats(player)[:points]
end


def shoe_size(player)
  player_stats(player)[:shoe]
end


def big_shoe_rebounds
  largest_shoe = 0
  largest_rebound = 0
  game_hash.each do |team, values|
    game_hash[team][:players].each do |player, scores|
      if scores[:shoe] > largest_shoe
        largest_shoe = scores[:shoe]
        largest_rebound = scores[:rebounds]
      end
    end
  end
  largest_rebound
end

def team_names
  game_hash.collect do |team, values|
     values[:team_name]
  end
end

# team helper method
def find_team(team_arg)
  game_hash.each do |team, values|
    if game_hash[team][:team_name] == team_arg
      return game_hash[team]
    end
  end
end

def team_colors(team_arg)
  find_team(team_arg)[:colors]
end

def player_numbers(team_arg)
  find_team(team_arg)[:players].collect do |player, values|
    values[:number]
  end
end
