 def game_hash
  game_hash = {
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
        },
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
end


def num_points_scored(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if name == player_name 
        return stats[:points]
      end 
    end 
  end 
end 


def shoe_size(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if name == player_name 
        return stats[:shoe]
      end 
    end 
  end 
end 


def team_colors(team_name)
  colors = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data.each do |attribute, data|
        if attribute == :colors
          colors << data 
        end 
      end 
    end
  end
  colors.flatten
end 


def team_names
  names = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name 
        names << data
      end 
    end 
  end
  names
end 


def player_numbers(team_name)
  jersey_numbers = []
  
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each do |attribute, data|
        jersey_numbers << data[:number]
      end 
    end 
  end 
  jersey_numbers
end 


def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |attribute, data|
      if attribute == player_name 
        return data 
      end 
    end 
  end 
end 


def big_shoe_rebounds 
  sizes = []
  rebounds = []
  game_hash.each do |location, team_data|
    team_data[:players].each do |attribute, data|
      sizes << data[:shoe]
    end 
  end
  biggest_shoe = sizes.max
   
  game_hash.each do |location, team_data|
    team_data[:players].each do |attribute, data|
      if data[:shoe] == biggest_shoe
        rebounds << data[:rebounds]
      end
    end
  end
  rebounds[0]
end 

# def good_practices
#   game_hash.each do |location, team_data|
#     binding.pry 
#       team_data.each do |attribute, data|
#         binding.pry 
#           data.each do |data_item|
#             binding.pry 
#           end 
#       end 
#   end 
# end 





