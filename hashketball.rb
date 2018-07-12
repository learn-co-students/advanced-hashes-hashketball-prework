require 'pry'

def game_hash # No Input
  # Return a hash/object with game details
  { :home => {
      :team_name  => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => { :number => 0,
        :shoe => 16, :points => 22, :rebounds => 12,
          :assists => 12, :steals => 3,
          :blocks => 1, :slam_dunks => 1
        },
        "Reggie Evans" => { :number => 30,
        :shoe => 14, :points => 12, :rebounds => 12,
          :assists => 12, :steals => 12,
          :blocks => 12, :slam_dunks => 7
        },
        "Brook Lopez" => { :number => 11,
        :shoe => 17, :points => 17, :rebounds => 19,
          :assists => 10, :steals => 3,
          :blocks => 1, :slam_dunks => 15
        },
        "Mason Plumlee" => { :number => 1,
        :shoe => 19, :points => 26, :rebounds => 12,
          :assists => 6, :steals => 3,
          :blocks => 8, :slam_dunks => 5
        },
        "Jason Terry" => { :number => 31,
        :shoe => 15, :points => 19, :rebounds => 2,
          :assists => 2, :steals => 4,
          :blocks => 11, :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name  => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => { :number => 4,
        :shoe => 18, :points => 10, :rebounds => 1,
          :assists => 1, :steals => 2,
          :blocks => 7, :slam_dunks => 2
        },
        "Bismak Biyombo" => { :number => 0,
        :shoe => 16, :points => 12, :rebounds => 4,
          :assists => 7, :steals => 7,
          :blocks => 15, :slam_dunks => 10
        },
        "DeSagna Diop" => { :number => 2,
        :shoe => 14, :points => 24, :rebounds => 12,
          :assists => 12, :steals => 4,
          :blocks => 5, :slam_dunks => 5
        },
        "Ben Gordon" => { :number => 8,
        :shoe => 15, :points => 33, :rebounds => 3,
          :assists => 2, :steals => 1,
          :blocks => 1, :slam_dunks => 0
        },
        "Brendan Haywood" => { :number => 33,
        :shoe => 15, :points => 6, :rebounds => 12,
          :assists => 12, :steals => 22,
          :blocks => 5, :slam_dunks => 12
        }
      }
    }
  }
end

def good_practices # No input
  # Outputs calls to binding.pry at different
  # nesting levels
  # Top-level hash
  game_hash.each do |location, team_data|
    # Are you ABSOLUTELY SURE what 'location' and
    # 'team data' are?
    # Use binding.pry to find out!
    binding.pry
      # 2nd-level hash
      team_data.each do |attribute, data|
        # Are you ABSOLUTELY SURE what 'attribute'
        # and 'team data' are? Use binding.pry to
        # find out!
        binding.pry
        # 3rd-level hash
        # What is 'data' at each loop through out
        # .each block? When
        # will the following line of code work and
        # when will it break?
        data.each do |data_item|
          binding.pry
      end
    end
  end
end
# good_practices

def num_points_scored(name) # Takes string as input
  # Assign team based on roster
  team = game_hash[:home][:players].key?(name) ?
                                        :home : :away
  # Return number of points
  game_hash[team][:players][name][:points]
end

def shoe_size(name) # Takes string as input
  # Assign team based on roster
  team = game_hash[:home][:players].key?(name) ?
                                        :home : :away
  # Return shoe size
  game_hash[team][:players][name][:shoe]
end

def team_colors(name) # Takes string as input
  # Look up team name
  team = game_hash[:home].has_value?(name) ?
                                    :home : :away
  # Return the array of team colors
  game_hash[team][:colors]
end

def team_names # Takes no input
  # # Create a variable to store array
  # teams = []
  # # Iterate over hash to find team names
  # game_hash.each do |location, team_data|
  #   team_data.each do |attribute, data|
  #     # Push team name to array
  #     if attribute == :team_name
  #       teams.push(data)
  #     end
  #   end
  # end
  # # Return array of team names
  # teams
  [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(name) # Takes string as input
  # Create a varibale to store array
  numbers = []
  # Look up team name
  team = game_hash[:home].has_value?(name) ? :home : :away
  # Iterate over hash to find team numbers
  game_hash[team][:players].each do |player, player_data|
    numbers.push(player_data[:number])
  end
  # Return array of member numbers
  numbers
end

def player_stats(name) # Takes string as input
  # Assign team based on roster
  team = game_hash[:home][:players].key?(name) ? :home : :away
  # Return stats
  game_hash[team][:players][name]
end

def find_team(name) # Takes string as input
  # Assign team based on roster
  team = game_hash[:home][:players].key?(name) ?
  :home : :away
  # Return team
  team
end

def big_shoe_rebounds # Takes no input
  # Create a variable to store player name
  player = nil
  # Create a variable to store biggest shoe
  biggest = 0
  # Iterate over hash to find player
  game_hash.each do |location, team_data|
    team_data[:players].each do |attribute, data|
      if data[:shoe] > biggest
        biggest = data[:shoe]
         player = attribute
       end
    end
  end
  # Return a numeric value
  game_hash[find_team(player)][:players][player][:rebounds]
end
