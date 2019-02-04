require 'pry'

def game_hash
{
  home: {
    team_name: "Brooklyn Nets",
    colors: ["Black", "White"],
    players: [
      {
        player_name: "Alan Anderson",
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1
      },{
        player_name: "Reggie Evans",
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7
      }, {
        player_name: "Brook Lopez",
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15
      }, {
        player_name: "Mason Plumlee",
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 12,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5
      },{
        player_name: "Jason Terry",
        number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1
      }
    ]
  },
  away:{
    team_name: "Charlotte Hornets",
    colors: ["Turquoise", "Purple"],
    players: [
      {
        player_name: "Jeff Adrien",
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2
      },{
        player_name: "Bismak Biyombo",
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 7,
        blocks: 15,
        slam_dunks: 10
      },{
        player_name: "DeSagna Diop",
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5
      },{
        player_name: "Ben Gordon",
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0
      },{
        player_name: "Brendan Haywood",
        number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals: 22,
        blocks: 5,
        slam_dunks: 12
      }
    ]
  }
}
end

#Iterate into the game_hash. key/val is 'location' (home/away) / 'attributes'
#(hash of team data). Then iterate into the attributes[:players] key. This key
#points to an array of hashes (each hash is a player's info), so 'category'
#represents each index, or hash, within our array. Check if the player_name
#submitted equals the player_name in the hash category with key [:player_name].
#If it does, return that player's :points
def num_points_scored(player_name)
  game_hash.each do |location, attributes|
    attributes[:players].each do |category|
      if category[:player_name] == player_name
        return category[:points]
      end
    end
  end
end

#same as method above, but return player's shoe size instead of points
def shoe_size(player_name)
  game_hash.each do |location, attributes|
    attributes[:players].each do |category|
      if category[:player_name] == player_name
        return category[:shoe]
      end
    end
  end
end

#Iterate into the game_hash and then check if the :team_name value is
#the same as the submitted team name. If it is, return the team colors.
def team_colors(team_name)
  game_hash.each do |location, attributes|
      if attributes[:team_name] == team_name
        return attributes[:colors]
      end
  end
end

#Iterate into the game_hash and return the team names
def team_names
  game_hash.map do |location, attributes|
      attributes[:team_name]
  end
end

#set an empty array to ultimately hold the player numbers
#Iterate into the game_hash. Check if the team name submitted equals
#the :team_name value. If it does, then iterate into the :players value
#which is an array of hashes. collect each player :number and push
#it into our array. Return the array at the end of our method.
def player_numbers(team_name)
player_numbers_arr = []
  game_hash.each do |location, attributes|
    if attributes[:team_name] == team_name
      attributes[:players].each do |category|
        numbers = category[:number]
        player_numbers_arr.push(numbers)
      end
    end
  end
  player_numbers_arr
end

#Below is a similar solution to above, but cut out a few lines by not storing
#the player number in a variable before pushing it onto the array.

#def player_numbers(team_name)
#player_numbers_arr = []
#  game_hash.each do |location, attributes|
#    if attributes[:team_name] == team_name
#      attributes[:players].each do |category|
#        player_numbers_arr << category[:number]
#      end
#    end
#  end
#  player_numbers_arr
#end

#Iterate into game_hash and then into the :players keys. If the player name
#submitted equals the :player_name key, then we are going to return the
#entire category (which is a hash of the player's info). Since the desired
#output is not supposed to include the player's name and we have this in our
#hash, we first delete this key/val and then return the hash.
def player_stats(player_name)
  game_hash.each do |location, attributes|
    attributes[:players].each do |category|
      if category[:player_name] == player_name
        category.delete(:player_name)
        return category
      end
    end
  end
end

#Below is a similar solution to above, but using .shift instead of .delete

#def player_stats(player_name)
#  game_hash.each do |location, attributes|
#    attributes[:players].each do |category|
#      if category[:player_name] == player_name
#        category.shift
#        return category
#      end
#    end
#  end
#end

#Assign a variable for the player shoe size and rebounds to use as "counters."
#Iterate inot game_hash and then into :players key. Check if the player's shoe
#size is greater than our current variable. If it is, then replace the value of
#our variable with that player's shoe size and then replace the rebounds variable
#with that player's rebounds. It will iterate through each player and compare
#ther shoe size to the variable and execute this. Then return the rebounds variable
#which should now contain the rebounds of the larges shoe size player.
def big_shoe_rebounds
max_shoe_player = 0
rebounds = 0
  game_hash.each do |location, attributes|
    attributes[:players].each do |category|
      if category[:shoe] > max_shoe_player
          max_shoe_player = category[:shoe]
          rebounds = category[:rebounds]
      end
    end
  end
  rebounds
end


#bonus questions

#same logic as big_shoe_rebounds method above. But check :points rather
#than shoe size, and return the player's name.
def most_points_scored
  max_points_player = 0
  max_player = ""
    game_hash.each do |location, attributes|
      attributes[:players].each do |category|
        if category[:points] > max_points_player
            max_points_player = category[:points]
            max_player = category[:player_name]
        end
      end
    end
    max_player
end

#set two variables for each team's score as our "counters".
#Iterate into the game_hash[:home][:players] level (this points to an array
#of hashes - each hash being a player's data). Add each player's :points
#to the appropriate place-holder variable. Do the same for the :away team.
#Then compare away_score and home_score to see which is highest and return
#the winning team.
def winning_team
  home_score = 0
  away_score = 0
  game_hash[:home][:players].each do |category|
    home_score += category[:points]
  end
  game_hash[:away][:players].each do |category|
    away_score += category[:points]
  end
(home_score > away_score ? game_hash[:home][:team_name] :
game_hash[:away][:team_name])
end

#Same logic as most_points_scored method and big_shoe_rebounds method.
#only difference is that we need to compare the name length to our variable
def player_with_longest_name
  longest_name = 0
  long_name_player = ""
    game_hash.each do |location, attributes|
      attributes[:players].each do |category|
        if category[:player_name].length > longest_name
            longest_name = category[:player_name].length
            long_name_player = category[:player_name]
        end
      end
    end
    long_name_player
end

#super bonus

#I split this into two methods, though it could be done in one.
#First method uses the same logic as our counter methods above to find
#our player with the most steals.
def player_with_most_steals
  most_steals = 0
  most_steals_player = 0
    game_hash.each do |location, attributes|
      attributes[:players].each do |category|
        if category[:steals] > most_steals
            most_steals = category[:steals]
            most_steals_player = category[:player_name]
        end
      end
    end
    most_steals_player
end

#The second methods checks if our player_with_most_steals method equals our
#player_with_longest_name method. If they equal, then return true.
#Else, return false. Accomplish this on one line with the ternary operator. 
def long_name_steals_a_ton?
(player_with_most_steals == player_with_longest_name ? true : false)
end

#binding.pry
