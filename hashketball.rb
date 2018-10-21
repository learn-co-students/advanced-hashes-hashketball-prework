def game_hash

    {:home => {
      :team_name => 'Brooklyn Nets',
      :colors => ['Black', 'White'],
      :players => {
        'Alan Anderson' => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1

        },
        'Reggie Evans' => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7

        },
        'Brook Lopez' => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15

        },
        'Mason Plumlee' => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5

        },
        'Jason Terry' => {
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
       :team_name => 'Charlotte Hornets',
      :colors => ['Turquoise', 'Purple'],
      :players => {
        'Jeff Adrien' => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2

        },
        'Bismak Biyombo' => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10

        },
        'DeSagna Diop' => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5

        },
        'Ben Gordon' => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0

        },
        'Brendan Haywood' => {
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
  game_hash.each do |teams, info|

      info.each do |team_facts_key, team_facts_values|
        if team_facts_values.class == Hash
          team_facts_values.each do |players_names, player_values|

            if players_names == player

              player_values.each do |player_info, info_number|
                if player_info == :points
                return info_number
                end
              end
            end
          end
        end
      end

    end

end

def shoe_size (player)
  game_hash.each do |teams, info|

      info.each do |team_facts_key, team_facts_values|
        if team_facts_values.class == Hash
          team_facts_values.each do |players_names, player_values|

            if players_names == player

              player_values.each do |player_info, info_number|
                if player_info == :shoe
                return info_number
                end
              end
            end
          end
        end
      end

  end

end

def team_colors (team_name)

  game_hash.each do |teams, info|
    info.each do |team_facts_key, team_facts_values|
    if team_facts_values == team_name
      game_hash[teams].each do |team_facts_key2, team_facts_values2|
        if team_facts_key2 == :colors
          return team_facts_values2
        end
      end

    end


    end

  end
end

def team_names

array = []

  game_hash.each do |teams, info|
    info.each do |team_facts_key, team_facts_values|
      if team_facts_key == :team_name
      array.push (team_facts_values)
      end
    end
  end
  array
end


def player_numbers (team_name)

  array = []

  game_hash.each do |teams, info|
    info.each do |team_facts_key, team_facts_values|
    if team_facts_values == team_name
      game_hash[teams].each do |team_facts_key2, team_facts_values2|

          if team_facts_values2.class == Hash
            team_facts_values2.each do |player_name, player_info|
              player_info.each do |info_key, info_numbers|
                if info_key == :number
                array << info_numbers
                end
              end

            end
          end
        end
      end

    end


    end
  array
end

def player_stats (player)

 game_hash.each do |teams, info|

      info.each do |team_facts_key, team_facts_values|
        if team_facts_values.class == Hash
          team_facts_values.each do |players_names, player_values|
            if players_names == player
              return player_values


            end
          end
        end
      end

    end

end

def big_shoe_rebounds
  big_shoe_teams = nil
  big_shoe_team_facts_key =nil 
  big_shoe_players_names =nil

  biggest_shoe = 0

  game_hash.each do |teams, info|
    info.each do |team_facts_key, team_facts_values|
      if team_facts_values.class == Hash
        team_facts_values.each do |players_names, player_values|
          player_values.each do |player_stats_key, player_stats_value|
            if player_stats_key == :shoe && player_stats_value > biggest_shoe
            biggest_shoe = player_stats_value

            big_shoe_teams = teams
            big_shoe_team_facts_key = team_facts_key
            big_shoe_players_names = players_names

            end
          end
        end

      end

    end


  end
game_hash[big_shoe_teams][big_shoe_team_facts_key][big_shoe_players_names][:rebounds]
end
