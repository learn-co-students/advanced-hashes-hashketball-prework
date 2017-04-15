# Write your code here!

require 'pry'

def game_hash
  hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
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
      colors: ["Turquoise", "Purple"],
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


def num_points_scored(player_name)
  points = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == player_name
            stats.each do |stat, value|
              if stat == :points
                points = value
              end
            end
          end
        end
      end
    end
  end
  points
end



def shoe_size(player_name)
  size = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == player_name
          stats.each do |stat, value|
            if stat == :shoe
              size = value
            end
          end
        end
      end
    end
  end
end
size
end


def team_colors(team)
  colors = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      team_data.each do |attribute, data|
        if attribute == :colors
          colors = data
        end
      end
    end
  end
  colors
end


def team_names
  teams = []
  game_hash.each do |location, team_data|
    teams << team_data[:team_name]
  end
  teams
end


def player_numbers(team)
  jersey_numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |player, stats|
            stats.each do |stat, value|
              if stat == :number
                jersey_numbers << value
              end
            end
          end
        end
      end
    end
  end
  jersey_numbers
end

def player_stats(player_name)
  output = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == player_name
          stats.each do |stat, value|
            output[stat] = value
          end
        end
      end
    end
  end
end
output
end

def big_shoe_rebounds
  big_shoe = 0
  rebound_total = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          stats.each do |stat, value|
            if stat == :shoe && value > big_shoe
              big_shoe = value
            end
          end
        end
      end
    end
  end
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if stats[:shoe] == big_shoe
          stats.each do |stat, value|
            if stat == :rebounds
              rebound_total = value
            end
          end
        end
      end
    end
  end
end
rebound_total
end

def most_points_scored
  most_points = 0
  top_scorer = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          stats.each do |stat, value|
            if stat == :points && value > most_points
              most_points = value
            end
          end
        end
      end
    end
  end
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if stats[:points] == most_points
            top_scorer = player
          end
        end
      end
    end
  end
  top_scorer
end

def winning_team
  team1_points = 0
  team2_points = 0
  team1 = game_hash[:home][:team_name]
  team2 = game_hash[:away][:team_name]
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team1
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |player, stats|
            team1_points = team1_points + stats[:points]
          end
        end
      end
    elsif team_data[:team_name] == team2
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |player, stats|
            team2_points = team2_points + stats[:points]
          end
        end
      end
    end
  end
  if team1_points > team2_points
    team1
  elsif team2_points > team1_points
    team2
  else
    "tie"
  end
end

def player_with_longest_name
  long_name = 0
  long_name_player = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player.length > long_name
            long_name = player.length
          end
          if long_name == player.length
            long_name_player = player
          end
        end
      end
    end
  end
  long_name_player
end

def long_name_steals_a_ton?
  player_with_longest_name
  high_steals = 0
  high_steals_player = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          stats.each do |stat, value|
            if stat == :steals && value > high_steals
              high_steals = value
            end
          end
          if stats[:steals] == high_steals
            high_steals_player = player
        end
      end
    end
  end
end
  player_with_longest_name == high_steals_player
end
