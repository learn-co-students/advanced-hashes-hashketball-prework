def home_team_name
  game_hash[:home][:team_name]
end

def get_all_players
  team_players_array = game_hash.values.map do |team_data|
    team_data[:players]
  end

  team_players_array.flatten
end

def get_data_from_player(player_name, data)
  all_players = get_all_players

  all_players.reduce(nil) do |result, player_data|
    if(player_data[:player_name] == player_name)
      result = player_data[data]
    end

    result
  end
end

def num_points_scored(player_name)
  get_data_from_player(player_name, :points)
end

def shoe_size(player_name)
  get_data_from_player(player_name, :shoe)
end

def get_team(team_name)
  game_hash.values.find do |team_data|
    team_data[:team_name] == team_name
  end
end

def team_colors(team_name)
  team = get_team(team_name)
  team[:colors]
end

def team_names
  game_hash.map do |location, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team_name)
  team = get_team(team_name)
  team[:players].map do |player_data|
    player_data[:number]
  end
end

def player_stats(player_name)
  players = get_all_players
  players.find do |player_data|
    player_data[:player_name] == player_name
  end
end

def big_shoe_rebounds
  players = get_all_players

  biggest_shoe = players.reduce do |result, player_data|
    if(!result)
      result = player_data
    end

    result
  end

  biggest_shoe[:rebounds]
end

puts team_names
