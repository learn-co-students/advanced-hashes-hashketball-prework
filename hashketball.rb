def game_hash
  {:home => {:team_name => "Brooklyn Nets", :colors => ["Black","White"],
  :players => {
    "Alan Anderson" => {:number => 0, :shoe => 16, :points => 22,
    :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1,:slam_dunks => 1},
    "Reggie Evans" => {:number => 30, :shoe => 14, :points => 12,
    :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12,:slam_dunks => 7},
    "Brook Lopez" => {:number => 11, :shoe => 17, :points => 17,
    :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1,:slam_dunks => 15},
    "Mason Plumlee" => {:number => 1, :shoe => 19, :points => 26,
    :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8,:slam_dunks => 5},
    "Jason Terry" => {:number => 31, :shoe => 15, :points => 19,
    :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11,:slam_dunks => 1}
    } },
  :away => {:team_name => "Charlotte Hornets", :colors => ["Turquoise","Purple"],
    :players => {
      "Jeff Adrien" => {:number => 4, :shoe => 18, :points => 10,
      :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7,:slam_dunks => 2},
      "Bismak Biyombo" => {:number => 0, :shoe => 16, :points => 12,
      :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15,:slam_dunks => 10},
      "DeSagna Diop" => {:number => 2, :shoe => 14, :points => 24,
      :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5,:slam_dunks => 5},
      "Ben Gordon" => {:number => 8, :shoe => 15, :points => 33,
      :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1,:slam_dunks => 0},
      "Brendan Haywood" => {:number => 33, :shoe => 15, :points => 6,
      :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5,:slam_dunks => 12}
      } }}
end

def num_points_scored(player_name)
  game_hash.each do |team,team_data|
    team_data[:players].each do |name,stats|
      if name == player_name
        return stats[:points]
      end
    end
  end
  return nil
end

def shoe_size(player_name)
  game_hash.each do |team,team_data|
    team_data[:players].each do |name,stats|
      if name == player_name
        return stats[:shoe]
      end
    end
  end
  return nil
end

def team_colors(team_name)
  game_hash.each do |team,team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  end
  return nil
end

def team_names
  game_hash.collect do |team,team_data|
    team_data[:team_name]
  end
end

def player_numbers(team_name)
  jersey_numbers = []
  game_hash.each do |team,team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each do |name,stats|
        jersey_numbers << stats[:number]
      end
    end
  end
  jersey_numbers
end

def player_stats(player_name)
  game_hash.each do |team,team_data|
    team_data[:players].each do |name,stats|
      if name == player_name
        return stats
      end
    end
  end
  return nil
end

def big_shoe_rebounds
  biggest_shoe_size = -1
  number_rebounds = -1
  game_hash.each do |team,team_data|
    team_data[:players].each do |name,stats|
      if stats[:shoe] > biggest_shoe_size
        biggest_shoe_size = stats[:shoe]
        number_rebounds = stats[:rebounds]
      end
    end
  end
  number_rebounds
end

def most_points_scored
  most_points = -1
  player = ""
  game_hash.each do |team,team_data|
    team_data[:players].each do |name,stats|
      if stats[:points] > most_points
        most_points = stats[:points]
        player = name
      end
    end
  end
  player
end

def winning_team
  most_points = -1
  team_name = ""
  game_hash.each do |team,team_data|
    num_points = 0
    team_data[:players].each do |name,stats|
      num_points += stats[:points]
    end
    if num_points > most_points
      most_points = num_points
      team_name = team_data[:team_name]
    end
  end
  team_name
end

def player_with_longest_name
  name_length = -1
  player_name = ""
  game_hash.each do |team,team_data|
    team_data[:players].each do |name,stats|
      if name.length > name_length
        name_length = name.length
        player_name = name
      end
    end
  end
  player_name
end

def long_name_steals_a_ton?
  number_steals = -1
  player_name = ""
  game_hash.each do |team,team_data|
    team_data[:players].each do |name,stats|
      if stats[:steals] > number_steals
        number_steals = stats[:steals]
        player_name = name
      end
    end
  end
  player_name == player_with_longest_name
end
