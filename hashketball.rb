require "pry"

def game_hash
gamehash = {
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

def num_points_scored(name)
  player_point = ""
  game_hash.each do |home_or_away, team_data|
    team_data.each do |data, attributes|
      if data == :players
        attributes.each do |player, stats|
          if player == name
            stats.each do |stat, points|
              if stat == :points
                player_point = points
              end
            end
          end
        end
      end
    end
  end
  player_point
end

def shoe_size(name)
  player_shoe_size = ""
  game_hash.each do |home_or_away, team_data|
    team_data.each do |data, attributes|
      if data == :players
        attributes.each do |player, stats|
          if player == name
            stats.each do |stat, shoe|
              if stat == :shoe
                player_shoe_size = shoe
              end
            end
          end
        end
      end
    end
  end
  player_shoe_size
end

def team_colors(team_name)
  team_colors_output = nil
  game_hash.each do |home_or_away, team_data|
    if team_data.values.include?(team_name)
      team_data.each do |data, attribute|
        if data == :colors
          team_colors_output = attribute
        end
      end
    end
  end
  team_colors_output
end

def team_names
  team_names_array = Array.new
  game_hash.each do |home_or_away, team_data|
    team_data.each do |data, attribute|
      if data == :team_name
        team_names_array << attribute
      end
    end
  end
  team_names_array
end

def player_numbers(team_name)
  player_numbers_array = Array.new
  game_hash.each do |home_or_away, team_data|
    if team_data.values.include?(team_name)
      team_data.each do |data, attribute|
        if data == :players
          attribute.each do |player, stats|
            stats.each do |stat, number|
              if stat == :number
                player_numbers_array << number
              end
            end
          end
        end
      end
    end
  end
  player_numbers_array
end

def player_stats(name)
  player_stats_hash = Hash.new
  game_hash.each do |home_or_away, team_data|
    team_data.each do |data, attributes|
      if data == :players
        attributes.each do |player, stats|
          if player == name
            player_stats_hash = stats
          end
        end
      end
    end
  end
  player_stats_hash
end

def big_shoe_rebounds
  shoe_size_array = Array.new
  rebound = nil
  game_hash.each do |home_or_away, team_data|
    team_data.each do |data, attributes|
      if data == :players
        attributes.each do |player, stats|
          stats.each do |stat, value|
            if stat == :shoe
              shoe_size_array << value
            end
            if stat == :shoe && value == shoe_size_array.max
              rebound = game_hash[home_or_away][data][player][:rebounds]
            end
          end
        end
      end
    end
  end
  rebound
end
