require 'pry'
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
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
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
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

def home_team_name
  game_hash[:home][:team_name]
end

def num_points_scored(name)
  points = 0
  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |player_name, player_stats|
            if player_name == name
              player_stats.each do |stats, value|
                if stats == :points
                  points = value
                end
              end
            end
          end
        end
      end
  end
  points
end

def shoe_size(name)
  size = 0
  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |player_name, player_stats|
            if player_name == name
              player_stats.each do |stats, value|
                if stats == :shoe
                  size = value
                end
              end
            end
          end
        end
      end
  end
  size
end

def team_colors(team_name)
  team = game_hash.values.find {|team_data| team_data[:team_name] == team_name}
  team[:colors]
end

def team_names
  game_hash.collect do |location, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team_name)
player_num_array = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |player_name, player_stats|
            player_num_array << player_stats[:number]
          end
        end
      end
    end
  end
  player_num_array
end

def player_stats(name)
  player_statistics = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, player_stats|
          if player_name == name
            player_statistics = player_stats
          end
        end
      end
    end
  end
  player_statistics
end

def all_players
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  home_players.merge(away_players)
end

def biggest_shoe_player
  big_shoe_array = []
  big_shoe_array = all_players.to_a.each.sort_by {|player| player[1][:shoe]}
#array looks like [["name", {stats}],["name", {stats}]]
#[-1] indicates last item & [0] indicates the 1st element in the individual
#index arrays.
  largest_shoe_player = big_shoe_array[-1][0]
end

def big_shoe_rebounds
  all_players[biggest_shoe_player][:rebounds]
end

def most_points_scored
  points_array = []
  points_array = all_players.to_a.each.sort_by {|player| player[1][:points]}
#array looks like [["name", {stats}],["name", {stats}]]
#[-1] indicates last item & [0] indicates the 1st element in the individual
#index arrays.
  most_points_player = points_array[-1][0]
end
