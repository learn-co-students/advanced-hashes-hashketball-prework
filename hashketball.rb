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
        }, {
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
        }, {
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
    away: {
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
        }, {
          player_name: "Bismak Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        }, {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        }, {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        }, {
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

def home_team_name
  game_hash[:home][:team_name]
end

def get_data_from_player(player_name, data)
  all_players = get_all_players

  all_players.reduce(nil) do |result, player_data|
    if(player_data[:player_name] == player_name)
      result = player_data[data]
    end

    result
  end
end

def helper(player_name, stat)
  game_hash.each do |home_away, details|
    details[:players].each do |player_hash|
      if player_hash[:player_name] == player_name
        return player_hash[stat]
      end
    end
  end
end

def num_points_scored(player_name)
  #game_hash.each do |home_away, details|
   # details[:players].each do |player_hash|
    #  if player_hash[:player_name] == #player_name
       # return player_hash[:points]
      #end
    #end
  #end
  
  return helper(player_name, :points)
end

def shoe_size(player_name)
  return helper(player_name, :shoe)
end

def team_colors(team_name)
  game_hash.each do |home_away, details|
    if details[:team_name] == team_name
      return details[:colors]
    end
  end
end

def team_names
  return [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(team_name)
  number_array = []
  
  game_hash.each do |home_away, details|
    details[:players].each do |player_hash|
      if details[:team_name] == team_name
        number_array.push(player_hash[:number])
      end
    end
  end
  
  return number_array
end

def player_stats(player_name)
  player_details = {}
  
  game_hash.each do |team, details|
    details[:players].each do |stats|
      if stats[:player_name] == player_name
        stats.delete(:player_name)
        player_details = stats
      end
    end
  end
  
  return player_details
  
  # return {number: helper(player_name, :number), shoe: helper(player_name, :shoe, points: helper(player_name, :points), rebounds: helper(player_name, :rebounds), assists: helper(player_name, :assists), steals: helper(player_name, :steals), blocks: helper(player_name, :blocks), slam_dunks: helper(player_name, :slam_dunks))}
end

def big_shoe_rebounds
  largest_shoe = 0
  largest_shoe_player = "tbd"
  
  game_hash.each do |home_away, details|
    details[:players].each do |player_hash|
      if player_hash[:shoe] > largest_shoe
        largest_shoe_player = player_hash[:player_name]
      end
    end
  end
  
  return helper(largest_shoe_player, :rebounds)
end

def most_points_scored
  most_points = 0
  most_points_player = ""
  
  game_hash.each do |home_away, details|
    binding.pry
    details[:players].each do |player_hash|
      if player_hash[:points] > most_points
        most_points_player = player_hash[:player_name]
        most_points = player_hash[:points]
      end
    end
  end
   
   most_points_player
end


def winning_team
  team_1 = team_names[0]
  team_1_points = 0
  team_2 = team_names[1]
  team_2_points = 0
  
  game_hash.each do |home_away, details|
    details[:players].each do |player_hash|
      if details[:team_name] == team_1
        team_1_points += player_hash[:points]
      else
        team_2_points += player_hash[:points]
      end
    end
  end
  
  if team_1_points > team_2_points
    return team_1
  elsif team_2_points > team_1_points
    return team_2
  else
    return "It's a tie!"
  end
  
end

def player_with_longest_name
  longest_name = ""
  
  game_hash.each do |home_away, details|
    details[:players].each do |player_hash|
      if player_hash[:player_name].length > longest_name.length
        longest_name = player_hash[:player_name]
      end
    end
  end
  
  return longest_name
end

def long_name_steals_a_ton?
  most_steals_count = 0
  most_steals_name = ""
  
  game_hash.each do |home_away, details|
    details[:players].each do |player_hash|
      if player_hash[:steals] > most_steals_count
        most_steals_name = player_hash[:player_name]
        most_steals_count = player_hash[:steals]
      end
    end
  end
  
  most_steals_name == player_with_longest_name
  
end

puts team_names
