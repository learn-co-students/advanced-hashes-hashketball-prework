require 'pry'

def game_hash
  score_hash = {
    :home => {team_name: "Brooklyn Nets" , colors: ["Black", "White"], :players => {
      "Alan Anderson" =>
        {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
      "Reggie Evans" =>
        {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
      "Brook Lopez" =>
        {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
      "Mason Plumlee" =>
        {number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
      "Jason Terry" =>
        {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}

    }
  },

    :away => {team_name: "Charlotte Hornets", colors: ["Turquoise", "Purple"], :players => {
      "Jeff Adrien" =>
        {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
      "Bismak Biyombo" =>
        {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
      "DeSagna Diop" =>
        {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
      "Ben Gordon" =>
        {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
      "Brendan Haywood" =>
        {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}

    }
  }
}
end

def num_points_scored(name)
  player_points = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, statistic|
          if player == name
            statistic.each do |category, score|
              if category == :points
                player_points = game_hash[location][attribute][player][category]
              end
            end
          end
        end
     end
    end
  end
player_points
end

def shoe_size(name)
  player_shoes = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, statistic|
          if player == name
            statistic.each do |category, number|
              if category == :shoe
                player_shoes = game_hash[location][attribute][player][category]
              end
            end
          end
        end
      end
    end
  end
  player_shoes
end

def team_colors (team)
  colors = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == team
        colors = game_hash[location][:colors]
      end
    end
  end
 colors
end

def team_names
  team_name_array = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        team_name_array << data
      end
    end
  end
  team_name_array
end

def player_numbers(team)
  player_numbers_array = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == team
        game_hash[location].each do |attribute, data|
          if attribute == :players
            data.each do |player, statistic|
              statistic.each do |category, num|
                if category == :number
                  player_numbers_array << num
                end
              end
            end
          end
        end
      end
    end
  end
  player_numbers_array
end


def player_stats(player_for_stats)
  stats_hash = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, statistic|
          if player == player_for_stats
            stats_hash = statistic
          end
        end
      end
    end
  end
  stats_hash
end



def big_shoe_rebounds
  big_shoes = 0
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, statistic|
          statistic.each do |category, num|
            if category == :shoe
                if num > big_shoes
                  big_shoes = num
                  rebounds = game_hash[location][attribute][player][:rebounds]
              end
            end
          end
        end
      end
    end
  end
rebounds
end
