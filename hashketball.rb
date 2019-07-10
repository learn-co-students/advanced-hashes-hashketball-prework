require 'pry'

def game_hash
  nested_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => { number:0, shoe:16, points:22, rebounds:12, assists:12, steals:3, blocks: 1, slam_dunks:1
        },
        "Reggie Evans" => { number:30, shoe:14, points:12, rebounds:12, assists:12, steals:12, blocks: 12, slam_dunks:7
        },
        "Brook Lopez"  => { number:11, shoe:17, points:17, rebounds:19, assists:10, steals:3, blocks: 1, slam_dunks:15
        },
        "Mason Plumlee"  => { number:1, shoe:19, points:26, rebounds:11, assists:6, steals:3, blocks: 8, slam_dunks:5
        },
        "Jason Terry"  => { number:31, shoe:15, points:19, rebounds:2, assists:2, steals:4, blocks: 11, slam_dunks:1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" =>  {number:4, shoe:18, points:10, rebounds:1, assists:1, steals:2, blocks:7, slam_dunks:2
        }, 
        "Bismack Biyombo" =>  {number:0, shoe:16, points:12, rebounds:4, assists:7, steals:22, blocks:15, slam_dunks:10
        }, 
        "DeSagna Diop" =>  {number:2, shoe:14, points:24, rebounds:12, assists:12, steals:4, blocks:5, slam_dunks:5
        }, 
        "Ben Gordon" => {number:8, shoe:15, points:33, rebounds:3, assists:2, steals:1, blocks:1, slam_dunks:0
        }, 
        "Kemba Walker" => {number:33, shoe:15, points:6, rebounds:12, assists:12, steals:7, blocks:5, slam_dunks:12
        }

      }
    }

  }
end


def num_points_scored(play_name)
  outval = ""
  game_hash.keys.each do |k|
    if game_hash[k][:players].keys.include?(play_name)
      outval = game_hash[k][:players][play_name][:points]
    end
  end
  outval
end

def shoe_size(play_name)
  outval = ""
  game_hash.keys.each do |k|
    if game_hash[k][:players].keys.include?(play_name)
      outval = game_hash[k][:players][play_name][:shoe]
    end
  end
  outval
end


def team_colors(team_name)
  outval = []
  game_hash.keys.each do |k|
    if game_hash[k][:team_name] == team_name
      outval = game_hash[k][:colors]
    end
  end
  outval
end

def team_names
  outval = []
  game_hash.keys.each do |k|
    outval << game_hash[k][:team_name]  
  end
  outval
end

def player_numbers(team_name)
  outval = []
  game_hash.keys.each do |k|
    if game_hash[k][:team_name] == team_name
      game_hash[k][:players].keys.each do |p|
         outval << game_hash[k][:players][p][:number]
      end
    end 
  end
  outval
end


def player_stats(play_name)
  outval = {}
  game_hash.keys.each do |k|
    if game_hash[k][:players].keys.include?(play_name)
      outval = game_hash[k][:players][play_name]
    end
  end
  outval
end

def big_shoe_rebounds
  comparison = ""
  largest = ""
  #GET NAME OF PLAYER WITH LARGEST SHOES
  game_hash.keys.each do |k|
    game_hash[k][:players].each do |pname,hash|
      if comparison == ""
        comparison = hash[:shoe]
        largest = pname
      else
        if hash[:shoe] > comparison
          comparison = hash[:shoe]
          largest = pname
        end
      end
    end
  end
  # Known largest player = largest
 
  #Returns number of Rebounds from 'largest'
  player_stats(largest)[:rebounds]

end


def most_points_scored
  comparison = ""
  largest = ""
  #GET NAME OF PLAYER WITH most points
  game_hash.keys.each do |k|
    game_hash[k][:players].each do |pname,hash|
      if comparison == ""
        comparison = hash[:points]
        largest = pname
      else
        if hash[:points] > comparison
          comparison = hash[:points]
          largest = pname
        end
      end
    end
  end
  largest
end

def winning_team
  outval = []
  hometeam_arr = []
  awayteam_arr = []
  game_hash[:home][:players].keys.each do | plyrs|
    hometeam_arr << game_hash[:home][:players][plyrs][:points]
  end
  game_hash[:away][:players].keys.each do | plyrs|
    awayteam_arr << game_hash[:away][:players][plyrs][:points]
  end
  if hometeam_arr.sum > awayteam_arr.sum
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  comparison = ""
  longest = ""
  #GET NAME OF PLAYER WITH most points
  game_hash.keys.each do |k|
    game_hash[k][:players].keys.each do |names|
      if comparison == ""
        comparison = names.length
        longest = names
      else
        if names.length > comparison
          comparison = names.length
          longest = names
        end
      end
    end
  end
  longest
end


def long_name_steals_a_ton?
  #Get name of player with the most steals
  def player_with_most_steals
    comparison = ""
    most_steals = ""
    #GET NAME OF PLAYER WITH most points
    game_hash.keys.each do |k|
      game_hash[k][:players].each do |pname,hash|
        if comparison == ""
          comparison = hash[:steals]
          most_steals = pname
        else
          if hash[:steals] > comparison
            comparison = hash[:steals]
            most_steals = pname
          end
        end
      end
    end
  most_steals 
  end
  if player_with_most_steals == player_with_longest_name
    true
  else
    false
  end

end
