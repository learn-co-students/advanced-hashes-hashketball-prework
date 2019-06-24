require 'pry'

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [{
        "Alan Anderson" =>
      {
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
        "Reggie Evans" =>
      {
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
        "Brook Lopez" =>
      {
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },
        "Mason Plumlee" =>
      {
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
        "Jason Terry" =>
      {
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }
      }]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [{
        "Jeff Adrien" =>
      {
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },
        "Bismack Biyombo" =>
      {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
      },
        "DeSagna Diop" =>
      {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },
        "Ben Gordon" =>
      {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
        "Kemba Walker" =>
      {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12
      }
      }]
    }
  }
end

# def good_practices
#   game_hash.each do |location, team_data|
#     #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#     #binding.pry
#     team_data.each do |attribute, data|
#       #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#       #binding.pry
 
#       #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
#       data.each do |data_item| # this is a string
#       # undefined method `each' for "Brooklyn Nets":String
# #       Traceback (most recent call last):
# #         5: from hashketball.rb:145:in `<main>'
# #         4: from hashketball.rb:131:in `good_practices'
# #         3: from hashketball.rb:131:in `each'
# #         2: from hashketball.rb:134:in `block in good_practices'
# #         1: from hashketball.rb:134:in `each'
# # hashketball.rb:139:in `block (2 levels) in good_practices': undefined method `each' for "Brooklyn Nets":String (NoMethodError)
#           #binding.pry
#       end
#     end
#   end
# end
# good_practices

def num_points_scored(player_name)
  game_hash.collect do |location, team_data|
    team_data[:players].collect do |attribute, data|
      attribute.collect do |key, value|
        #binding.pry
        if key == player_name
          return value[:points]
        end
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.collect do |home_or_away, team_info|
    team_info[:players].collect do |stats, player_stats|
      stats.collect do |key, value|
        if key == player_name
          return value[:shoe]
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.collect do |home_or_away, team_info|
    if team_info[:team_name] == team_name
      return team_info[:colors]
    end
  end
end

def team_names
  game_hash.collect do |home_or_away, team_info|
    team_info[:team_name]
  end
end

def player_numbers(team_name)
  team_number = []
  game_hash.each do |home_or_away, team_info|
    if team_info[:team_name] == team_name
      team_info[:players].each do |players|
        players.each do |key, value|
          #binding.pry
          team_number << value[:number]
        end
      end
    end
  end
  team_number
end

def player_stats(player_name)
  game_hash.collect do |home_or_away, team_info|
    team_info[:players].collect do |stats|
      stats.collect do |key, value|
        #binding.pry
        if key == player_name
          return value
        end
      end
    end
  end
end

def big_shoe_rebounds
  shoe = 0
  rebounds = 0
  game_hash.collect do |home_or_away, team_info|
    team_info[:players].collect do |stats|
      #binding.pry
      stats.collect do |key, value|
        if value[:shoe] > shoe
          shoe = value[:shoe]
          rebounds = value[:rebounds]
        end
      end
    end
  end
  rebounds
end

def most_points_scored
  points = 0
  name = ""
  game_hash.collect do |home_or_away, team_info|
    team_info[:players].collect do |stats|
      stats.collect do |key, value|
        #binding.pry
        if value[:points] > points
          points = value[:points]
          name = key
        end
      end
    end
  end
  name
end

def winning_team
  most_points = 0
  home_team = 0
  away_team = 0
  team_1 = ""
  team_2 = ""
  
  game_hash.collect do |location, team_data|
    team_data[:players].collect do |stats|
      #binding.pry
      stats.collect do |key, value|
        #binding.pry
        if location == game_hash[:home]
          home_team += value[:points]
          team_1 = team_data[:team_name]
        else location == game_hash[:away]
          away_team += value[:points]
          team_2 = team_data[:team_name]
        end
        
        if home_team > away_team
          return team_1
        else
          return team_2
        end
      end
    end
  end
end

def player_with_longest_name
  longest_name = "a"
  game_hash.collect do |home_or_away, team_info|
    team_info[:players].collect do |stats|
      stats.collect do |key, value|
        if key.length > longest_name.length
          longest_name = key
        end
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  steals = 0
  name = ""
  game_hash.collect do |home_or_away, team_info|
    team_info[:players].collect do |stats|
      stats.collect do |key, value|
        if value[:steals] > steals
          steals = value[:steals]
          name = key
        end
      end
    end
  end
  name
  
  if player_with_longest_name == name
    return true
  end
end