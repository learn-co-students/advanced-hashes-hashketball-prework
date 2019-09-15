require "pry"

def game_hash

  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
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
          :blocks =>11,
          :slam_dunks => 1
        }
      },
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
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
  game_hash
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

  points_scored = 0

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, stats|
          if player_name == name
            stats.each do |stat, num|
              if stat == :points
                points_scored = num
              end
            end
          end
        end
      end
    end
  end
  return points_scored
end

def shoe_size(name)

  player_shoe_size = 0

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, stats|
          if player_name == name
            stats.each do |stat, num|
              if stat == :shoe
                player_shoe_size = num
              end
            end
          end
        end
      end
    end
  end
  return player_shoe_size
end

def team_colors(team_name_input)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == team_name_input
        return game_hash[location][:colors]
      end
    end
  end
end

def team_names

  output_array = []

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        output_array << data
      end
    end
  end
  return output_array
end

def player_numbers(team_name_input)

  player_hash = nil
  output_array = []

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == team_name_input
        player_hash = game_hash[location][:players]
      end
    end
  end

  player_hash.each do |name, stats|
    stats.each do |stat, num|
      if stat == :number
        output_array << num
      end
    end
  end
  return output_array
end

def player_stats(input_name)

  output_hash = {}

  game_hash.each do |location, data_hash|
    data_hash.each do |attribute, data|
      if attribute == :players
        data.each do |name,stats|
          if name == input_name
            output_hash = stats
          end
        end
      end
    end
  end
  return output_hash
end

def big_shoe_rebounds

  current_big_shoe = 0
  target_player_stats = {}

  game_hash.each do |location, data_hash|
    data_hash.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats|
          stats.each do |stat, num|
            if stat == :shoe
              if num > current_big_shoe
                current_big_shoe = num
                target_player_stats = stats
              end
            end
          end
        end
      end
    end
  end
  return target_player_stats[:rebounds]
end

big_shoe_rebounds
