


def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => { number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
        "Reggie Evans" => { number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
        "Brook Lopez" => { number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
        "Mason Plumlee" => { number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
        "Jason Terry" => { number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => { number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
        "Bismak Biyombo" => { number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
        "DeSagna Diop" => { number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
        "Ben Gordon" => { number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
        "Brendan Haywood" => { number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
        }
      }
  }
end

def num_points_scored(player_name)
  points_scored = nil
  game_hash.each do |key, value|
    value.each do |key_two, value_two|
      if key_two == :players
        value_two.each do |name, stat_hash|
          if name == player_name
            points_scored = stat_hash[:points]
          end
        end
      end
    end
  end
  points_scored
end

def shoe_size(player_name)
  shoe_size = nil
  game_hash.each do |key, value|
    value.each do |key_two, value_two|
      if key_two == :players
        value_two.each do |name, stat_hash|
          if name == player_name
            shoe_size = stat_hash[:shoe]
          end
        end
      end
    end
  end
  shoe_size
end

def team_colors(team)
  team_colors = []
  game_hash.each do |key, value|
      if value[:team_name] == team
        team_colors = value[:colors]
      end
    end
    team_colors
end

def team_names
  teams = []
  game_hash.each do |key, value|
    teams << value[:team_name]
  end
  teams
end

def player_numbers(team)
  team_numbers = []
  game_hash.each do |key, value|
    if value[:team_name] == team
      game_hash[key][:players].each do |name, stats|
        team_numbers << stats[:number]
      end
    end
  end
  team_numbers
end

def player_stats(player)
  return_stats = {}
  game_hash.each do |key, value|
    value.each do |key_two, value_two|
      if key_two == :players
        value_two.each do |player_name, stat_hash|
          if player_name == player
            return_stats = stat_hash
          end
        end
      end
    end
  end
  return_stats
end

def big_shoe_rebounds
  shoe_sizes = []
  rebounds = nil
  game_hash.each do |home_away, team_hash|
    team_hash.each do |team_stat, stat_value|
      if team_stat == :players
        stat_value.each do |player_name, player_stats|
          shoe_sizes << player_stats[:shoe]
        end
      end
    end
  end
  shoe_sizes = shoe_sizes.sort.reverse
  game_hash.each do |home_away, team_hash|
    team_hash.each do |team_stat, stat_value|
      if team_stat == :players
        stat_value.each do |player_name, player_stats|
          if player_stats[:shoe] == shoe_sizes[0]
            rebounds = player_stats[:rebounds]
          end
        end
      end
    end
  end
  rebounds
end


######################## BONUS QUESTIONS ###########################

def most_points_scored
  score_hash = {}
  game_hash.each do |home_away, team_hash|
    team_hash.each do |team_stat, stat_value|
      if team_stat == :players
        stat_value.each do |player_name, player_stats|
          score_hash[player_name] = player_stats[:points]
        end
      end
    end
  end
  winner = score_hash.max_by {|name, score| score}
  winner[0]
end

def winning_team
  home_score = 0
  away_score = 0
  game_hash[:home][:players].each do |name, player_stats|
    home_score += player_stats[:points]
  end
  game_hash[:away][:players].each do |name, player_stats|
    away_score += player_stats[:points]
  end
  if home_score > away_score
    game_hash[:home][:team_name]
  elsif home_score < away_score
    game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  home_names = game_hash[:home][:players].keys
  away_names = game_hash[:away][:players].keys
  all_names = home_names.concat(away_names)
  longest_name = ""
  for counter in 0...all_names.length
    if all_names[counter].length > longest_name.length
      longest_name = all_names[counter]
    end
  end
  longest_name
end

############################ SUPER BONUS ###########################

def long_name_steals_a_ton?
  all_player_steals = []
  longest_name_steals = 0
  game_hash.each do |home_away, team_hash|
    team_hash.each do |team_stat, stat_value|
      if team_stat == :players
        stat_value.each do |player_name, player_stats|
          all_player_steals << player_stats[:steals]
          if player_name == player_with_longest_name
            longest_name_steals = player_stats[:steals]
          end
        end
      end
    end
  end
  steals_sorted = all_player_steals.sort.reverse
  if longest_name_steals == steals_sorted[0]
    true
  else
    false
  end
end
