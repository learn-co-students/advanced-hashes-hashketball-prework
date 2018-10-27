require "pry"
def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
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
          :blocks => 11,
          :slam_dunks => 1}
      }


    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Purple", "Turquoise"],
      :players => {
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

end


def num_points_scored(scoring_player)
  game_hash.each do |place, info|
    if info[:players].has_key?(scoring_player)

      return info[:players][scoring_player][:points]
    end
  end
end


def shoe_size(player_name)
  #might be similar to earlier one - find the player but just get shoe size
  game_hash.each do |place, info|
    if info[:players].has_key?(player_name)
      return info[:players][player_name][:shoe]
    end
  end
end



def team_colors(team)
  #Why do I have to put game_hash when I didn't above
  game_hash.each do |place, teams|

    if game_hash[place].has_value?(team)
      return game_hash[place][:colors]
    end
  end
end

def team_names
  game_hash.map do |place, team_data|
    game_hash[place][:team_name]
  end
end

def player_numbers(team)
  #how to use map in this method
  numbers_array = []
  game_hash.each do |place, team_data|
    if game_hash[place].has_value?(team)
      game_hash[place][:players].map do |player, player_data|
        # binding.pry
         numbers_array << game_hash[place][:players][player][:number]
      end
    end
  end
numbers_array
end

def player_stats(cur_player)
  game_hash.each do|place, team_data|
    if game_hash[place][:players].has_key?(cur_player)
      return game_hash[place][:players][cur_player]
    end
  end
end

def big_shoe_rebounds
  # is there a better way to write this - biggest_shoes = nil?
  biggest_shoe_size = 0
  rebounds_of_cur_player= ""
  game_hash.each do |place, team_data|

    game_hash[place][:players].each do |player, player_data|
      if game_hash[place][:players][player][:shoe] > biggest_shoe_size
        biggest_shoe_size = game_hash[place][:players][player][:shoe]
        rebounds_of_cur_player = game_hash[place][:players][player][:rebounds]
      end
    end
  end
  rebounds_of_cur_player
end
