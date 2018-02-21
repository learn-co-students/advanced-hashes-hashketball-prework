require 'pry'
def game_hash
  game = {
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
        }
      }
    }
  }

end

def num_points_scored(player)
  game_hash.each do |location, team_data|
   # returns the away or home and associated values
    team_data.each do |attribute, data|
      if attribute == :players
       data.each do |baller, stats|
        if baller == player
          #returns individual player
          return stats[:points]
        #returns points for individual player
        end
       end
      end
    end
  end
end

def shoe_size(player)
  game_hash.each do |location, team_data|
    #binding.pry
    team_data[:players].each do |baller, stats|
      if baller == player
      #binding.pry
      return stats[:shoe]
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
     @team_colors = team_data[:colors]
    end
  end
  @team_colors
end

def team_names
  team_names = []

  game_hash.each do |location, team_data|
    team_names << team_data[:team_name]
  end
  team_names
end

def player_numbers(team)
  charlotte_numbers = []
  brooklyn_numbers = []
  
  game_hash.each do |location, team_data|
    if team_data[:team_name] == "Brooklyn Nets"
      # iterates into the team_data hash w/ key of players
      #assigns the string to 'player' and the hash to 'stats'
      #shovels the value of the stats hash w/ key of number into array
      team_data[:players].each do |player, stats|
        brooklyn_numbers << stats[:number]
        brooklyn_numbers = brooklyn_numbers.sort  
      end
    else
      team_data[:players].each do |player, stats|
        charlotte_numbers << stats[:number]
        charlotte_numbers = charlotte_numbers.sort 
      end
    end
  end
  
  if team == "Brooklyn Nets"
  brooklyn_numbers
  else
    charlotte_numbers
  end
  
end

def player_stats(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      if player == name
         @statistics = stats
      end
    end
  end
  @statistics
end

def big_shoe_rebounds
  largest_shoe = 0
    
  game_hash.each do |location, team_data|
      team_data[:players].each do |player, values|
        if values[:shoe] > largest_shoe
          largest_shoe = values[:shoe]
          @rebounds = values[:rebounds]  
        end
      end
    end
    @rebounds
end

def most_points_scored

  most_points = 0

  game_hash.each do |location, team_data|
    team_data[:players].each do |player, values|
      if values[:points] > most_points
        most_points = values[:points]
        @baller = player
      end
    end
  end
  @baller
end


# def good_practices
#   game_hash.each do |location, team_data|
#     #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#     binding.pry
#       team_data.each do |attribute, data|
#         #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#         binding.pry
 
#         #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
#         data.each do |data_item|
#             binding.pry
#       end
#     end
#   end
# end

# good_practices