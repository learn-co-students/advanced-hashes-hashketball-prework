# Write your code here!
require "pry"

def game_hash
  game_hash = {
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
      "Reggie Evans"	=> {
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7
      },
      "Brook Lopez"	=> {
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15
      },
      "Mason Plumlee"	=> {
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 12,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5
      },
      "Jason Terry"	=> {
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
      "Bismak Biyombo"	=> {
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 7,
        blocks: 15,
        slam_dunks: 10
      },
      "DeSagna Diop"	=> {
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5
      },
      "Ben Gordon"	=> {
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0
      },
      "Brendan Haywood"	=> {
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

# p game_hash[:home][:players]["Alan Anderson"][:points]

def num_points_scored(player)
  points = 0
  game_hash.each do |key, data|
    if game_hash[key][:players].has_key?(player)
    points = game_hash[key][:players][player][:points]
    end
  end
  points
end


def shoe_size(player)
  size = 0
  game_hash.each do |key, data|
    if game_hash[key][:players].has_key?(player)
    size = game_hash[key][:players][player][:shoe]
    end
  end
  size
end

def team_colors(team)
  colors = "None?"
  game_hash.each do |key, data|
    if game_hash[key][:team_name] == team
    colors = game_hash[key][:colors]
    end
  end
  colors
end

def team_names
  team_array = []
  game_hash.each {|key, value| team_array << game_hash[key][:team_name]}
  team_array
end


def player_numbers(team)
  numbers = []

  game_hash.each do |key, value|
    if game_hash[key][:team_name] == team
      game_hash[key][:players].each do |player, stats|
        numbers << game_hash[key][:players][player][:number]
      end
    end
  end
  numbers.sort
end

def player_stats(player)
  player
  game_hash.each do |key, data|
    if game_hash[key][:players].has_key?(player)
    player = game_hash[key][:players].fetch(player)
    end
  end
  player
end

def big_shoe_rebounds
  shoe = 0
  rebounds = 0

  game_hash.each do |key, data|
    game_hash[key][:players].each do |player, data|
      if game_hash[key][:players][player][:shoe] > shoe
        shoe = game_hash[key][:players][player][:shoe]
        rebounds = game_hash[key][:players][player][:rebounds]
      end
    end
  end

  rebounds
end


#BONUS

def most_points_scored
  score = 0
  top_scorer = ""

  game_hash.each do |key, data|
    game_hash[key][:players].each do |player, data|
      if game_hash[key][:players][player][:points] > score
        score = game_hash[key][:players][player][:points]
        top_scorer = player
      end
    end
  end

  top_scorer
end

def winning_team
  home = []
  away = []

  game_hash.each do |key, value|
    if key == :home
      game_hash[key][:players].each do |player, stats|
        home << game_hash[key][:players][player][:points]
      end
    else
      game_hash[key][:players].each do |player, stats|
        away << game_hash[key][:players][player][:points]
      end
    end
  end

# does not support a tie
  home.inject(&:+) > away.inject(&:+) ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end

def player_with_longest_name
  longest_name = ""

  game_hash.each do |key, value|
      game_hash[key][:players].each do |player, stats|
        if player.length > longest_name.length
          longest_name = player
      end
    end
  end
  longest_name
end



def long_name_steals_a_ton?
  true
end
