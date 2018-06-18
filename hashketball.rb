def game_hash
  {
    home: {
      team_name: 'Brooklyn Nets',
      colors: ['Black', 'White'],
      players: {
        'Alan Anderson' => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        'Reggie Evans' => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        'Brook Lopez' => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        'Mason Plumlee' => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        'Jason Terry' => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: 'Charlotte Hornets',
      colors: ['Turquoise', 'Purple'],
      players: {
        'Jeff Adrien' => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        'Bismak Biyombo' => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        'DeSagna Diop' => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        'Ben Gordon' => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        'Brendan Haywood' => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(player_name)
  num_points = nil

  game_hash.each do |location, team_data|

    team_data.each do |attribute, data|

      if data.respond_to?(:each)
        data.each do |name, stat|

          if name == player_name
            num_points = game_hash[location][attribute][name][:points]
          end
        end
      end
    end
  end
  num_points
end

def shoe_size(player_name)
  size = nil
  game_hash.each do |location, team_data|

    team_data.each do |attribute, data|

      if data.respond_to?(:each)
        data.each do |name, stat|

          if name == player_name
            size = game_hash[location][attribute][name][:shoe]
          end
        end
      end
    end
  end
  size
end

def team_colors(team_name)
  colors = nil
  game_hash.each do |location, team_data|

    team_data.each do |attribute, data|
      if data == team_name
        colors = game_hash[location][:colors]
      end
    end
  end
  colors
end

def team_names
  teams = []
  game_hash.each do |location, team_data|
    teams << game_hash[location][:team_name]
  end
  teams
end

def player_numbers(team_name)
  numbers = []

  game_hash.each do |location, team_data|

    team_data.each do |attribute, data|
      if data == team_name

        game_hash[location][:players].each do |name, stat|
          numbers << game_hash[location][:players][name][:number]
        end
      end
    end
  end
  numbers
end

def player_stats(player_name)
  stats = nil
  game_hash.each do |location, team_data|

    team_data.each do |attribute, data|

      if data.respond_to?(:each)
        data.each do |name, stat|

          if name == player_name
            stats = stat
          end
        end
      end
    end
  end
  stats
end

def big_shoe_rebounds
  largest_shoe_size = 0
  rebounds = 0

  game_hash.each do |location, team_data|

    team_data.each do |attribute, data|

      if data.respond_to?(:each)
        data.each do |name, stat|

          if stat.respond_to?(:each)
            stat.each do |category, int|

              if largest_shoe_size == 0
                largest_shoe_size = game_hash[location][attribute][name][:shoe]
                rebounds = game_hash[location][attribute][name][:rebounds]
              else
                if game_hash[location][attribute][name][:shoe] > largest_shoe_size
                  largest_shoe_size = game_hash[location][attribute][name][:shoe]
                  rebounds = game_hash[location][attribute][name][:rebounds]
                end
              end
            end
          end
        end
      end
    end
  end
  rebounds
end

def most_points_scored
  most_points = 0
  player = nil

  game_hash.each do |location, team_data|

    team_data.each do |attribute, data|

      if data.respond_to?(:each)
        data.each do |name, stat|

          if stat.respond_to?(:each)
            stat.each do |category, int|

              if most_points == 0
                most_points = num_points_scored(name)
                player = name
              else
                if num_points_scored(name) > most_points
                  most_points = num_points_scored(name)
                  player = name
                end
              end
            end
          end
        end
      end
    end
  end
  player
end

def winning_team
  teams = team_names
  home_team = nil # will be an array with home team's player names
  away_team = nil # will be an array with away team's player names
  home_points = 0
  away_points = 0

  game_hash.each do |location, team_data|

    team_data.each do |attribute, data|
      if data == teams[0]
        home_team = game_hash[location][:players].keys
      elsif data == teams[1]
        away_team = game_hash[location][:players].keys
      end
    end
  end

  home_team.each do |player|
    home_points += num_points_scored(player)
  end

  away_team.each do |player|
    away_points += num_points_scored(player)
  end

  if home_points > away_points
    teams[0]
  else
    teams[1]
  end
end

def player_with_longest_name
  player_names = []
  name_length = 0
  longest_name = ''

  game_hash.each do |location, team_data|

    team_data.each do |attribute, data|
      player_names << game_hash[location][:players].keys
    end
  end

  player_names.flatten.each do |name|
    if name.size > name_length
      name_length = name.size
      longest_name = name
    end
  end

  longest_name
end

def long_name_steals_a_ton?
  player_names = []
  most_steals = 0
  best_thief = ''

  game_hash.each do |location, team_data|

    team_data.each do |attribute, data|
      player_names << game_hash[location][:players].keys
    end
  end

  player_names.flatten.each do |name|
    if player_stats(name)[:steals] > most_steals
      most_steals = player_stats(name)[:steals]
      best_thief = name
    end
  end
  best_thief == player_with_longest_name
end
