require 'pry'

def game_hash
  game = {
    :home =>{
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players =>{
        "Alan Anderson"=>
        {:number =>0,
        :shoe =>16,
        :points =>22,
        :rebounds =>12,
        :assists =>12,
        :steals =>3,
        :blocks =>1,
        :slam_dunks=>1
        },

        "Reggie Evans"=>
        {:number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists =>12,
        :steals =>12,
        :blocks =>12,
        :slam_dunks=>7
        },

        "Brook Lopez"=>
        {:number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks=> 15
        },
        "Mason Plumlee"=>
        {:number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks=> 5
        },

        "Jason Terry"=>
        {:number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks=> 1
        }

      }

    },

    :away =>{:team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players =>{
          "Jeff Adrien"=>
        {:number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks=> 2
        },

        "Bismak Biyombo"=>
        {:number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks=> 10
        },

        "DeSagna Diop"=>
        {:number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks=> 5,
        },

        "Ben Gordon"=>
        {:number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks=> 0
        },

        "Brendan Haywood"=>
        {:number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22,
        :blocks => 5,
        :slam_dunks=> 12
        }
      }

  }
}
end



def num_points_scored(name)
  final_points= []

  game_hash.each do |location, team_data|
  team_data.each do |attribute, data|
            if attribute == :players
              data.each do |player_stats, names|
                  if player_stats == name

                      final_points << names[:points]



                  end
                end

              end
            end

  end

 final_points[0]

end



def shoe_size(name)
  final_size = []

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
        if attribute == :players
          data.each do |player_stats, names|
            if player_stats == name
              final_size << names[:shoe]
            end
          end
        end


    end

  end
  final_size[0]
end


def team_colors(team_name)
  final_colors = []
    game_hash.each do |location, team_data|
      team_data.each do |attribute, data|


          if data == team_name
              # team_data.each do |color|
                  final_colors << team_data[:colors]
              # end
          elsif data == team_name
                  final_colors << team_data[:colors]

                end
      end

    end

    final_colors.flatten

end


def team_names
  final_teams = []
  game_hash.each do |location, team_data|
        final_teams << team_data[:team_name]
  end
  final_teams
end


def player_numbers(team_name)
  team_numbers = []

    game_hash.each do |location, team_data|
            team_data.each do |attribute, data|
              if attribute== :players
                data.each do |player_stats, names|

                  if team_name == team_data[:team_name]
                      team_numbers<<names[:number]
                  end
                  end
                end
              end
            end
            team_numbers
    end








def player_stats(player)
  final_stats = []

game_hash.each do |location, team_data|
  team_data.each do |attribute, data|
            if attribute == :players
              data.each do |player_stats, stats|
                if player_stats == player
                      final_stats << stats

              end

              end
            end
  end
end

final_stats[0]

end


def big_shoe_rebounds
  team_numbers = []
  max = 17
    game_hash.each do |location, team_data|
            team_data.each do |attribute, data|
              if attribute== :players
                data.each do |player_stats, names|

                  if (names[:shoe] > max )
                      team_numbers<<names[:rebounds]

                  end
                  end
                end
              end
            end

         team_numbers.max





    end
