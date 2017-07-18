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

def get_all_players
  teams = game_hash.values.collect do |team|
    team[:players]
  end
  teams[0].merge(teams[1])
end

def num_points_scored(player_name)
  get_all_players[player_name][:points]
end

def shoe_size(player_name)
  game_hash.each do |team, team_data|
    if team_data[:players].key?(player_name)
      return team_data[:players][player_name][:shoe]
    end
  end
end

def team_colors(team_name)
  game_hash.each do |team, team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  end
end

def team_names
  game_hash.collect do |team, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team_name)
  game_hash.each do |team, team_data|
    if team_data[:team_name] == team_name
      return team_data[:players].collect do |name, stats|
        stats[:number]
      end
    end
  end
end

def player_stats(player_name)
  game_hash.each do |team, team_data|
    if team_data[:players].key?(player_name)
      return team_data[:players][player_name]
    end
  end
end

#
# def big_shoe_rebounds
#   players = []
#   game_hash.collect do |team, team_data|
#     players += team_data[:players].sort_by do | players, value|
#       value[:shoe] && value[:rebounds]
#     end
#   end
#   players.last.last[:rebounds]
# end


def big_shoe_rebounds
  shoe_sizes = {}
  rebounds = {}

  get_all_players.each do |player_name, attributes|
    shoe_sizes[player_name] = attributes[:shoe]
    rebounds[player_name] = attributes[:rebounds]
  end

  last_shoes_sizes = shoe_sizes.sort_by do |player_name, shoe_size|
    shoe_size
  end.last

  all_big_shoes_players = shoe_sizes.find_all do |size|
    size == last_shoes_sizes
  end.to_h

  rebounds.values_at(*all_big_shoes_players.keys).last
end

def most_points_scored
  player = get_all_players.sort_by do |player_name, attributes|
    attributes[:points]
  end.last

  player.first
end

def sum_points(players)
  players.values.map {|value| value[:points]}.reduce(:+)
end

def winning_team
  home_points = sum_points(game_hash[:home][:players])
  away_points = sum_points(game_hash[:away][:players])

  if home_points > away_points
    puts "Home team is the winner."
  elsif home_points == away_points
    puts "It's a tie!"
  else
    puts "Away team is the winner."
  end
end

def player_with_longest_name
  names = get_all_players.keys

  names.sort_by! do |name|
    name.length
  end

  names.last
end
