require 'pry'

def game_hash

  {
  # location =>
  home: {
    # team data / type =>
    team_name: "Brooklyn Nets", colors: ["Black", "White"], players: {
          # data / info =>
          "Alan Anderson" =>
            #
            { number: 0, shoe: 16, points: 22, rebounds: 12,
            assists: 12, steals: 3, blocks: 1, slam_dunks: 1 },
          "Reggie Evans" => { number: 30, shoe: 14, points: 12, rebounds: 12,
                assists: 12, steals: 12, blocks: 12, slam_dunks: 7 },
          "Brook Lopez" => { number: 11, shoe: 17, points: 17, rebounds: 19,
                    assists: 10, steals: 3, blocks: 1, slam_dunks: 15 },
          "Mason Plumlee" => { number: 1, shoe: 19, points: 26, rebounds: 12,
                    assists: 6, steals: 3, blocks: 8, slam_dunks: 5 },
          "Jason Terry" => { number: 31, shoe: 15, points: 19, rebounds: 2,
                    assists: 2, steals: 4, blocks: 11, slam_dunks: 1 } } },

  away: {
    team_name: "Charlotte Hornets", colors: ["Turquoise", "Purple"], players: {
      "Jeff Adrien" => { number: 4, shoe: 18, points: 10, rebounds: 1,
        assists: 1, steals: 2, blocks: 7, slam_dunks: 2 } ,
      "Bismak Biyombo" => { number: 0, shoe: 16, points: 12, rebounds: 4,
            assists: 7, steals: 7, blocks: 15, slam_dunks: 10 } ,
      "DeSagna Diop" => { number: 2, shoe: 14, points: 24, rebounds: 12,
                assists: 12, steals: 4, blocks: 5, slam_dunks: 5 } ,
      "Ben Gordon" => { number: 8, shoe: 15, points: 33, rebounds: 3,
                assists: 2, steals: 1, blocks: 1, slam_dunks: 0 },
      "Brendan Haywood" => { number: 33, shoe: 15, points: 6, rebounds: 12,
                assists: 12, steals: 22, blocks: 5, slam_dunks: 12 } } },
  }

end

def num_points_scored(name)
  game_hash.each do |team, team_data|
    team_data[:players].each do |player, data|
      return data[:points] if player == name
    end
  end
end

def shoe_size(name)
  game_hash.each do |team, team_data|
    team_data[:players].each do |player, data|
      return data[:shoe] if player == name
    end
  end
end

def team_colors(name)
  game_hash.each do |team, team_data|
    return team_data[:colors] if team_data[:team_name] == name
  end
end

def team_names
    game_hash.map { |team, team_data| team_data[:team_name] }
end

def player_numbers(name)
  game_hash.each do |team, team_data|
    if team_data[:team_name] == name
        return team_data[:players].map { |player, data| data[:number] }
    end
  end
end

def player_stats(name)
  game_hash.each do |team, team_data|
    team_data[:players].each do |player, data|
      return data if player == name
    end
  end
end

def big_shoe_rebounds
  rebounds, shoe = 0, 0
  game_hash.each do |team, team_data|
    team_data[:players].each do |player, data|
      rebounds, shoe = data[:rebounds], data[:shoe] if data[:shoe] > shoe
    end
  end
  rebounds
end

def most_points_scored
  most, name = 0, ""
  game_hash.each do |team, team_data|
    team_data[:players].each do |player, data|
      most, name = data[:points], player if data[:points] > most
    end
  end
  name
end

def winning_team
  t1, t2 = 0, 0
  game_hash.each do |team, team_data|
    team_data[:players].each do |player, data|
      team == :home ? t1 += data[:points] : t2 += data[:points]
    end
  end
  t1 > t2 ? game_hash[:home][:team_name] : :game_hash[:away][:team_name]
end

def player_with_longest_name
  longest = ""
  game_hash.each do |team, team_data|
    team_data[:players].each do |player, data|
      longest = player if player.size > longest.size
    end
  end
  longest
end

def long_name_steals_a_ton?
  steals, name = 0, ""
  game_hash.each do |team, team_data|
    team_data[:players].each do |player, data|
      steals, name = data[:steals], player if data[:steals] > steals
    end
  end
  name == player_with_longest_name
end
