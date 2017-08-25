$game_hash = {
  :home => {
    :team_name => "Brooklyn Nets" ,
    :players => {
      "Alan Anderson" => {
          :number => 0 ,
          :shoe => 16 ,
          :points => 22 ,
          :rebounds => 12  ,
          :assists  => 12 ,
          :steals => 3 ,
          :blocks => 1 ,
          :slam_dunks => 1
      },
      "Reggie Evans" => {
        :number => 30 ,
        :shoe => 14 ,
        :points => 12 ,
        :rebounds => 12 ,
        :assists  => 12 ,
        :steals => 12 ,
        :blocks => 12 ,
        :slam_dunks => 7
      },
      "Brook Lopez" => {
        :number => 11 ,
        :shoe => 17 ,
        :points => 17 ,
        :rebounds => 19 ,
        :assists  => 10 ,
        :steals => 3 ,
        :blocks => 1 ,
        :slam_dunks => 15
      },
      "Mason Plumlee" => {
        :number => 1 ,
        :shoe => 19 ,
        :points => 26 ,
        :rebounds => 12 ,
        :assists  => 6 ,
        :steals => 3 ,
        :blocks => 8 ,
        :slam_dunks => 5
      },
      "Jason Terry" => {
        :number => 31 ,
        :shoe => 15 ,
        :points => 19 ,
        :rebounds => 2 ,
        :assists  => 2 ,
        :steals => 4 ,
        :blocks => 11 ,
        :slam_dunks => 1
      }
    },
    :colors => ["Black", "White"]
  },
  :away => {
    :team_name => "Charlotte Hornets" ,
    :players => {
      "Jeff Adrien" => {
          :number => 4 ,
          :shoe => 18 ,
          :points => 10 ,
          :rebounds => 1  ,
          :assists  => 1 ,
          :steals => 2 ,
          :blocks => 7 ,
          :slam_dunks => 2
      },
      "Bismak Biyombo" => {
        :number => 0 ,
        :shoe => 16 ,
        :points => 12 ,
        :rebounds => 4 ,
        :assists  => 7 ,
        :steals => 7 ,
        :blocks => 15 ,
        :slam_dunks => 10
      },
      "DeSagna Diop" => {
        :number => 2 ,
        :shoe => 14 ,
        :points => 24 ,
        :rebounds => 12 ,
        :assists  => 12 ,
        :steals => 4 ,
        :blocks => 5 ,
        :slam_dunks => 5
      },
      "Ben Gordon" => {
        :number => 8 ,
        :shoe => 15 ,
        :points => 33 ,
        :rebounds => 3 ,
        :assists  => 2 ,
        :steals => 1 ,
        :blocks => 1 ,
        :slam_dunks => 0
      },
      "Brendan Haywood" => {
        :number => 33 ,
        :shoe => 15 ,
        :points => 6 ,
        :rebounds => 12 ,
        :assists  => 12 ,
        :steals => 22 ,
        :blocks => 5 ,
        :slam_dunks => 12
      }
    },
    :colors => ["Turquoise", "Purple"]
  }
}


def get_player_stats(name)

  all_player_hash = $game_hash[:home][:players].merge($game_hash[:away][:players])


  all_player_hash.each_pair { |player, stats|
    if (name == player)
      return stats
    end
  }


  raise Exception.new("player does not exist")
end

def num_points_scored(name)
  return get_player_stats(name, )[:points]
end

def shoe_size(name)
  return get_player_stats(name, )[:shoe]
end

def get_team_stats(team_name)
  if ($game_hash[:home][:team_name] == team_name)
    return $game_hash[:home]
  elsif ($game_hash[:away][:team_name] == team_name)
    return $game_hash[:away]
  else
    raise Exception.new("team name does not exist")
  end
end

def team_colors(team_name)
  return get_team_stats(team_name, )[:colors]
end

def player_numbers(team_name)
  player_numbers = []

  team_stats = get_team_stats(team_name, )
  team_stats[:players].each_pair { |player, stats|
    player_numbers.push(stats[:number])
  }

  return player_numbers
end

def player_stats(name)
  return get_player_stats(name, )
end

def big_shoe_rebounds

  all_player_hash = $game_hash[:home][:players].merge($game_hash[:away][:players])

  biggest_foot_stats = {:shoe => 0}
  all_player_hash.each_pair { |player, stats|
    if (stats[:shoe] > biggest_foot_stats[:shoe])
      biggest_foot_stats = stats
    end
  }
  return biggest_foot_stats[:rebounds]
end

def most_points_scored

  all_player_hash = $game_hash[:home][:players].merge($game_hash[:away][:players])
  most_points = 0
  greatest_scorer = nil
  all_player_hash.each_pair { |player, stats|
    if (stats[:points] > most_points)
      most_points = stats[:points]
      greatest_scorer = player
    end
  }
  return greatest_scorer
end

def team_names
  return [
    $game_hash[:home][:team_name],
    $game_hash[:away][:team_name]
  ]
end
