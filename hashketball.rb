require 'byebug'

def game_hash
  {
    :home=>
      {
        :team_name=>"Brooklyn Nets",
        :colors=>["Black","White"],
        :players=>
        {
          "Alan Anderson"=>
          {
            :number=>0,
            :shoe=>16,
            :points=>22,
            :rebounds=>12,
            :assists=>12,
            :steals=>3,
            :blocks=>1,
            :slam_dunks=>1
          },
          "Reggie Evans"=>
          {
            :number=>30,
            :shoe=>14,
            :points=>12,
            :rebounds=>12,
            :assists=>12,
            :steals=>12,
            :blocks=>12,
            :slam_dunks=>7
          },
          "Brook Lopez"=>
          {
            :number=>11,
            :shoe=>17,
            :points=>17,
            :rebounds=>19,
            :assists=>10,
            :steals=>3,
            :blocks=>1,
            :slam_dunks=>15
          },
          "Mason Plumlee"=>
          {
            :number=>1,
            :shoe=>19,
            :points=>26,
            :rebounds=>12,
            :assists=>6,
            :steals=>3,
            :blocks=>8,
            :slam_dunks=>5
          },
          "Jason Terry"=>
          {
            :number=>31,
            :shoe=>15,
            :points=>19,
            :rebounds=>2,
            :assists=>2,
            :steals=>4,
            :blocks=>11,
            :slam_dunks=>1
          }
        }
      },
    :away=>
      {
        :team_name=>"Charlotte Hornets",
        :colors=>["Turquoise","Purple"],
        :players=>
        {
          "Jeff Adrien"=>
          {
            :number=>4,
            :shoe=>18,
            :points=>10,
            :rebounds=>1,
            :assists=>1,
            :steals=>2,
            :blocks=>7,
            :slam_dunks=>2
          },
          "Bismak Biyombo"=>
          {
            :number=>0,
            :shoe=>16,
            :points=>12,
            :rebounds=>4,
            :assists=>7,
            :steals=>7,
            :blocks=>15,
            :slam_dunks=>10
          },
          "DeSagna Diop"=>
          {
            :number=>2,
            :shoe=>14,
            :points=>24,
            :rebounds=>12,
            :assists=>12,
            :steals=>4,
            :blocks=>5,
            :slam_dunks=>5
          },
          "Ben Gordon"=>
          {
            :number=>8,
            :shoe=>15,
            :points=>33,
            :rebounds=>3,
            :assists=>2,
            :steals=>1,
            :blocks=>1,
            :slam_dunks=>0
          },
          "Brendan Haywood"=>
          {
            :number=>33,
            :shoe=>15,
            :points=>6,
            :rebounds=>12,
            :assists=>12,
            :steals=>22,
            :blocks=>5,
            :slam_dunks=>12
          }
        }
      }
  }
end

def num_points_scored(name)
  game_hash.each do |location, team_data|

    #Going to :players and staying in nested hash
    team_data[:players].each do |player , stats|
      if player == name
        #Using stats instead of writing the whole key to get to the value
        return stats[:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
    #Going to :players and skipping other hashes
    team_data[:players].each do |player , stats|
      if player == name
        #Using stats instead of writing the whole key to get to the valuw
        return stats[:shoe]
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      return team_data[:colors]
    end
  end
end

def team_names
  game_hash.map do |location, team_data|
    game_hash[location][:team_name]
  end
end

def player_numbers(team)
  #see if team matches
  right_team = check_team(team)

  #then grab hash of players
  players = right_team[:players]

  #map player numbers
  players.map do |name, stats|
    stats[:number]
  end
end

def check_team(team)
  teams_array = game_hash.values
  teams_array.find do |team_data|
    team_data[:team_name] == team
  end
end

def player_stats(name)
  game_hash.each do |location, team_data|
    if team_data[:players][name]
      return team_data[:players][name]
    end
  end
end

def big_shoe_rebounds
  shoe_size = 0
  shoe_player_rebounds = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      if stats[:shoe] > shoe_size
        shoe_size = stats[:shoe]
        shoe_player_rebounds = stats[:rebounds]
      end
    end
  end
  shoe_player_rebounds
end

def most_points_scored
  #list of player names and their points

  #take list and compare each player one by one
  points = 0
  player_with_most_points = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      if stats[:points] > points
        points = stats[:points]
        player_with_most_points = player
      end
    end
  end
  player_with_most_points
end

def winning_team
  #get one team's list of Points
  home_point_list = team_points(:home)
  #add them
  home_points = add_points(home_point_list)
  #get another team's list of Points
  away_point_list = team_points(:away)
  #add them
  away_points = add_points(away_point_list)
  #return whoever is larger
  if home_points > away_points
    return game_hash[:home][:team_name]
  elsif away_points > home_point_list
    return game_hash[:away][:team_name]
  end
end

def team_points(home_or_away_team)
  team_data = game_hash[home_or_away_team]
  team_data[:players].map do |player, stats|
    stats[:points]
  end
end

def add_points(team_points)
  total = 0
  team_points.each do |point|
    total += point
  end
  total
end

def player_with_longest_name
  #create list of player names
  player_list
  #set longest name
  longest_name = ""
  #go through each player and check size
  player_list.each do |player|
    if longest_name.size < player.size
      longest_name = player
    end
  end
  longest_name
end

def player_list
  list = game_hash[:home][:players].keys << game_hash[:away][:players].keys
  list.flatten
end

def long_name_steals_a_ton?
  most_steals == player_with_longest_name
end

def most_steals
  #list of player names and their points

  #take list and compare each player one by one
  steals = 0
  player_with_steals = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      if stats[:steals] > steals
        steals = stats[:steals]
        player_with_steals = player
      end
    end
  end
  player_with_steals
end
