# Write your code here!
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

game_hash.each do |team, team_hash|



    team_hash[:players].each do |player, player_hash|

       if player[:name] == name

          return player[:points]
      end

    end

  end
end

def shoe_size(name)

game_hash.each do |team, team_hash|



    team_hash[:players].each do |player, player_hash|

       if player[:name] == name

          return player[:shoe]
      end

    end

  end
end


def team_colors (team_name)

  game_hash.each do |team, team_hash|

      team_hash[:players].each do |player, player_hash|

         if player[:name] == name

            return player[:shoe]
        end

      end

    end
  end

  def team_colors(team_name)

  game_hash.each do |location, team_hash|



    if team_hash[:team_name] == team_name

      return team_hash[:colors]

    end
  end
end

def team_names

  x = []
  game_hash.collect do |location, team_hash|

     x << team_hash[:team_name]

  end
 x
end

def player_numbers(team_name)

  arr = []
  game_hash.each do |team, team_hash|

    puts team_hash[:team_name]

    if team_hash[:team_name] == team_name

     team_hash[:players].each do |value|
       value.each do |spec,value|

          if spec == :number
            arr <<  value
            end
       end

      end
    end
  end
  arr
end




def player_stats(player_name)
  arr = []
  game_hash.each do |location, team_hash|

    team_hash[:players].collect do |player_hash|


      if player_hash[:name] == player_name

          return player_hash





      end
    end
  end

end

def player_stats(player_name)
  arr = []
  hash = {}
  game_hash.each do |location, team_hash|

        team_hash[:players].collect do |player_hash|


          if player_hash[:name] == player_name


              return player_hash.tap { |h| h.delete(:name) }


          end
        end
  end
end


def big_shoe_rebounds

shoe_size = 0

rebounds = 0

  game_hash.values.each do |team_info|

    team_info[:players].each do |player|

      if player[:shoe] > shoe_size

        shoe_size = player[:shoe]

        rebounds = player[:rebounds]
      end
    end
  end
  return rebounds
end
