require "pry"

def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
          :name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        {
          :name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        {
          :name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        {
          :name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        {
          :name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {
          :name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        {
          :name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        {
          :name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        {
          :name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        {
          :name => "Kemba Walker",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      ]
    }
  }
end

def num_points_scored (name)
  game_hash.each do |team, info|
    game_hash[team][:players].each do |player|
      return player[:points] if player[:name] == name
    end
  end
end

def shoe_size (name)
  game_hash.each do |team, info|
    game_hash[team][:players].each do |player|
      return player[:shoe] if player[:name] == name
    end
  end
end

def team_colors (name)
  game_hash.each do |team, info|
    return info[:colors] if info[:team_name] == name
  end
end

def team_names
  ar = []
  game_hash.each do |team, info|
    ar.push(info[:team_name])
  end
  return ar
end

def player_numbers (team_str)
  ar = []
  game_hash.each do |team, info|
    game_hash[team][:players].each do |player|
      ar.push(player[:number]) if info[:team_name] == team_str
    end
  end
  return ar
end

def player_stats (name)
    game_hash.each do |team, info|
      game_hash[team][:players].each do |player|
        if player[:name] == name
          player.delete(:name)
          return player
        end
      end
    end
end

def big_shoe_rebounds
  max_shoe = 0
  big_player = {}
  game_hash.each do |team, info|
    game_hash[team][:players].each do |player|
       if player[:shoe] > max_shoe
         max_shoe = player[:shoe];
         big_player = player
       end
    end
  end
  return big_player[:rebounds]
end
def most_points_scored
  max_points = 0
  good_player = {}
  game_hash.each do |team, info|
    game_hash[team][:players].each do |player|
       if player[:points] > max_points
         max_points = player[:points];
         good_player = player
       end
    end
  end
  return good_player[:name]
end

def winning_team

  win = []
  winner = ""

  game_hash.each do |team, info|
      team_points = 0
      game_hash[team][:players].each do |player|
         team_points += player[:points];
       end
       win.push({:name => info[:team_name], :total => team_points})
    end

    max_points = 0
    win.each do |team|
      if team[:total] > max_points
        max_points = team[:total]
        winner = team[:name]
      end
    end
  return winner
end

def player_with_longest_name
  long_name = ""
  max_name = 0
  game_hash.each do |team, info|
    game_hash[team][:players].each do |player|
       if player[:name].length > max_name
         max_name = player[:name].length;
         long_name = player[:name]
       end
    end
  end
  return long_name
end

def long_name_steals_a_ton?
  long_name = player_with_longest_name
  player = player_stats(long_name)

  max_steals = 0
  game_hash.each do |team, info|
    game_hash[team][:players].each do |player|
       if player[:steals] > max_steals
         max_steals = player[:steals];
       end
    end
  end

  return true if player[:steals] == max_steals
end
