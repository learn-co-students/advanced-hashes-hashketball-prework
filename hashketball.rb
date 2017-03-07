require 'pry'


def game_hash
  game = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
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

def num_points_scored(roster)
  output = ""
  game_hash.each do |location, categories|
    categories.each do |attributes, values|
      if attributes == :players
        values.each do |name, stats|
          if name == roster
            stats.each do |category, num|
              if category == :points
                output = num
              end
            end
          end
        end
      end
    end
  end
  output
end

def shoe_size(players_name)
  shoe_output = ""
  game_hash.each do |location, categories|
    categories.each do |keys, value|
      if keys == :players
        value.each do |name, stats|
          if name == players_name
            stats.each do |shoe, size|
              if shoe == :shoe
              shoe_output = size
          end
        end
      end
    end
    end
  end
end
shoe_output
end

def team_colors(team_name)
  colors = ""
  game_hash.each do |location, categories|
    if categories.values.include?(team_name)
    categories.each do |key, value|
      if key == :colors
        colors = value
      end
    end
  end
end
colors
end

def team_names
  teams = []
  game_hash.each do |location, categories|
      categories.each do |key, value|
        if key == :team_name
      teams << value
    end
  end
end
teams
end

def player_numbers(team_name)
   if game_hash[:home][:team_name] == team_name
     game_hash[:home][:players].map do |player, attribute|
       attribute[:number]
     end
   elsif game_hash[:away][:team_name] == team_name
     game_hash[:away][:players].map do |player, attribute|
       attribute[:number]
     end
   end
 end

 def player_stats(pl_name)
   if game_hash[:home][:players].include?(pl_name)
     game_hash[:home][:players][pl_name]
   elsif game_hash[:away][:players].include?(pl_name)
     game_hash[:away][:players][pl_name]
 end
 end

 def big_shoe_rebounds
   big_shoe = 0
   rebounder = 0
   game_hash.each do |locations, category|
     category[:players].each do |key, value|
       if value[:shoe] > big_shoe
         big_shoe = value[:shoe]
         rebounder = value[:rebounds]
 end
 end
 end
 rebounder
 end
