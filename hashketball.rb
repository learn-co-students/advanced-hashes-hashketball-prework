# Write your code here!
require "pry"

def game_hash

  game_stats = {
    home:{
      team_name: "Brooklyn Nets",
      colors:["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away:{
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }

  }
end


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

def num_points_scored(name)
  game_stats = game_hash
  if game_stats[:home][:players].keys.member?(name)
    game_stats[:home][:players][name][:points]
  elsif game_stats[:away][:players].keys.member?(name)
    game_stats[:away][:players][name][:points]
  else
    puts "Not a player"
  end
end

def shoe_size(name)
  game_stats = game_hash
  if game_stats[:home][:players].keys.member?(name)
    game_stats[:home][:players][name][:shoe]
  elsif game_stats[:away][:players].keys.member?(name)
    game_stats[:away][:players][name][:shoe]
  else
    puts "Not a player"
  end
end

def team_colors(team_name)
  game_stats = game_hash
  if game_stats[:home][:team_name] == team_name
    game_stats[:home][:colors]
  elsif game_stats[:away][:team_name] == team_name
    game_stats[:away][:colors]
  else
    puts "Not a team"
  end
end

def team_names
  game_stats = game_hash
  game_stats.collect {|side, att_hash| att_hash[:team_name]}
end

def player_numbers(team_name)
  game_stats = game_hash
  if game_stats[:home][:team_name] == team_name
    game_stats[:home][:players].collect {|player,stats| stats[:number]}
  elsif game_stats[:away][:team_name] == team_name
    game_stats[:away][:players].collect {|player,stats| stats[:number]}
  else
    puts "Not a team"
  end
end

def player_stats(name)
  game_stats = game_hash
  if game_stats[:home][:players].keys.member?(name)
    game_stats[:home][:players][name]
  elsif game_stats[:away][:players].keys.member?(name)
    game_stats[:away][:players][name]
  else
    puts "Not a player"
  end
end

def big_shoe_rebounds
  game_stats = game_hash
  player = "None"
  shoe_size = 0
  team = :None
  game_stats[:home][:players].each {|name,stats|
    if stats[:shoe] > shoe_size
      player = name
      shoe_size = stats[:shoe]
      team = :home
    end

  }
  game_stats[:away][:players].each {|name,stats|
    if stats[:shoe] > shoe_size
      player = name
      shoe_size = stats[:shoe]
      team = :away
    end

  }
  game_stats[team][:players][player][:rebounds]
end

def most_points
  game_stats = game_hash
  most_pts = 0
  game_stats[:home][:players].each {|name,stats|
    if stats[:points] > most_pts
      most_pts = stats[:points]
    end

  }
  game_stats[:away][:players].each {|name,stats|
    if stats[:points] > most_pts
      most_pts = stats[:points]
    end

  }
  most_pts
end

def winning_team
  game_stats = game_hash
  home = 0
  away = 0
  game_stats[:home][:players].each {|name,stats| home += stats[:points]}
  game_stats[:away][:players].each {|name,stats| away += stats[:points]}
  if home > away
    game_stats[:home][:team_name]
  elsif away > home
    game_stats[:away][:team_name]
  else
    puts "Tie game (not possible in NBA)"
  end
end

def player_with_longest_name
  game_stats = game_hash
  longest_name = ""
  game_stats[:home][:players].each {|name,stats| longest_name = name if name.length > longest_name.length}
  game_stats[:away][:players].each {|name,stats| longest_name = name if name.length > longest_name.length}
  longest_name
end

def longest_name_steals_a_ton?
  game_stats = game_hash
  most_steals = 0
  player_name = "None"
  game_stats[:home][:players].each {|name,stats|
    if stats[:steals] > most_steals
      most_steals = stats[:points]
      player_name = name
    end

  }
  game_stats[:away][:players].each {|name,stats|
    if stats[:steals] > most_steals
      most_steals = stats[:points]
      player_name = name
    end

  }
  if player_name == player_with_longest_name
    True
  else
    False
  end
end
