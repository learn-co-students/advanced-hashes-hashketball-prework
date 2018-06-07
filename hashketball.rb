require "pry"

def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" =>  {
          number:      0, 
          shoe:       16, 
          points:     22, 
          rebounds:   12, 
          assists:    12, 
          steals:      3, 
          blocks:      1, 
          slam_dunks:  1
        },
        "Reggie Evans"  =>  {
          number:     30, 
          shoe:       14, 
          points:     12, 
          rebounds:   12, 
          assists:    12, 
          steals:     12, 
          blocks:     12, 
          slam_dunks:  7
        },               
        "Brook Lopez"   =>  {
          number:     11, 
          shoe:       17, 
          points:     17, 
          rebounds:   19, 
          assists:    10, 
          steals:      3, 
          blocks:      1, 
          slam_dunks: 15
        },
        "Mason Plumlee" =>  {
          number:      1, 
          shoe:       19, 
          points:     26, 
          rebounds:   12, 
          assists:     6, 
          steals:      3, 
          blocks:      8, 
          slam_dunks:  5
        },
        "Jason Terry"   =>  {
          number:     31, 
          shoe:       15, 
          points:     19, 
          rebounds:    2, 
          assists:     2, 
          steals:      4, 
          blocks:     11, 
          slam_dunks:  1
        }
      }
    },

    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien"     =>  {
          number:      4, 
          shoe:       18, 
          points:     10, 
          rebounds:    1, 
          assists:     1, 
          steals:      2, 
          blocks:      7, 
          slam_dunks:  2
        },
        "Bismak Biyombo"  =>  {
          number:      0, 
          shoe:       16, 
          points:     12, 
          rebounds:    4, 
          assists:     7, 
          steals:      7, 
          blocks:     15, 
          slam_dunks: 10
        },               
        "DeSagna Diop"    =>  {
          number:      2, 
          shoe:       14, 
          points:     24, 
          rebounds:   12, 
          assists:    12, 
          steals:      4, 
          blocks:      5, 
          slam_dunks:  5
        },
        "Ben Gordon"      =>  {
          number:      8, 
          shoe:       15, 
          points:     33, 
          rebounds:    3, 
          assists:     2, 
          steals:      1, 
          blocks:      1, 
          slam_dunks:  0
        },
        "Brendan Haywood" =>  {
          number:     33, 
          shoe:       15, 
          points:      6, 
          rebounds:   12, 
          assists:    12, 
          steals:     22, 
          blocks:      5, 
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(player_name)
  result = nil
  game_hash.each do |team, about|
    about[:players].each do |name, stats|
      if player_name == name
        result = stats[:points]
      end
    end
  end
  result
end

def shoe_size(player_name)
  result = nil
  game_hash.each do |team, about|
    about[:players].each do |name, stats|
      if player_name == name
        result = stats[:shoe]
      end
    end
  end
  result
end

def team_colors(team_name)
  result = nil
  game_hash.each do |team, about|
    if about[:team_name] == team_name
          result = about[:colors]
    end
  end
  result
end

def team_names
  result = []
  game_hash.each do |team, about|
    result << about[:team_name]
  end
  result
end

def player_numbers(team_name)
  result = []
  game_hash.each do |team, about|
    if team_name == about[:team_name]
      about[:players].each do |name, stats|
          result << stats[:number]
      end
    end
  end
  result
end

def player_stats(player_name)
  result = {}
  game_hash.each do |team, about|
    about[:players].each do |name, stats|
      if player_name == name
        result = stats
      end
    end
  end
  result
end

def big_shoe_rebounds
  big_shoe = 0
  result = 0
  game_hash.each do |team, about|
    about[:players].each do |name , stats|
      stats.each do |stat, value|
        if stat == :shoe
          if big_shoe < value 
            result = stats[:rebounds]
            big_shoe = value
          end
        end
      end
    end
  end
  result
end

def most_points_scored
  points = 0
  result = ""
  game_hash.each do |team, about|
    about[:players].each do |name , stats|
      if points < stats[:points]
        points = stats[:points]
        result = name
      end
    end
  end
  result
end

def winning_team
  home_points = 0
  away_points = 0
  result = ""
  i = 0
  game_hash.each do |team, about|
    about[:players].each do |name , stats|
      if i == 0
        home_points += stats[:points]
      else
        away_points += stats[:points]
      end
    end
    i += 1
  end
  home_points > away_points ? result = game_hash[:home][:team_name] : result = game_hash[:away][:team_name]
end

def player_with_longest_name
  name_size = 0
  result = ""
  game_hash.each do |team, about|
    about[:players].each do |name , stats|
      if name_size < name.size
        result = name
      end
    end
  end
  result
end

def long_name_steals_a_ton?
  steals = 0
  most_steals = ""
  game_hash.each do |team, about|
    about[:players].each do |name , stats|
      if steals < stats[:steals]
        steals = stats[:steals]
        most_steals = name
      end
    end
  end
  most_steals == player_with_longest_name
end
