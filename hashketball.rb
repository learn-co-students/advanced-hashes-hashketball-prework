require "pry"

def game_hash

  def add_player(player_hash,player_info)
    player_hash[player_info[0]] = {}
    player_hash[player_info[0]][:number] = player_info[1]
    player_hash[player_info[0]][:shoe] = player_info[2]
    player_hash[player_info[0]][:points] = player_info[3]
    player_hash[player_info[0]][:rebounds] = player_info[4]
    player_hash[player_info[0]][:assists] = player_info[5]
    player_hash[player_info[0]][:steals] = player_info[6]
    player_hash[player_info[0]][:blocks] = player_info[7]
    player_hash[player_info[0]][:slam_dunks] = player_info[8]
  end

  game = {}

  game[:home] = {}
  game[:home][:team_name] = "Brooklyn Nets"
  game[:home][:colors] = ["Black", "White"]
  game[:home][:players] = {}
  game[:away] = {}
  game[:away][:team_name] = "Charlotte Hornets"
  game[:away][:colors] = ["Turquoise", "Purple"]
  game[:away][:players] = {}

  add_player(game[:home][:players], ["Alan Anderson", 0, 16, 22, 12, 12, 3, 1, 1])
  add_player(game[:home][:players], ["Reggie Evans", 30, 14, 12, 12, 12, 12, 12, 7])
  add_player(game[:home][:players], ["Brook Lopez", 11, 17, 17, 19, 10, 3, 1, 15])
  add_player(game[:home][:players], ["Mason Plumlee", 1, 19, 26, 12, 6, 3, 8, 5])
  add_player(game[:home][:players], ["Jason Terry", 31, 15, 19, 2, 2, 4, 11, 1])
  add_player(game[:away][:players], ["Jeff Adrien", 4, 18, 10, 1, 1, 2, 7, 2])
  add_player(game[:away][:players], ["Bismak Biyombo", 0, 16, 12, 4, 7, 7, 15, 10])
  add_player(game[:away][:players], ["DeSagna Diop", 2, 14, 24, 12, 12, 4, 5, 5])
  add_player(game[:away][:players], ["Ben Gordon", 8, 15, 33, 3, 2, 1, 1, 0])
  add_player(game[:away][:players], ["Brendan Haywood", 33, 15, 6, 12, 12, 22, 5, 12])

  game
end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry

        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end

def num_points_scored(name)
  points = 0

  game_hash.each do |location, team_data|
    team_data.each do |team_attribute, team_value|
      if team_attribute == :players
        team_value.each do |player, stats|
          if player == name
            stats.each do |stat_type, stat_value|
              if stat_type == :points
                points = stat_value
              end
            end
          end
        end
      end
    end
    points
  end
