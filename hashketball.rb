require 'pry'
# Write your code here!
def game_hash
  game_hash = {
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

def num_points_scored (player_name)
  points_scored = []
  game_hash.each do |court, attributes|
    attributes[:players].each do |player, stats|
      if player == player_name
        points_scored.push(stats[:points])
      end
    end
  end
  points_scored[0]
end

def shoe_size (player_name)
  size = []
  game_hash.each do |court, attributes|
    attributes[:players].each do |player, stats|
      if player == player_name
        size.push(stats[:shoe])
      end
    end
  end
  size[0]
end

def team_colors(team)
  colors = []
  game_hash.each do |court, attributes|
    if team == attributes[:team_name]
      colors.push(attributes[:colors])
    end
  end
  colors.flatten
end

def team_names
  teams = []
  game_hash.each do |court, attributes|
    teams.push(attributes[:team_name])
  end
  teams
end

def player_numbers (name)
  jersey_number = []
  game_hash.each do |court, attributes|
    attributes[:players].each do |players, stats|
      if name == attributes[:team_name]
        jersey_number.push(stats[:number])
      end
    end
  end
  jersey_number
end

def player_stats(player_name)
  stat_line = []
  game_hash.each do |court, attributes|
    attributes[:players].each do |players, stats|
      if players == player_name
        stat_line.push(stats)
      end
    end
  end
  stat_line[0]
end

def big_shoe_rebounds
  shoe_size = []
  rebound_stat = []
  game_hash.each do |court, attributes|
    attributes[:players].each do |players, stats|
      shoe_size.push(stats[:shoe])
    end
  end
  largest_shoe = shoe_size.sort.reverse[0]
  #found the largest shoe size by sticking them all in an array, sorting them
  #reversing the sort, then grabbing the first element!
  game_hash.each do |court, attributes|
    attributes[:players].each do |players, stats|
      if largest_shoe == stats[:shoe]
        rebound_stat.push(stats[:rebounds])
      end
    end
  end
  rebound_stat[0]
end

#B-b-b-b-BAANG!! OVER TIME (thanks mike breen)
#bonus round
def most_points_scored
  points_scored = []
  box_score = []
  game_hash.each do |court, attributes|
    attributes[:players].each do |players, stats|
      points_scored.push(stats[:points])
    end
  end
  potg = points_scored.sort.reverse[0]
  game_hash.each do |court, attributes|
    attributes[:players].each do |players, stats|
      if potg == stats[:points]
        box_score.push(players)
      end
    end
  end
  box_score[0]
end
