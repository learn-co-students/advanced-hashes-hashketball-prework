require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        }, {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        }, {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        }, {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        }, {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        }, {
          player_name: "Bismak Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        }, {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        }, {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        }, {
          player_name: "Brendan Haywood",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end


def num_points_scored(name_fed)

points_scored = ""

  game_hash.each do |home_or_away, info_group|

    info_group.each do |label, specifics|

      if label == :players
        specifics.each do |stat|


            stat.each do |category, value|
              if value == name_fed
                stat.each do |category, value|
                  if category == :points

                  points_scored = value

                end


              end


            end

          end


        end


      end

    end


  end



points_scored



end


def shoe_size(name_fed)


  the_shoe = ""

    game_hash.each do |home_or_away, info_group|

      info_group.each do |label, specifics|

        if label == :players
          specifics.each do |stat|


              stat.each do |category, value|
                if value == name_fed
                  stat.each do |category, value|
                    if category == :shoe

                    the_shoe = value

                  end


                end


              end

            end


          end


        end

      end


    end



  the_shoe



  end







def team_colors(team_name)



home_team = game_hash[:home][:team_name]
away_team = game_hash[:away][:team_name]

if team_name == home_team

colors = game_hash[:home][:colors]

elsif team_name == away_team

  colors = game_hash[:away][:colors]

end

colors

end


def players

home_players = game_hash.fetch(:home)
away_players = game_hash.fetch(:away)

home_players = home_players.fetch(:players)
away_players = away_players.fetch(:players)

players = away_players + home_players



end





def find_the_player(name)




end


def find_the_team(team_name)



end



def teams
  game_hash.values
end



def team_names

teams = []

home_team = game_hash[:home][:team_name]
away_team = game_hash[:away][:team_name]

teams << home_team
teams << away_team

teams

end


def player_numbers(team_name)

  the_numbers = []

    game_hash.each do |home_or_away, info_group|

  info_group.each do |label, specifics|

    if specifics == team_name

      info_group.each do |label, specifics|

        if label == :players

              specifics.each do |player_blob|
                player_blob.each do |inner_label, inner_value|

                if inner_label == :number

                    the_numbers << inner_value


                  end


              end

            end


          end

        end
        end

      end


    end



  the_numbers





end

def player_stats(name_given)

  the_stats = {}

    game_hash.each do |home_or_away, info_group|

  info_group.each do |label, specifics|

        if label == :players

              specifics.each do |player_blob|

                player_blob.each do |inner_label, inner_value|

                if inner_value == name_given

                  the_stats = player_blob


                  end


            end


          end


        end

      end


    end


the_stats.dup.tap { |h| h.delete(:player_name) }

end



def player_biggest_shoe_size


  players.sort_by {|player| player.fetch(:shoe) }.last
end


def big_shoe_rebounds

  player = player_biggest_shoe_size
  player.fetch(:rebounds)


end
