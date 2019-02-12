# Write your code here!
require 'Pry'

def game_hash
  top_level = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson": {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
        "Reggie Evans": {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
        "Brook Lopez": {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
        "Mason Plumlee": {number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
        "Jason Terry": {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien": {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
        "Bismak Biyombo": {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
        "DeSagna Diop": {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
        "Ben Gordon": {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
        "Brendan Haywood": {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
      }
    }
  }
  return top_level
end

def separate_data_with_name(target_name, target)
  # game_hash.each do |location, team_data|
  #   team_data.each do |attribute, team_data|
  #     if attribute == :players
  #       team_data.each do |name, data|
  #         if name.to_s == target_name
  #           target = data[target]
  #         end
  #       end
  #     end
  #   end
  # end
  # return target
  player_stats(target_name)[target]
end

def players_separate_datas(target)
  target_hash = {}

  game_hash.each do |location, team_data|
    team_data.each do |attribute, team_data|
      if attribute == :players
        team_data.each do |name, data|
          target_hash[name] = data[target]
        end
      end
    end
  end
  return target_hash
end

def num_points_scored(player_name)
  return point = separate_data_with_name(player_name, :points)
end

def shoe_size(player_name)
  return shoe_size_info = separate_data_with_name(player_name, :shoe)
end

def team_colors(name)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == name
      team_data.each do |attribute, team_data|
        if attribute == :colors
          return team_data
        end
      end
    end
  end
end

def team_names
  game_hash.collect do |location, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team_name)
  jersey_num = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data.each do |attribute, team_data|
        if attribute == :players
          team_data.each do |name, data|
            jersey_num << data[:number]
          end
        end
      end
    end
  end
  return jersey_num
end

def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, team_data|
      if attribute == :players
        team_data.each do |name, data|
          if name.to_s == player_name
            # binding.pry
            return data
          end
        end
      end
    end
  end
end
puts player_stats("Alan Anderson")

def big_shoe_rebounds
  shoe_hash = players_separate_datas(:shoe)
  # largest_shoe = shoe_hash.group_by{|k, v| v}.max_by{|k, v| k}.last.to_h
  # largest_shoe_name = largest_shoe.keys[0].to_s
  largest_shoe_name = shoe_hash.max_by{|k, v| v}[0].to_s
  separate_data_with_name(largest_shoe_name, :rebounds)
end

def most_points_scored
  # players_points = players_separate_datas(:points)
  # most_pointer = players_points.group_by{|k, v| v}.max_by{|k, v| k}.last.to_h.keys[0].to_s
  # most_pointer = players_points.max_by{|k, v| v}[0].to_s
  players_separate_datas(:points).max_by{|k, v| v}[0].to_s
end

def winning_team
  home_team = 0
  away_team = 0
  home_name = ""
  away_name = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, team_data|
      if attribute == :team_name
        if location == :home
          home_name << team_data
        elsif location == :away
          away_name << team_data
        end
      end
      if attribute == :players
        team_data.each do |name, data|
          if location == :home
            home_team = home_team + data[:points]
          elsif location == :away
            away_team = away_team + data[:points]
          end
        end
      end
    end
  end
  if home_team > away_team
    return home_name
  elsif home_team < away_team
    return away_team
  else
    return "Tie"
  end
end

def player_with_longest_name
  longest_name_hash = {}

  game_hash.each do |location, team_data|
    team_data.each do |attribute, team_data|
      if attribute == :players
        team_data.each do |name, data|
          longest_name_hash[name] = name.to_s.length
        end
      end
    end
  end
  # longest_name = longest_name_hash.group_by{|k, v| v}.max_by{|k, v| k}.last.to_h.keys[0].to_s
  longest_name = longest_name_hash.max_by{|k, v| v}[0].to_s
end

def long_name_steals_a_ton?
  longest_name = player_with_longest_name
  best_stealer = players_separate_datas(:steals).max_by{|k, v| v}[0].to_s

  longest_name == best_stealer
end
