require "pry"

def game_hash
  hash = {
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
          :rebounds => 11,
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
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
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
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
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
        "Kemba Walker" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end





def num_points_scored(player_name)
  game_hash.each do |team, chars|
    game_hash[team][:players].each do |name, stats|
     if player_name == name
       return stats[:points] 
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |team, chars|
    game_hash[team][:players].each do |name, stats|
      if player_name == name
        return stats[:shoe]
      end
    end
  end
end
    

def team_colors(name_of_team)
  game_hash.each do |team, chars|
    game_hash[team].each do |name, stats|
      if name_of_team == stats
        return game_hash[team][:colors]
      end
    end
  end
end



def team_names
  teams = []
  game_hash.each do |team, chars|
      teams.push(game_hash[team][:team_name])
  end
  return teams
end



def player_numbers(name_of_team)
  array = []
  game_hash.each do |team, chars| 
    if game_hash[team].values.include?(name_of_team)
      chars.each do |name, stats|
        if stats.class == Hash
          stats.each do |player, values|
            values.each do |stat, int|
              if stat == :number
                array << int.to_i
              end
            end
          end
        end
      end
    end
  end
  return array
end




def player_stats(player_name)
  game_hash.each do |team, chars|
    chars.each do |name, stats|
      #binding.pry       

      if name == :players
        stats.each do |player, hash|
           #binding.pry  
           if player_name == player
           return hash
           end
         end
      end
    end
  end
end 


def big_shoe_rebounds
  hash = game_hash
  player_name = ""
  shoe_size = 0
  hash.each do |location, attributes|
    attributes.each do |attribute, info|
      if info.class == Hash
        info.each do |player, stats|
            stats.each do |stat, int|
              if stat == :shoe
                if int > shoe_size
                  shoe_size = int
                  player_name = player
                end
              end
            end
          end
        return hash[location][attribute][player_name][:rebounds]
      end
    end
  end
end