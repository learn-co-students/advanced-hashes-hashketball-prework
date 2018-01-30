require 'pry'

def game_hash
  hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [{
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },

  away: {
     team_name: "Charlotte Hornets",
     colors: ["Turquoise", "Purple"],
     players: [{
         player_name: "Jeff Adrien",
         number: 4,
         shoe: 18,
         points: 10,
         rebounds: 1,
         assists: 1,
         steals: 2,
         blocks: 7,
         slam_dunks: 2
       },
       {
         player_name: "Bismak Biyombo",
         number: 0,
         shoe: 16,
         points: 12,
         rebounds: 4,
         assists: 7,
         steals: 7,
         blocks: 15,
         slam_dunks: 10
       },
       {
         player_name: "DeSagna Diop",
         number: 2,
         shoe: 14,
         points: 24,
         rebounds: 12,
         assists: 12,
         steals: 4,
         blocks: 5,
         slam_dunks: 5
       },
       {
         player_name: "Ben Gordon",
         number: 8,
         shoe: 15,
         points: 33,
         rebounds: 3,
         assists: 2,
         steals: 1,
         blocks: 1,
         slam_dunks: 0
       },
       {
         player_name: "Brendan Haywood",
         number: 33,
         shoe: 15,
         points: 6,
         rebounds: 12,
         assists: 12,
         steals: 22,
         blocks: 5,
         slam_dunks: 12
       }
     ]
   }
 }
end

def get_players
  game_hash.values.map do |data|
    data[:players]
  end.flatten
end

def find_player(all_players, name)
  all_players.find do |player|
    player[:player_name] == name
  end
end

def num_points_scored(name)
  players = get_players
  find_player(players, name)[:points]

  # home_players = game_hash[:home][:players]
  # away_players = game_hash[:away][:players]
  #
  # home_players.each do |player, stats|
  #   if player == name
  #     return home_players["#{name}"][:points]
  #   end
  # end
  #
  # away_players.each do |player, stats|
  #   if player == name
  #     return away_players["#{name}"][:points]
  #   end
  # end
end

def shoe_size(name)
  players = get_players
  find_player(players, name)[:shoe]
  # home_players = game_hash[:home][:players]
  # away_players = game_hash[:away][:players]
  #
  # home_players.each do |player, stats|
  #   if player == name
  #     return home_players["#{name}"][:shoe]
  #   end
  # end
  #
  # away_players.each do |player, stats|
  #   if player == name
  #     return away_players["#{name}"][:shoe]
  #   end
  # end
end

def team_colors(team)
  game_hash.values.find do |data|
    if data[:team_name] == team
      return data[:colors]
    end
  end
  # if game_hash[:home][:team_name] == team
  #   return game_hash[:home][:colors]
  # elsif game_hash[:away][:team_name] == team
  #   return game_hash[:away][:colors]
  # end
end

def team_names
  game_hash.values.map do |data|
    data[:team_name]
  end.flatten
  # teams = []
  #
  # teams << game_hash[:home][:team_name]
  # teams << game_hash[:away][:team_name]
  #
  # teams
end

def player_numbers(team)
  one_team = game_hash.values.find do |data|
    data[:team_name] == team
  end

  one_team[:players].map do |player|
    player[:number]
  end.flatten
  # numbers = []
  #
  # if game_hash[:home][:team_name] == team
  #   game_hash[:home][:players].each do |player, stats|
  #     numbers << stats[:number]
  #   end
  # end
  #
  # if game_hash[:away][:team_name] == team
  #   game_hash[:away][:players].each do |player, stats|
  #     numbers << stats[:number]
  #   end
  # end
  # numbers
end

def player_stats(name)
  players = get_players
  found_player = find_player(players, name)
  found_player.select do |k, v|
    k != :player_name
  end
  # home_players = game_hash[:home][:players]
  # away_players = game_hash[:away][:players]
  # home_players.each do |player, stats|
  #   if player == name
  #     return home_players["#{name}"]
  #   end
  # end
  #
  # away_players.each do |player, stats|
  #   if player == name
  #     return away_players["#{name}"]
  #   end
  # end
end

def find_biggest_shoe
  big_shoe = 0
  players = get_players

  players.each do |name|
    if name[:shoe] > big_shoe
      big_shoe = name[:shoe]
    end
  end
  big_shoe
end

def big_shoe_rebounds
  find_biggest_shoe[:rebounds]
  # shoe_sizes = []
  # largest_shoe = 0
  # largest_shoe_player = nil
  #
  # home_players = game_hash[:home][:players]
  # away_players = game_hash[:away][:players]
  #
  # home_players.each do |player, stats|
  #   shoe_sizes << stats[:shoe]
  # end
  # away_players.each do |players, stats|
  #   shoe_sizes << stats[:shoe]
  # end
  #
  # largest_shoe = shoe_sizes.sort.reverse[0]
  #
  # home_players.each do |player, stats|
  #   if stats[:shoe] == largest_shoe
  #     return stats[:rebounds]
  #   end
  # end
  # away_players.each do |player, stats|
  #   if stats[:shoe] == largest_shoe
  #     return stats[:rebounds]
  #   end
  # end
end

def most_points_scored
  most_points = 0
  player_name = ""

  game_hash.each do |team, data|
    data[:players].each do |player, stats|
      if stats[:points] > most_points
        most_points = stats[:points]
        player_name = player
      end
    end
  end
  player_name
end

=begin
def most_points_scored

  most_points = num_points_scored(name)
  player_name = name


end
=end
