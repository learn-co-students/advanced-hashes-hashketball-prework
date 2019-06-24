def game_hash
    {
    home:
      {team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        "Alan Anderson" => {number: 0 , shoe: 16 , points: 22 , rebounds: 12 , assists: 12 , steals: 3 , blocks: 1 , slam_dunks: 1 },
        "Reggie Evans" => {number: 30 , shoe: 14 , points: 12, rebounds: 12 , assists: 12 , steals: 12 , blocks: 12 , slam_dunks: 7 },
        "Brook Lopez" => {number: 11 , shoe: 17 , points: 17 , rebounds: 19 , assists: 10 , steals: 3 , blocks: 1 , slam_dunks: 15 },
        "Mason Plumlee" => {number: 1 , shoe: 19 , points: 26 , rebounds: 11 , assists: 6 , steals: 3 , blocks: 8 , slam_dunks: 5 },
        "Jason Terry" => {number: 31 , shoe: 15 , points: 19 , rebounds: 2, assists: 2 , steals: 4 , blocks: 11 , slam_dunks: 1 },
      ]},
    away:
      {team_name: "Charlotte Hornets",
        colors: ["Turquoise", "Purple"],
        players: [
          "Jeff Adrien" => {number: 4 , shoe: 18 , points: 10 , rebounds: 1 , assists: 1 , steals: 2 , blocks: 7 , slam_dunks: 2 },
          "Bismack Biyombo" => {number: 0 , shoe: 16 , points: 12 , rebounds: 4 , assists: 7 , steals: 22 , blocks: 15 , slam_dunks: 10 },
          "DeSagna Diop" => {number: 2 , shoe: 14 , points: 24 , rebounds: 12 , assists: 12 , steals: 4 , blocks: 5 , slam_dunks: 5 },
          "Ben Gordon" => {number: 8 , shoe: 15 , points: 33 , rebounds: 3 , assists: 2 , steals: 1 , blocks: 1 , slam_dunks: 0 },
          "Kemba Walker" => {number: 33 , shoe: 15 , points: 6 , rebounds: 12 , assists: 12 , steals: 7 , blocks: 5 , slam_dunks: 12 },
      ]}
  }
end

def num_points_scored(player_name)
  game_hash.each do |location, info_array|
    info_array.each do |info, data|
      if info == :players
      data.each do |name|
        if name.include?(player_name)
          name.each do |p_name, p_info|
            if p_name == player_name
              p_info.each do |player_info, stat|
                if player_info == :points
                  points_scored = stat
                  return points_scored
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, info_array|
    info_array.each do |info, data|
      if info == :players
      data.each do |name|
        if name.include?(player_name)
          name.each do |p_name, p_info|
            if p_name == player_name
              p_info.each do |player_info, stat|
                if player_info == :shoe
                  player_shoe_size = stat
                  return player_shoe_size
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end


def team_colors(team_name)
  game_hash.each do |location, info_array|
    info_array.each do |info, data|
      if data.include?("#{team_name}")
      info_array.each do |info2, data2|
        if info2 == :colors
          return data2
          end
        end
      end
    end
  end
end

def team_names
  teams = []
  teams << game_hash[:home][:team_name]
  teams << game_hash[:away][:team_name]
  return teams
end

def player_numbers(team_name)
  team_numbers = []
  game_hash.each do |location, info_array|
    info_array.each do |info, data|
      if data.include?("#{team_name}")
      info_array.each do |info2, data2|
        if info2 == :players
          data2.each do |info_array|
            info_array.each do |p_name, stat|
              stat.each do |p_info, p_stat|
                if p_info == :number
                  team_numbers << p_stat
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  return team_numbers
end

def player_stats(player_name)
  game_hash.each do |location, info_array|
    info_array.each do |info, data|
      if info == :players
        data.each do |info_array|
          info_array.each do |player, stats|
          if player == "#{player_name}"
            return stats
            end
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  player_shoesize = {}
  bigfoot = []
  game_hash.each do |location, info_array|
    info_array[:players].each do |info|
      info.each do |name, data|
      player_shoesize[name] = data[:shoe]
      bigfoot = player_shoesize.key(player_shoesize.values.max)
      end
      info.each do |name, data|
        if bigfoot == name
          data.each do |p_info, p_stat|
            if p_info == :rebounds
              return p_stat
            end
          end
        end
      end
    end
  end
end

def most_points_scored
  points_scored = {}
  most_points = []
  game_hash.each do |location, info_array|
    info_array[:players].each do |info|
      info.each do |name, data|
      points_scored[name] = data[:points]
      most_points = points_scored.key(points_scored.values.max)
      end
    end
  end
  return most_points
end

def winning_team
  player_points = {}
  home_total = []
  away_total = []
  home_score = {}
  away_score = {}
  both_teams = {}
  winner = []
  loc = {}
  game_hash.each do |location, info_array|
    info_array[:players].each do |info|
      info.each do |name, data_array|
        data_array.each do |data, stat|
          if data == :points
            if location == :home
              home_total << stat
            elsif location == :away
              away_total << stat
            end
          end
        end
      end
    end
  end
  game_hash.each do |location, info_array|
  if location == :home
    loc = game_hash[location][:team_name]
    home_score[loc] = home_total.sum
    both_teams = home_score.merge away_score
  elsif location == :away
    loc = game_hash[location][:team_name]
    away_score[loc] = away_total.sum
    both_teams = home_score.merge away_score
  end
  winner = both_teams.key(both_teams.values.max)
end
return winner
end

def player_with_longest_name
  names = []
  longest_word = ''
  game_hash.each do |location, info_array|
    info_array[:players].each do |info|
      info.each do |name, data|
        names << name
        names.each do |word|
          longest_word = word if longest_word.length < word.length
        end
      end
    end
  end
  return longest_word
end

def long_name_steals_a_ton?
  steals = {}
  most_steals = []
  game_hash.each do |location, info_array|
    info_array[:players].each do |info|
      info.each do |name, data|
      steals[name] = data[:steals]
      most_steals = steals.key(steals.values.max)
      end
    end
  end
  most_steals == player_with_longest_name
end
