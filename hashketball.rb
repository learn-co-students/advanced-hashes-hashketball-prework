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
    team_data.each do |team_attribute, players|
      if team_attribute == :players
        players.each do |player_name, stats|
          if player_name == name
            stats.each do |stat_type, stat_value|
              if stat_type == :points
                points = stat_value
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
    team_data.each do |team_attribute, players|
      if team_attribute == :players
        players.each do |player_name, stats|
          if player_name == name
            stats.each do |stat_type, stat_value|
              if stat_type == :shoe
                size = stat_value
              end
            end
          end
        end
      end
    end
  end
  size
end

def team_colors(name)
  all_colors = Array.new(2){Array.new(2)}
  final_colors = []
  team = ""
  count = 0

  game_hash.each do |location, team_data|
    team_data.each do |key, value|
      if key == :colors
        all_colors[count][0] = value
      end
      if value == name
        all_colors[count][1] = true
      end
    end
    count += 1
  end

  all_colors.each do |teams|
    if teams[1] == true
      final_colors = teams[0]
    end
  end

  final_colors
end

def team_names
  names = []

  game_hash.each do |location, team_data|
    team_data.each do |team_attribute, attribute_value|
      if team_attribute == :team_name
        names << attribute_value
      end
    end
  end

  names
end

def player_numbers(name)
  team_numbers1 = []
  team_numbers2 = []
  count = 0

  game_hash.each do |location, team_data|
    team_data.each do |team_attribute, attribute_value|
      if team_attribute == :team_name
        count == 0 ? team_numbers1 << attribute_value : team_numbers2 << attribute_value
      end
      if team_attribute == :players
        attribute_value.each do |player_name, stats|
          stats.each do |stat_type, stat_value|
            if stat_type == :number
              count == 0 ? team_numbers1 << stat_value : team_numbers2 << stat_value
            end
          end
        end
      end
    end
    count += 1
  end

  if team_numbers1.include?(name)
    team_numbers1.delete_if {|x| x.class == String }
  else
    team_numbers2.delete_if {|x| x.class == String }
  end

end

def player_stats(name)
  stat_hash = {}

  game_hash.each do |location, team_data|
    team_data.each do |team_attribute, players|
      if team_attribute == :players
        players.each do |player_name, stats|
          if player_name == name
            stat_hash = stats
          end
        end
      end
    end
  end
  stat_hash
end

def big_shoe_rebounds
  #find largest shoe_size
  largest = ""

  game_hash.each do |location, team_data|
    team_data.each do |team_attribute, players|
      if team_attribute == :players
        players.each do |player_name, stats|
          if largest.empty?
            largest << player_name
          elsif shoe_size(player_name) > shoe_size(largest[0])
            largest = player_name
          end
        end
      end
    end
  end

puts largest
  rebounds = 0

  game_hash.each do |location, team_data|
    team_data.each do |team_attribute, players|
      if team_attribute == :players
        players.each do |player_name, stats|
          if player_name == largest
            stats.each do |stat_type, stat_value|
              if stat_type == :rebounds
                rebounds = stat_value
              end
            end
          end
        end
      end
    end
  end

  rebounds

end
