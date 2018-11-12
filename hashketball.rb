require "pry"

def game_hash
    game_hash = {
        :home => {
            :team_name => 'Brooklyn Nets',
            :colors => ['Black', 'White'],
            :players => [
                {
                    :player_name => 'Alan Anderson',
                    :number => 0,
                    :shoe => 16,
                    :points => 22,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 1
                }, {
                    :player_name => 'Reggie Evans',
                    :number => 30,
                    :shoe => 14,
                    :points => 12,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 12,
                    :blocks => 12,
                    :slam_dunks => 7
                }, {
                    :player_name => 'Brook Lopez',
                    :number => 11,
                    :shoe => 17,
                    :points => 17,
                    :rebounds => 19,
                    :assists => 10,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 15
                }, {
                    :player_name => 'Mason Plumlee',
                    :number => 1,
                    :shoe => 19,
                    :points => 26,
                    :rebounds => 12,
                    :assists => 6,
                    :steals => 3,
                    :blocks => 8,
                    :slam_dunks => 5
                }, {
                    :player_name => 'Jason Terry',
                    :number => 31,
                    :shoe => 15,
                    :points => 19,
                    :rebounds => 2,
                    :assists => 2,
                    :steals => 4,
                    :blocks => 11,
                    :slam_dunks => 1
                }
            ]
        },
        :away => {
            :team_name => 'Charlotte Hornets',
            :colors => ['Turquoise', 'Purple'],
            :players => [
                {
                    :player_name => 'Jeff Adrien',
                    :number => 4,
                    :shoe => 18,
                    :points => 10,
                    :rebounds => 1,
                    :assists => 1,
                    :steals => 2,
                    :blocks => 7,
                    :slam_dunks => 2
                }, {
                    :player_name => 'Bismak Biyombo',
                    :number => 0,
                    :shoe => 16,
                    :points => 12,
                    :rebounds => 4,
                    :assists => 7,
                    :steals => 7,
                    :blocks => 15,
                    :slam_dunks => 10
                }, {
                    :player_name => 'DeSagna Diop',
                    :number => 2,
                    :shoe => 14,
                    :points => 24,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 4,
                    :blocks => 5,
                    :slam_dunks => 5
                }, {
                    :player_name => 'Ben Gordon',
                    :number => 8,
                    :shoe => 15,
                    :points => 33,
                    :rebounds => 3,
                    :assists => 2,
                    :steals => 1,
                    :blocks => 1,
                    :slam_dunks => 0
                }, {
                    :player_name => 'Brendan Haywood',
                    :number => 33,
                    :shoe => 15,
                    :points => 6,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 22,
                    :blocks => 5,
                    :slam_dunks => 12
                }
            ]
        }
    }
end


# def good_practices
#     game_hash.each do |location, team_data|
#       #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#       binding.pry
#         team_data.each do |attribute, data|
#           #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#           binding.pry
   
#           #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
#           data.each do |data_item|
#               binding.pry
#         end
#       end
#     end
#   end

# good_practices

def num_points_scored(player_name)
    points_scored = nil
    game_hash.each do |location_key, team_info_value|
        team_info_value[:players].each do |player|
            if player[:player_name] == player_name
                points_scored = player[:points]
            end
        end
    #     team_info_value.each do |team_info_key, team_data_value|
    #         if team_info_key == :players #the value of :players is an array of hashes we have to loop through.
    #             team_data_value.each do |player_key, player_value|
    #                 player_value.each do |attribute_key, attribute_value|
    #                     if attribute_key == :points && attribute_value == :player_name
    #                         result << attribute_value
    #                     end
    #                 end
    #             end
    #         end
    #     end
    end
    points_scored
end
num_points_scored('Reggie Evans')

def shoe_size(player_name)
    size = nil
    game_hash.each do |location_key, team_data|
        team_data[:players].each do |player|
            if player[:player_name] == player_name
                size = player[:shoe].to_i
            end
        end
    end
    size
end

def team_colors(team_name)
    colors = nil
    game_hash.each do |location_key, team_data|
        if team_data[:team_name] == team_name
            colors = team_data[:colors]
        end
    end
    colors
end

def team_names
    names = []
    game_hash.each do |location_key, data|
        data.each do |team_data_key, team_data_value|
            if team_data_key == :team_name
                names << team_data_value
            end
        end
    end
    names
end

def player_numbers(team_name)
    jersey_numbers = []
    game_hash.each do |location_key, data|
        if data[:team_name] == team_name
            data[:players].each do |player_key, player_value|
                jersey_numbers << player_key[:number].to_i
            end
        end
    end
    jersey_numbers
end


def player_stats(name)
    stats = nil
    game_hash.each do |location_key, data|
        data[:players].each do |player_key, player_value|
            if player_key[:player_name] == name
                stats = player_key
            end
        end
    end
    stats.reject {|key, value| key == :player_name}
end

def big_shoe_rebounds
    current_largest_shoe_size = 0
    current_rebounds = 0
    game_hash.each do |home_away, team_data|
        team_data[:players].each do |player_key|
            if player_key[:shoe] > current_largest_shoe_size
                current_largest_shoe_size = player_key[:shoe]
                current_rebounds = player_key[:rebounds]
            end
        end
    end
    current_rebounds
end

def most_points_scored
    current_most_points = 0
    game_hash.each do |home_away, team_data|
      team_data[:players].each do |players_key|
        if players_key[:points] > current_most_points
          current_most_points = players_key[:points]
        end
      end
    end
    current_most_points
  end

  most_points_scored

  def winning_team
    home_points = 0
    away_points = 0
    game_hash[:home][:players].each do |player_key|
      home_points += player_key[:points] 
    end
    game_hash[:away][:players].each do |player_key|
      away_points += player_key[:points] 
    end
    winner = home_points > away_points ? 'home' : 'away'
  end

  winning_team

  def player_with_longest_name
    longest_name = ''
    game_hash.each do |home_away, team_data|
      team_data[:players].each do |players_key|
        if players_key[:player_name].length > longest_name.length
          longest_name = players_key[:player_name]
        end
      end
    end
    longest_name
  end
  player_with_longest_name

  def long_name_steals_a_ton?
    longest_name = player_with_longest_name
    player_with_most_steals = ''
    current_most_steals = 0
    game_hash.each do |home_away, team_data|
      team_data[:players].each do |player_key|
        if player_key[:steals] > current_most_steals
        current_most_steals = player_key[:steals]
        player_with_most_steals = player_key[:player_name]
        end
      end
    end
    longest_name == player_with_most_steals ? true : false
  end
  
  long_name_steals_a_ton?