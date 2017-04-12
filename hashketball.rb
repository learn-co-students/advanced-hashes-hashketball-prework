# Write your code here!

require "pry"

def game_hash
  game_hash = {:home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black","White"],
    :players => {"Alan Anderson" => {
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
      :slam_dunks => 1
      }
    }
  },
    :away => {
    :team_name => "Charlotte Hornets",
    :colors =>["Turquoise","Purple"],
    :players => {"Jeff Adrien" => {
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
  return game_hash
end

def num_points_scored(player)
  game_hash.each_value do |keys|
    keys.each do |symbol, value|
      if symbol == :players
        value.each do |name, info|
          if name == player
            info.each do |stat_name, stat_data|
              if stat_name == :points
                return stat_data
              end
           end
         end
        end
      end
    end
  end
end


def shoe_size(player)
  game_hash.each_value do |keys|
    keys.each do |symbol, value|
      if symbol == :players
        value.each do |name, info|
          if name == player
            info.each do |stat_name, stat_data|
              if stat_name == :shoe
                return stat_data
              end
           end
         end
        end
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |key, value|
    value.each do |keys_1, data_1|
      if data_1 == team
      value.each do|keys_2, data_2|
        if keys_2 == :colors
          return data_2
        end
      end
    end
  end
 end
end

def team_names
  t_names = []
  game_hash.each do |key, value|
    value.each do |keys_1, data_1|
      if keys_1 == :team_name
        t_names.push(data_1)
      end
    end
  end
 return t_names
end

def player_numbers(team)
  team_numbers = []
  game_hash.each do |key, value|
    value.each do |keys_1, data_1|
      if data_1 == team
       value.each do |keys_2, data_2|
         if keys_2 == :players
           data_2.each do |name, stats|
             stats.each do |stat_name, stat_data|
               if stat_name == :number
                 team_numbers.push(stat_data)
               end
             end
           end
         end
       end
     end
   end
 end
 return team_numbers
 end


def player_stats(player)
  game_hash.each do |key, value|
    value.each do |keys_1, data_1|
      if keys_1 == :players
        data_1.each do |keys_2, data_2|
          if keys_2 == player
            return data_2
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  shoe_size_data = []
  #collect all shoe sizes, compare them, and then return the rebounds associated with the shoe sizes.
  #since both the rebounds and the shoe sizes are in the same layer, I did not have to build another
  #iteration block
  game_hash.each do |key, value|
    value.each do |keys_1, data_1|
      if keys_1 == :players
        data_1.each do |keys_2, data_2|
          data_2.each do |stat_name, stat_data|
            if stat_name == :shoe
              shoe_size_data.push(stat_data)
              shoe_size_data.sort!
            end
            if stat_data == shoe_size_data[shoe_size_data.length - 1]
              data_2.each do |stat_name1, stat_data1|
                if stat_name1 == :rebounds
                  return stat_data1
                end
              end
            end
          end
        end
      end
    end
  end
end

def most_points_scored
  points_data = []
 # collect all the points data to compare them and find out what the greatest number of points is
  game_hash.each do |key, value|
    value.each do |key_1, data_1|
      if key_1 == :players
        data_1.each do |player_name, data_2|
          data_2.each do |stat_name, stat_data|
            if stat_name == :points
              points_data.push(stat_data)
              points_data.sort!
            end
          end
        end
      end
    end
  end
 # once we have the greatest number of points iterate through to find out what player it is associated with
  game_hash.each do |key, value|
    value.each do |key_1, data_1|
      if key_1 == :players
        data_1.each do |player_name, data_2|
          data_2.each do |stat_name, stat_data|
            if stat_name == :points && stat_data == points_data[-1]
              return player_name
            end
          end
        end
      end
    end
 end
end

def winning_team
  home_points = []
  away_points = []
 #first iterate through the home points to collect points scored by each player
  game_hash.each do |key, value|
    if key == :home
      value.each do |key_1, data_1|
        if key_1 == :players
          data_1.each do |player_name, stats|
            stats.each do |stat_name, stat_data|
              if stat_name == :points
                home_points.push(stat_data)
              end
            end
          end
        end
      end
    end
  end
#second iterate through the away points to collect points scored by each player
 game_hash.each do |key, value|
    if key == :away
      value.each do |key_1, data_1|
        if key_1 == :players
          data_1.each do |player_name, stats|
            stats.each do |stat_name, stat_data|
              if stat_name == :points
                away_points.push(stat_data)
              end
            end
          end
        end
      end
    end
  end
 #add the points to find out the total for home
 sum_home_points = 0
 home_points.each do |n|
   sum_home_points += n
 end
 #add the points to find out the total for away
 sum_away_points = 0
 away_points.each do |n|
   sum_away_points += n
 end
 #if home has more points return home name
 if sum_home_points > sum_away_points
   game_hash.each do |key, value|
     if key == :home
     value.each do |key_1, data_1|
       if key_1 == :team_name
         return data_1
       end
     end
   end
   end
 end
 #if away has more points return away name
 if sum_home_points < sum_away_points
    game_hash.each do |key, value|
     if key == :away
     value.each do |key_1, data_1|
       if key_1 == :team_name
         return data_1
       end
     end
    end
   end
 end
end

def player_with_longest_name
  names = []
 #iterate through and collect all player names into an array
  game_hash.each do |key, value|
    value.each do |key_1, data_1|
      if key_1 == :players
        data_1.each do |player_name, stats|
          names.push(player_name)
        end
      end
    end
  end
  #user ruby method through sort through the array and return the strings with the
  #longest length
  return names.max_by(&:length)
end


def long_name_steals_a_ton?
  names = []
  # first iterate through to find out the longest name. I copied the method above
  # now that I am typing my comments I think I could of just called the method rather
  # than re coding
  game_hash.each do |key, value|
    value.each do |key_1, data_1|
      if key_1 == :players
        data_1.each do |player_name, stats|
          names.push(player_name)
        end
      end
    end
  end
  long_name = names.max_by(&:length)

  steals = []
  #Here I iterate through to collect all the steals and sort them, to find out
  #the highest number of steals
  game_hash.each do |key, value|
    value.each do |key_1, data_1|
      if key_1 == :players
        data_1.each do |player_name, stats|
          stats.each do |stat_name, number|
            if stat_name == :steals
              steals.push(number)
              steals.sort!
            end
          end
        end
      end
    end
  end
  # Once I collect the highest number of steals and the player witht he longest name
  # I iterate through again and confirm that the player with the longest name
  # has the most steals as well
  game_hash.each do |key, value|
    value.each do |key_1, data_1|
      if key_1 == :players
        data_1.each do |player_name, stats|
          stats.each do |stat_name, number|
            if long_name == player_name && stat_name == :steals && number == steals[-1]
              return true
            end
          end
        end
      end
    end
  end
end
