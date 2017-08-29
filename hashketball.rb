require "pry"

def game_hash
  game_data = {:home=>{:team_name=>"Brooklyn Nets", :colors=>["Black", "White"],
                :players=>{"Alan Anderson"=>{:number=>0,
                                :shoe=>16, :points=>22, :rebounds=>12, :assists=>12, :steals=>3 ,
                                :blocks=>1,:slam_dunks=>1},
                          "Reggie Evans"=>{:number=>30,
                                :shoe=>14, :points=>12, :rebounds=>12, :assists=>12, :steals=>12 ,
                                :blocks=>12,:slam_dunks=>7},
                          "Brook Lopez"=>{:number=>11,
                                :shoe=>17, :points=>17, :rebounds=>19, :assists=>10, :steals=>3 ,
                                :blocks=>1,:slam_dunks=>15},
                          "Mason Plumlee"=>{:number=>1,
                                :shoe=>19, :points=>26, :rebounds=>12, :assists=>6, :steals=>3 ,
                                :blocks=>8,:slam_dunks=>5},
                          "Jason Terry"=>{:number=>31,
                                :shoe=>15, :points=>19, :rebounds=>2, :assists=>2, :steals=>4 ,
                                :blocks=>11,:slam_dunks=>1}}
                    },
            :away=>{:team_name=>"Charlotte Hornets", :colors=>["Turquoise", "Purple"],
              :players=>{"Jeff Adrien"=>{:number=>4,
                            :shoe=>18, :points=>10, :rebounds=>1, :assists=>1, :steals=>2 ,
                            :blocks=>7,:slam_dunks=>2},
                        "Bismak Biyombo"=>{:number=>0,
                              :shoe=>16, :points=>12, :rebounds=>4, :assists=>7, :steals=>7 ,
                              :blocks=>15,:slam_dunks=>10},
                        "DeSagna Diop"=>{:number=>2,
                              :shoe=>14, :points=>24, :rebounds=>12, :assists=>12, :steals=>4 ,
                              :blocks=>5,:slam_dunks=>5},
                        "Ben Gordon"=>{:number=>8,
                              :shoe=>15, :points=>33, :rebounds=>3, :assists=>2, :steals=>1 ,
                              :blocks=>1,:slam_dunks=>0},
                        "Brendan Haywood"=>{:number=>33,
                              :shoe=>15, :points=>6, :rebounds=>12, :assists=>12, :steals=>22 ,
                              :blocks=>5,:slam_dunks=>12}
                            }
                      }
                }
  return game_data
end


def num_points_scored(player_name)

  game_hash.each do |home_or_away, values|

      if values[:players].include?(player_name)
        return values[:players][player_name][:points]
      end
  end
end


def shoe_size(player_name)

  game_hash.each do |home_or_away, values|

      if values[:players].include?(player_name)
        return values[:players][player_name][:shoe]
      end
  end
end


def team_colors(team_name)

  game_hash.each do |home_or_away, values|
    if values[:team_name] == team_name
      return values[:colors]
    end
  end
end


def team_names
  team_names_compiled = []
  game_hash.each do |home_or_away, values|
    values.each do |key, value|
      if key == :team_name
        team_names_compiled << value
      end
    end
  end
  return team_names_compiled
end


def player_numbers(team)
  player_numbers_compiled = []

  game_hash.each do |home_or_away, data|
    if data[:team_name] == team
      data[:players].each do |player, metric|
        player_numbers_compiled << metric[:number]
      end
    end
  end

  return player_numbers_compiled
end


def player_stats(player)
  game_hash.each do |home_or_away, data|
    if data[:players].include?(player)
      return data[:players][player]
    end
  end
end

def big_shoe_rebounds
  biggest_shoe = 0
  most_rebounds = 0

  game_hash.each do |home_or_away, data|
    data[:players].each do |player, player_value|
      binding.pry
        if player_value[:shoe] > biggest_shoe
          biggest_shoe = player_value[:shoe]
          most_rebounds = player_value[:rebounds]
        end
    end
  end
  return most_rebounds
end
