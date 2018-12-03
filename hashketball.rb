def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players =>
      {
        "Alan Anderson" =>
        {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" =>
        {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" =>
        {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" =>
        {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" =>
        {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players =>
      {
        "Jeff Adrien" =>
        {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" =>
        {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" =>
        {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" =>
        {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" =>
        {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(player)
  points = nil
  game_hash.each do |home_or_away, x|
    if game_hash[home_or_away][:players].key?(player)
      points = Integer(game_hash[home_or_away][:players][player][:points])
    end
  end

  points
end

def shoe_size(player)
  shoe = nil
  game_hash.each do |home_or_away, x|
    if game_hash[home_or_away][:players].key?(player)
      shoe = Integer(game_hash[home_or_away][:players][player][:shoe])
    end
  end

  shoe
end

def team_colors(team)
  colors = nil
  game_hash.each do |home_or_away, x|
    if game_hash[home_or_away][:team_name] == team
      colors = game_hash[home_or_away][:colors]
    end
  end

  colors
end

def team_names
  teams_array = []
  game_hash.each do |home_or_away, x|
    teams_array << game_hash[home_or_away][:team_name].to_s
  end

  teams_array
end

def player_numbers(team)
  numbers = []
  game_hash.each do |home_or_away, x|
    if game_hash[home_or_away][:team_name] == team
      game_hash[home_or_away][:players].each do |player, x|
        numbers <<
          game_hash[home_or_away][:players][player][:number]
      end
    end
  end

  numbers
end

def player_stats(name)
  stats = nil
  game_hash.each do |home_or_away, x|
    if game_hash[home_or_away][:players].key?(name)
      stats = game_hash[home_or_away][:players][name]
    end
  end

  stats
end

def big_shoe_rebounds
  shoe_array = []
  rebounds = nil
  game_hash[:home][:players].each do |a, b|
    shoe_array << [game_hash[:home][:players][a][:shoe], a]
  end

  game_hash[:away][:players].each do |a, b|
    shoe_array << [game_hash[:away][:players][a][:shoe], a]
  end

  shoe_array.sort
  your_guy = shoe_array[shoe_array.count - 1][1]

  game_hash.each do |home_or_away, x|
    if game_hash[home_or_away][:players].key?(your_guy)
      rebounds = game_hash[home_or_away][:players][your_guy][:rebounds]
    end
  end
  rebounds
end
