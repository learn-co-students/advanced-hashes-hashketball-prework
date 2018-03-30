# def game_hash
#   hashketball =
#   {
#     :home =>
#     {
#       :team_name => "",
#       :colors => [],
#       :players => {}
#     },
#     :away =>
#     {
#       :team_name => "",
#       :colors => [],
#       :players => {}
#     }
#   }
# end

def game_hash
hashketball =  {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [
      {
      :name => "Alan Anderson",
      :number => 0,
      :shoe => 16,
      :points => 22,
      :rebounds => 12,
      :assists => 12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1
      },
      {
      :name => "Reggie Evans",
      :number => 30,
      :shoe => 14,
      :points => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7
      },
      {
      :name => "Brook Lopez",
      :number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15
      },
      {
      :name => "Mason Plumlee",
      :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 12,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5
      },
      {
      :name => "Jason Terry",
      :number => 31,
      :shoe => 15,
      :points => 19,
      :rebounds => 2,
      :assists => 2,
      :steals => 4,
      :blocks => 11,
      :slam_dunks => 1
      }
    ]
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [
      {
      :name => "Jeff Adrien",
      :number => 4,
      :shoe => 18,
      :points => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7,
      :slam_dunks => 2
      },
      {
      :name => "Bismak Biyombo",
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 7,
      :blocks => 15,
      :slam_dunks => 10
      },
      {
      :name => "DeSagna Diop",
      :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5
      },
      {
      :name => "Ben Gordon",
      :number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
      },
      {
      :name => "Brendan Haywood",
      :number => 33,
      :shoe => 15,
      :points => 6,
      :rebounds => 12,
      :assists => 12,
      :steals => 22,
      :blocks => 5,
      :slam_dunks => 12
      }
    ]
  }
}
end

def num_points_scored (player_name)
result = ""
  game_hash.map do |team, info|
    info[:players].each do |player_score|
      if player_score[:name] == player_name
        result =player_score[:points]
      end
    end
  end
    result
end


def shoe_size (player_name)
  result = ""
    game_hash.map do |team, info|
      info[:players].each do |player_ss|
        if player_ss[:name] == player_name
          result = player_ss[:shoe]
        end
      end
    end
    result
end


def team_colors (team_color)
result = ""
  game_hash.map do |team, info|
    if info[:team_name] == team_color
      result = info[:colors]
    end
  end
  result
end


def team_names

  game_hash.map do |team, info|
     info[:team_name]
    end

end


def player_numbers (team_name)
  result = []
  game_hash.map do |team, info|
    if info[:team_name] == team_name
       info[:players].map do |player_info|
         player_info.map do |k,v|
           if k == :number
             result.push(v)
            end
          end
        end
      end
    end
  result
end


def player_stats (player_name)
result = {}
  game_hash.map do |team, info|
    info[:players].map do |player_info|

      if player_info[:name] == player_name
        player_info.delete(:name)
        result = player_info
      end
    end
  end
  result
end


def big_shoe_rebounds
  big_shoe = 0
  rebounds = 0

  game_hash.map do |team, info|
    info[:players].map do |current|
      if current[:shoe] > big_shoe
        current[:shoe] = big_shoe
        rebounds = current[:rebounds]
      end
    end
  end
  rebounds
end
