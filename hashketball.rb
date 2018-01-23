def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
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
      :players => {
        "Jeff Adrien" => {
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },
      "Bismak Biyombo" => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10
      },
      "DeSagna Diop" => {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },
      "Ben Gordon" => {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
      "Brendan Haywood" => {
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

def num_points_scored(name)
  game_hash.each do |team, info|
    if info[:players].keys.include?(name)
      return info[:players][name][:points]
    end
  end
  nil
end

def shoe_size(name)
  game_hash.each do |team, info|
    if info[:players].keys.include?(name)
      return info[:players][name][:shoe]
    end
  end
  nil
end

def team_colors(team)
  game_hash.each do |k, v|
    if v[:team_name] == team
      return v[:colors]
    end
  end
  nil
end

def team_names
  game_hash.map do |team, info|
    info[:team_name]
  end
end

def player_numbers(team)
  game_hash.each do |k, v|
    if v[:team_name] == team
      nums = []
      v[:players].each do |player, info|
        nums << info[:number]
      end
      return nums
    end
  end
  nil
end

def player_stats(name)
  game_hash.each do |team, info|
    if info[:players].keys.include?(name)
      return info[:players][name]
    end
  end
  nil
end

def big_shoe_rebounds
  big_shoe_size = nil
  rebounds = nil

  game_hash.each do |team, team_info|
    team_info[:players].each do |name, player_info|
      if big_shoe_size == nil || player_info[:shoe] > big_shoe_size
        big_shoe_size = player_info[:shoe]
        rebounds = player_info[:rebounds]
      end
    end
  end

  rebounds
end

def most_points_scored
  points_high = nil
  player = nil

  game_hash.each do |team, team_info|
    team_info[:players].each do |name, player_info|
      if points_high == nil || player_info[:points] > points_high
        points_high = player_info[:points]
        player = name
      end
    end
  end

  player
end

def winning_team
  teams_and_scores = {}
  game_hash.each do |team, team_info|
    total = 0
    team_info[:players].each do |player, player_info|
      total += player_info[:points]
    end
    teams_and_scores[team_info[:team_name]] = total
  end
  teams_and_scores.key(teams_and_scores.values.max)
end

def player_with_longest_name
  longest = nil

  game_hash.each do |team, team_info|
    team_info[:players].each do |name, player_info|
      if longest == nil || name.length > longest.length
        longest = name
      end
    end
  end
  longest
end

def long_name_steals_a_ton?
  longest_name = nil
  most_steals = nil
  stealer = nil

  game_hash.each do |team, team_info|
    team_info[:players].each do |name, player_info|
      if longest_name == nil || name.length > longest_name.length
        longest_name = name
      end
      if most_steals == nil || player_info[:steals] > most_steals
        most_steals = player_info[:steals]
        stealer = name
      end
    end
  end
  
  longest_name == stealer
end
