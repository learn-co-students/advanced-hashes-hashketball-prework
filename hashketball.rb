def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
        :player_name => "Alan Anderson",
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
        :player_name => "Reggie Evans",
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
        :player_name => "Brook Lopez",
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
        :player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
        },
        {
        :player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
        },
      ],
  },
    :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [
      {
        :player_name => "Jeff Adrien",
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
        :player_name => "Bismack Biyombo",
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
        :player_name => "DeSagna Diop",
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
        :player_name => "Ben Gordon",
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
        :player_name => "Kemba Walker",
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

def num_points_scored(name_of_player)
    game_hash.each do |court_status, team_info|
        team_info[:players].each do |player|
            if player[:player_name] == name_of_player
                return player[:points]
            end
        end
    end
end

def shoe_size(player_name)
  game_hash.each do |court_status, team_info|
      team_info[:players].each do |player|
          if player[:player_name] == player_name
              return player[:shoe]
          end
      end
  end
end

def team_colors(team_brand)
  game_hash.each do |court_status, team_info|
    return team_info[:colors] if team_info[:team_name] == team_brand
  end
end

def team_names
  game_hash.collect do |court_status, team_info|
    team_info[:team_name]
  end
end

def player_numbers(team_brand)
  game_hash.each do |court_status, team_info|
    if team_info[:team_name] == team_brand
      return team_info[:players].collect do |player|
        player[:number]
      end
    end
  end
end

def player_stats(name_of_player)
  result = {}
  game_hash.each do |visitation_status,team_stats|
    team_stats[:players].each do |player|
      if player[:player_name] == name_of_player
        player.each do |key, value|
        result[key] = value unless key == :player_name
        end
      end
    end
  end
  result
end

def big_shoe_rebounds
    max = 0
    rebounds = 0
    game_hash.each do |visitation_status,team_stats|
        team_stats[:players].each do |player|
            if max == nil || player[:shoe] > max
                max = player[:shoe]
                rebounds = player[:rebounds]
            end
        end
    end
    rebounds
end

def most_points_scored
    max = nil
    player_max_points = nil
    game_hash.each do |visitation_status,team_stats|
        team_stats[:players].each do |player|
            if max == nil || player[:points] > max
                max = player[:points]
                player_max_points = player[:player_name]
            end
        end
    end
    player_max_points
end

  def winning_team
    most_points = 0
    home_team = 0
    away_team = 0

    game_hash.each do |location, team_data|
      team_data[:players].each do |stats|
          if location == game_hash[:home]
            home_team += stats[:points]
          else location == game_hash[:away]
            away_team += stats[:points]
          end

           if home_team > away_team
            return team_data[:team_name]
          else
            return team_data[:team_name]
          end
        end
      end
    end

  def player_with_longest_name
    max = nil
    player_name_max = nil
      game_hash.each do |visitation_status,team_stats|
          team_stats[:players].each do |player|
              if max == nil || player[:player_name].length > max
                  max = player[:player_name].length
                  player_name_max = player[:player_name]
                end
            end
        end
        player_name_max
    end

def long_name_steals_a_ton?
  max = nil
  player_max_steals = nil
  game_hash.each do |visitation_status,team_stats|
    team_stats[:players].each do |player|
      if max == nil || player[:steals] > max
        max = player[:steals]
        player_max_steals = player[:player_name]
      end
    end
  end
  player_max_steals ==player_with_longest_name
end
