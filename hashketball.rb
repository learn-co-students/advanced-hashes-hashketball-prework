def game_hash
    {
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

def num_points_scored(name)
  game_hash.each do |home_away,data|
    data[:players].each do |key,value|
      if key==name
        return value[:points]
      end
    end
  end
end

def shoe_size (name)
  game_hash.each do |home_away,data|
    data[:players].each do |key,value|
      if key==name
        return value[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |home_away, data|
    if data[:team_name]==team_name
      return data[:colors]
    end
  end
end

def team_names 
  arr=[]
  game_hash.each do |home_away,data|
    arr << data[:team_name]
  end
  arr
end

def player_numbers(team_name)
  arr=[]
  game_hash.each do |home_away,data|
    data[:players].each do |key,value|
       if data[:team_name]==team_name
         arr << value[:number]
    end
  end
end
  arr
end
      
def player_stats(name)
  game_hash.each do |home_away,data|
    data[:players].each do |key,value|
      if key==name
        return value
      end
    end
  end
end

def big_shoe_rebounds
  rebounds=0
  max=0
  game_hash.each do |home_away,data|
    data[:players].each do |key,value|
      if value[:shoe]>max
        max=value[:shoe]
        rebounds=value[:rebounds]
      end
    end
  end
  rebounds
end

#bonus 
def most_points_scored
  max=0
  name=""
  game_hash.each do |home_away,data|
    data[:players].each do |key,value|
      if value[:points]>max
        max=value[:points]
        name=key
      end
    end
  end
  name
end

def winning_team 
  sum_home=0
  sum_away=0
  game_hash[:home][:players].each do |key,value|
      sum_home+=value[:points]
    end
  game_hash[:away][:players].each do |key,value|
      sum_away+=value[:points]
  end
  if sum_away>sum_home
    return "away"
  else
    return "home"
  end
end
  
def player_with_longest_name
  max=0
  name=""
  game_hash.each do |home_away,data|
    data[:players].each do |key|
      if key.length>max
        max=key.length
        name=key
      end
    end
  end
  name
end

#super bonus
def long_name_steals_a_ton
  most_steal=0
  max=0
  steals=0
  game_hash.each do |home_away,data|
    data[:players].each do |key,value|
      if value[:steals]>most_steal
        most_steal=value[:steals]
      end
      if key.length>max
        max=key.length
      steals=value[:steals]
    end
  end
end
  if steals>most_steal
    return true
end
end
