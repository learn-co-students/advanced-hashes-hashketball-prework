require "pry"
# Write your code here!
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

# good_practices

def num_points_scored(player)
  game_hash.each do |location, team_data|
    # first level location -> gives :home, :away
    # binding.pry
    team_data.each do |attribute, data1|
      # 2nd level attribute -> :team_name, :colors, :players
      # binding.pry
      if attribute.to_s == "players"
        data1.each do |name, data2|
          # 3rd level name -> gives "Alan Anderson"
          # binding.pry
          if name.to_s == player
            data2.each do |statistic, value|
              # 4th level stat -> gives :number, :shoe...
              # binding.pry
              if statistic.to_s == "points"
                return value
              end
            end
          end
        end
      end
    end
  end
end

def shoe_size(player)
  game_hash.each do |location, team_data|
    # first level location -> gives :home, :away
    # binding.pry
    team_data.each do |attribute, data1|
      # 2nd level attribute -> :team_name, :colors, :players
      # binding.pry
      if attribute.to_s == "players"
        data1.each do |name, data2|
          # 3rd level name -> gives "Alan Anderson"
          # binding.pry
          if name.to_s == player
            data2.each do |statistic, value|
              # 4th level stat -> gives :number, :shoe...
              # binding.pry
              if statistic.to_s == "shoe"
                return value
              end
            end
          end
        end
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |location, team_data|
    # first level location -> gives :home, :away
    # binding.pry
    team_data.each do |attribute, data1|
      # 2nd level attribute -> :team_name, :colors, :players
      # binding.pry
      if data1.to_s == team
        # binding.pry
        return game_hash[location][:colors]
        # if value.to_s
        #   binding.pry
        #   return data1
        # end
      end
    end
  end
end

def team_names
  team_array = []
  game_hash.each do |location, team_data|
    # first level location -> gives :home, :away
    # binding.pry
    team_data.each do |attribute, data1|
      # 2nd level attribute -> :team_name, :colors, :players
      # binding.pry
      if attribute.to_s == "team_name"
        team_array << data1
        # binding.pry
      end
    end
  end
  return team_array
end

def player_numbers(team)
  number_array = []
  game_hash.each do |location, team_data|
    # first level location -> gives :home, :away
    # binding.pry
    team_data.each do |attribute, data1|
      # 2nd level attribute -> :team_name, :colors, :players
      if data1.to_s == team
        # binding.pry
        game_hash[location][:players].each do |name, stats|
          # binding.pry
          stats.each do |category, value|
            if category.to_s == "number"
              # binding.pry
              number_array << value
            end
          end
        end
      end
    end
  end
  return number_array
end

def player_stats(player)
  # stats_hash = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data1|
      if attribute.to_s == "players"
        data1.each do |name, data2|
          if name.to_s == player
            return data2
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  compare_shoe = 0
  largest_shoe = 0
  player_with_largest_shoe = ""
  rebounds = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data1|
      if attribute.to_s == "players"
        data1.each do |name, stats|
          stats.each do |category, value|
            if category.to_s == "shoe"
              # binding.pry
              compare_shoe = value
              if compare_shoe > largest_shoe
                largest_shoe = compare_shoe
                player_with_largest_shoe = name.to_s
                # binding.pry
              end
            end
            if category.to_s == "rebounds"
              rebounds = value
              # binding.pry
            end
          end
        end
      end
    end
  end
  return rebounds
end

def most_points_scored
  player = ""
  # points_compare = 0
  most_points = 0
  game_hash.each do |location, data1|
    data1.each do |category, data2|
      if category.to_s == "players"
        data2.each do |name, data3|
          data3.each do |statistic, value|
            if statistic.to_s == "points"
              if value > most_points
                player = name
                most_points = value
              end
            end
          end
        end
      end
    end
  end
  puts "#{player} scored #{most_points} points! That's the most!"
end

most_points_scored

def winning_team
  home_team_name = ""
  home_team_points = 0
  away_team_name = ""
  away_team_points = 0
  winner = ""
  game_hash.each do |location, data1|
    data1.each do |category, data2|
       # binding.pry
      if location.to_s == "home" && category.to_s == "team_name"
        home_team_name = data2.to_s
      elsif location.to_s == "away" && category.to_s == "team_name"
        away_team_name = data2.to_s
        # binding.pry
      end
      if category.to_s == "players"
        data2.each do |name, data3|
          data3.each do |statistic, value|
            if statistic.to_s == "points" && location.to_s == "home"
              home_team_points += value
            elsif statistic.to_s == "points" && location.to_s == "away"
              away_team_points += value
            end
          end
        end
      end
    end
  end
  if home_team_points > away_team_points
    winner = home_team_name
  elsif home_team_points < away_team_points
    winner = home_team_name
  end
  puts "#{home_team_name} scored #{home_team_points} points, and #{away_team_name} scored #{away_team_points} points! That makes #{winner} the winner!"
end
winning_team


def player_with_longest_name
  player = ""
  game_hash.each do |location, team_data|
    team_data.each do |category, data1|
      if category.to_s == "players"
        data1.each do |name, data2|
          if name.to_s.length > player.length
            player = name.to_s
            # binding.pry
          end
        end
      end
    end
  end
  puts "#{player} has the longest name!"
end

player_with_longest_name


def long_name_steals_a_ton?
  current_player = ""
  current_steals = 0
  longest_name = ""
  most_steals_name = ""
  most_steals = 0
  game_hash.each do |location, team_data|
    team_data.each do |category, data1|
      if category.to_s == "players"
        data1.each do |name, data2|
          current_player = name.to_s
          if longest_name.length < current_player.to_s.length
            longest_name = current_player.to_s
          end
          # binding.pry
          data2.each do |statistic, value|
            if statistic.to_s == "steals" && most_steals < value
              if most_steals_name.length < current_player.to_s.length
                current_steals = value
                most_steals = value
                most_steals_name = current_player
                # binding.pry
              end
            end
          end
        end
      end
    end
  end
  # puts longest_name
  # puts most_steals_name
  return longest_name == most_steals_name
end
long_name_steals_a_ton?
