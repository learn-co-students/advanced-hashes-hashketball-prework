# Write your code here!
require "pry"
def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry
 
        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end

def game_hash
game_hash = {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [
      {player_name: 'Alan Anderson', number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
      {player_name: 'Reggie Evans', number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
      {player_name: 'Brook Lopez', number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
      {player_name: 'Mason Plumlee', number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
      {player_name: 'Jason Terry', number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
    ]
    },
   :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
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

def num_points_scored(player_name)
game_hash.each do |team, team_data|
team_data[:players].each do |player|
if player[:player_name] == player_name
return player[:points]
end
end
end
end

def shoe_size(player_name)
game_hash.each do |team, team_data|
team_data[:players].each do |player|
if player[:player_name] == player_name
return player[:shoe]
end
end
end
end

def team_colors(team_name)
  game_hash.each do |team, team_data|
  if team_data[:team_name] == team_name
  return team_data[:colors]
  end
end
end

def team_names()
	team_names_array = []
	game_hash.each { |location, team_data| team_names_array.push(team_data[:team_name]) }
	return team_names_array
end

	def player_numbers(team_name)
	jerseys_num = []
	game_hash.each do |location, team_data| 
		if team_data[:team_name] == team_name
			team_data[:players].each {|a| jerseys_num.push(a[:number]) }
		end
	end
	return jerseys_num
end

def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |statistics| 
      if statistics[:player_name] == player_name
				stat_hash = statistics
				stat_hash.shift
				return stat_hash
			end
		end
	end
end


def big_shoe_rebounds
  biggest_shoe = 0 
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      shoe_size = player [:shoe]
      if shoe_size > biggest_shoe 
        biggest_shoe = shoe_size
        rebounds = player[:rebounds]
      end
    end
  end
  rebounds
end

#question: can i use push shoe size into an array and sort to find biggest shoe size?
#def big_shoe_rebounds
  #shoe_size_array = []
  #game_hash.each do |team, team_data|
    #team_data[:players].each do |player|
   # shoe_size_array.push(player[:shoe])
    # shoe_size_array.sort
    #largest_shoe = shoe_size_array[0]
  #game_hash.each do |team, team_data|
 # team_data[:players].each do |player|
 # if player[:player_name] == largest_shoe
 # return player[:rebounds]

  
      