require "pry"
# This method contains and returns a nest hash
def game_hash

  game_hash = {

    :home => {

    :team_name => 'Brooklyn Nets',
    :colors => ['Black', 'White'],
    :players => [
      {player_name: 'Alan Anderson', number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
      {player_name: 'Reggie Evans', number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
      {player_name: 'Brook Lopez', number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
      {player_name: 'Mason Plumlee', number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
      {player_name: 'Jason Terry', number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      ]
    },

  :away => {

    :team_name => 'Charlotte Hornets',
    :colors => ['Turquoise', 'Purple'],
    :players => [
      {player_name: 'Jeff Adrien', number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
      {player_name: 'Bismak Biyombo', number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
      {player_name: 'DeSagna Diop', number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
      {player_name: 'Ben Gordon', number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
      {player_name: 'Brendan Haywood', number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
      ]
    }
  }
end

# def good_practices
#   game_hash.each do |location, team_data|
#     #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#     binding.pry
#       team_data.each do |attribute, data|
#         #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#         binding.pry
#
#         #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
#         data.each do |data_item|
#             binding.pry
#       end
#     end
#   end
# end
#
# good_practices

# should take in an argument of a player's name and returns the number of points scored for that player
def num_points_scored(players_name)

  game_hash.values.each do |team|
    team[:players].each do |player|
      return player[:points] if player.has_value?(players_name)
    end
  end

end

# should take in an argument of a player's name and returns the shoe size for that player.
def shoe_size(players_name)

  game_hash.values.each do |team|
    team[:players].each do |player|
      return player[:shoe] if player.has_value?(players_name)
    end
  end
end

# should take in an argument of the team name and returns an array of that teams colors
def team_colors(team_name)
  game_hash.values.each do |team|
    return team[:colors] if team.has_value?(team_name)
  end
end

# should operate on the game hash to return an array of the team names.
def team_names
  team_array = []
  game_hash.values.each do |team|
    team_array << team[:team_name]
  end
  team_array
end


# should take in an argument of a team name and returns an array of the jersey number's for that team
def player_numbers(team_name)
  array_of_numbers = []
  game_hash.values.each do |team|
    team[:players].each do |player|
      array_of_numbers << player[:number] if team.has_value?(team_name)
    end
  end
  array_of_numbers
end

#should take in an argument of a player's name and returns a hash of that player's stats
def player_stats(player_name)
  stats_hash = {}
  game_hash.values.each do |team|
    team[:players].each do |player|
      if player.has_value?(player_name)
         player.delete(:player_name)
         return player
      end
    end
  end
  stats_hash
end

# should return the number of rebounds associated with the player that has the largest shoe size.
def big_shoe_rebounds
  name = ""
  largest_shoe = nil
  rebounds = nil

  game_hash.values.each do |team|
    team[:players].each do |key, value|
      if largest_shoe == nil
        name = key[:player_name]
        largest_shoe = key[:shoe]
        rebounds = key[:rebounds]
      elsif key[:shoe] > largest_shoe
        name = key[:player_name]
        largest_shoe = key[:shoe]
        rebounds = key[:rebounds]
      end
    end
  end
  rebounds
end
