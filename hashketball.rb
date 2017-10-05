require "pry"
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
        },
      }
    }
  }
  #level 1 = team1
  #level 2 = team_info2
  #level 3 = player_name/answer to info
  #level 4 = stats
end

def num_points_scored(name)
  game_hash.each do |team1, team_info2|
    if team_info2[:players].keys.include?(name)
      return team_info2[:players][name][:points]
    end
  end
end

=begin An even more abstract method
def num_points_scored(name)
  game_hash.each do |team1, team_info2|
    team_info2.each do |team_info2, team_ans|
      if team_ans.is_a?(Hash)
        if team_ans.keys.include?(name)
          return team_ans[name][:points]
        end
      end
    end
  end
end
=end

def shoe_size(name)
  game_hash.each do |team1, team_info2|
    if team_info2[:players].keys.include?(name)
      return team_info2[:players][name][:shoe]
    end
  end
end

=begin An even more abstract shoe_size
def shoe_size(name)
  game_hash.each do |team1, team_info2|
    team_info2.each do |team_info2, team_ans|
      if team_ans.is_a?(Hash)
        if team_ans.keys.include?(name)
          return team_ans[name][:shoe]
        end
      end
    end
  end
end
=end

def team_colors(team)
  game_hash.each do |team1, team_info2|
    if team_info2[:team_name] == team
      return team_info2[:colors]
    end
  end
end

def team_names()
  arr = []
  game_hash.each do |team1, team_info2|
    arr << team_info2[:team_name]
  end
  arr
end

def player_numbers(team)
  jersey = []
  game_hash.each do |team1, team_info2|
    if team_info2[:team_name] == team
      team_info2[:players].each do |name, stats|
        jersey << stats[:number]
      end
    end
  end
  jersey
end

def player_stats(player_name)
  game_hash.each do |team1, team_info2|
    if team_info2[:players].keys.include?(player_name)
      return team_info2[:players][player_name]
    end
  end
end

def big_shoe_rebounds
  biggest = 0
  rebounds = ''
  game_hash.each do |team1, team_info2|
    team_info2[:players].each do |name, stats|
      if stats[:shoe] > biggest
        biggest = stats[:shoe]
        rebounds = stats[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  most = 0
  player = ''
  game_hash.each do |team1, team_info2|
    team_info2[:players].each do |name, stats|
      if stats[:points] > most
        most = stats[:points]
        player = name
      end
    end
  end
  player
end

def winning_team
  brooklyn = game_hash[:home][:team_name]
  charlotte = game_hash[:away][:team_name]
  final = {brooklyn => 0,
           charlotte => 0}
  game_hash.each do |team1, team_info2|
    team_info2[:players].each do |name, stats|
      final[game_hash[team1][:team_name]] += stats[:points]
    end
  end

  final[brooklyn] > final[charlotte] ? brooklyn : charlotte
end

def player_with_longest_name
  longest = '1'
  game_hash.each do |team1, team_info2|
    team_info2[:players].each do |name, stats|
      if longest == '' || name.length > longest.length
        longest = name
      end
    end
  end
  longest
end

def long_name_steals_a_ton?
  steals = 0
  long_steals = 0
  game_hash.each do |team1, team_info2|
    team_info2[:players].each do |name, stats|
      if name == player_with_longest_name
        long_steals = stats[:steals]
      end
      if stats[:steals] > steals
        steals = stats[:steals]
      end
    end
  end
  long_steals == steals
end
