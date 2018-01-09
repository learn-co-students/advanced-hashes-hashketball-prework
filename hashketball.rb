# Write your code here!
require "pry"
def game_hash
  hash = {
    home:{
      team_name:["Brooklyn Nets"],
      colors:["Black","White"],
      players:{
        "Alan Anderson"=>{
          number:0,
          shoe:16,
          points:22,
          rebounds:12,
          assists:12,
          steals:3,
          blocks:1,
          slam_dunks:1
        },
        "Reggie Evans"=>{
          number:30,
          shoe:14,
          points:12,
          rebounds:12,
          assists:12,
          steals:12,
          blocks:12,
          slam_dunks:7
        },
        "Brook Lopez"=>{
          number:11,
          shoe:17,
          points:17,
          rebounds:19,
          assists:10,
          steals:3,
          blocks:1,
          slam_dunks:15
        },
        "Mason Plumlee"=>{
          number:1,
          shoe:19,
          points:26,
          rebounds:12,
          assists:6,
          steals:3,
          blocks:8,
          slam_dunks:5
        },
        "Jason Terry"=>{
          number:31,
          shoe:15,
          points:19,
          rebounds:2,
          assists:2,
          steals:4,
          blocks:11,
          slam_dunks:1
        }
      }
    },
    away:{
      team_name:["Charlotte Hornets"],
      colors:["Turquoise","Purple"],
      players:{
        "Jeff Adrien"=>{
          number:4,
          shoe:18,
          points:10,
          rebounds:1,
          assists:1,
          steals:2,
          blocks:7,
          slam_dunks:2
        },
        "Bismak Biyombo"=>{
          number:0,
          shoe:16,
          points:12,
          rebounds:4,
          assists:7,
          steals:7,
          blocks:15,
          slam_dunks:10
        },
        "DeSagna Diop"=>{
          number:2,
          shoe:14,
          points:24,
          rebounds:12,
          assists:12,
          steals:4,
          blocks:5,
          slam_dunks:5
        },
        "Ben Gordon"=>{
          number:8,
          shoe:15,
          points:33,
          rebounds:3,
          assists:2,
          steals:1,
          blocks:1,
          slam_dunks:0
        },
        "Brendan Haywood"=>{
          number:33,
          shoe:15,
          points:6,
          rebounds:12,
          assists:12,
          steals:22,
          blocks:5,
          slam_dunks:12
        }
      }
    }
  }
end


def num_points_scored(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      data.each do |player, stats|
        if player === player_name
          return game_hash[location][attribute][player][:points]
        end
      end
    end
  end
end
# puts num_points_scored("Brendan Haywood")

def shoe_size(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      data.each do |player, stats|
        if player === player_name
          return game_hash[location][attribute][player][:shoe]
        end
      end
    end
  end
end
# puts shoe_size("Brendan Haywood")


def team_colors(team_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      data.each do |value|
        if value == team_name
          return game_hash[location][:colors]
        end
      end
    end
  end
end

# puts team_colors("Charlotte Hornets")

def team_names
  team = []
  game_hash.each do |location, team_data|
    team.push(game_hash[location][:team_name][0])
  end
  team
end

def player_numbers(team_name)
  point_array = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data[0] == team_name
        game_hash[location][:players].each do |value|
          # puts value[0]
          point_array.push(game_hash[location][:players][value[0]][:number])
        end
      end
    end
  end
  point_array
end

# puts player_numbers("Brooklyn Nets")
# game_hash[:home][:players].each do |value|
#   # puts value[0]
#   puts game_hash[:home][:players][value[0]][:number]
# end
# puts player_numbers("Charlotte Hornets")


def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      data.each do |player, stats|
        if player == player_name
          return stats
        end
      end
    end
  end
end

# player_stats("Ben Gordon")

def big_shoe_rebounds
  rebound_points = nil
  shoe_sizes = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, value|
      if attribute == :players
        value.each do |player, stats|
          stats.each do |stat, val|
            if stat == :shoe
              shoe_sizes.push(val)
            end
          end
        end
      end
    end
  end
  largest_shoe = shoe_sizes.max

  game_hash.each do |location, team_data|
    team_data.each do |attribute, value|
      if attribute == :players
        value.each do |player, stats|
          stats.each do |stat, val|
            if stat == :shoe
              if val == largest_shoe
                rebound_points = game_hash[location][attribute][player][:rebounds]
              end
            end
          end
        end
      end
    end
  end
  rebound_points
end

# puts big_shoe_rebounds


def most_points_scored
  player_with_most_points = nil
  all_points = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, value|
      if attribute == :players
        value.each do |player, stats|
          stats.each do |stat, val|
            if stat == :points
              all_points.push(val)
            end
          end
        end
      end
    end
  end
  most_points = all_points.max

  game_hash.each do |location, team_data|
    team_data.each do |attribute, value|
      if attribute == :players
        value.each do |player, stats|
          stats.each do |stat, val|
            if stat == :points
              if val == most_points
                player_with_most_points = player
              end
            end
          end
        end
      end
    end
  end
  player_with_most_points
end

# puts most_points_scored

def winning_team
  home_team_name = nil
  home_team = 0

  away_team_name = nil
  away_team = 0

  game_hash.each do |location, team_data|
    if location == :home
      team_data.each do |attribute, value|
        if attribute == :players
          value.each do |player, stats|
            stats.each do |stat, val|
              if stat == :points
                home_team_name = game_hash[location][:team_name][0]
                home_team += val
              end
            end
          end
        end
      end
    end
  end

  game_hash.each do |location, team_data|
    if location == :away
      team_data.each do |attribute, value|
        if attribute == :players
          value.each do |player, stats|
            stats.each do |stat, val|
              if stat == :points
                away_team_name = game_hash[location][:team_name][0]
                away_team += val
              end
            end
          end
        end
      end
    end
  end

  home_team > away_team ? home_team_name : away_team_name
end
puts winning_team
