def game_hash
    {
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

def num_points_scored(name)
game_hash.each do |home_away, other|
    other.each do |pname, data|
        if pname == :players
            data.each do |pname2|
                if pname2[:name] == name
                    return pname2[:points]
                end
            end
        end
    end
end
end

def shoe_size(name)
game_hash.each do |home_away, other|
    other.each do |pname, data|
        if pname == :players
            data.each do |pname2|
                if pname2[:name] == name
                    return pname2[:shoe]
                end
            end
        end
    end
end
end

def team_colors(name)
    game_hash.each do |home_away, data|
        if (data[:team_name]== name)
            return data[:colors]
        end
    end
end

def team_names
    game_hash.collect do |home_away, data|
        data[:team_name]
    end
end

def player_numbers(name)
    pnum = []
    game_hash.each do |home_away, data|
        if (data[:team_name]== name)
            data.each do |team, players|
                if team == :players
                    players.each do |datas|
                        pnum << datas[:number]
                    end
                end
            end
        end
    end
pnum
end

def big_shoe_rebounds
    bs = 0
    reb = 0
    game_hash.each do |home_away, data|
        data[:players].each do |player|
            if player[:shoe] > bs
                bs = player[:shoe]
                reb = player[:rebounds]
            end
        end
    end
    reb
end

def player_stats(name)
    game_hash.each do |home_away, other|
        other.each do |pname, data|
            if pname == :players
                data.each do |pname2|
                    if pname2[:name] == name
                        pname2.delete(:name)
                        return pname2
                    end
                end
            end
        end
    end
    end
