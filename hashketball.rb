require "pry"

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

def players
  players_level = game_hash.values.map do |team_level|
    team_level[:players]
  end 
  players_level.flatten
end 

def find_player(player_name)
  players.find do |player_hash|
    player_hash[:player_name] == player_name
  end
end

def num_points_scored(player_name)
  find_player(player_name)[:points]
end

def shoe_size(player_name)
  find_player(player_name)[:shoe]
end

def team_colors(team)
  if team == "Charlotte Hornets"
    game_hash[:away][:colors]
  elsif team == "Brooklyn Nets"
    game_hash[:home][:colors]
  else
    nil 
  end
end

def team_names()
  new_array = []
  
  game_hash.each do |location, team_data|
    team_data.each do |attribute, values|
      if attribute == :team_name
        new_array.push(values)
      end
    end
  end
  new_array 
end


def player_numbers(team)
  array2 = []
  game_hash.each do |location, team_data|
      team_data.each do |attribute, values|
          if attribute == :players
            values.each do |person, data|
              data.each do |i, j|
                if i == :number
                  array2.push(j)
                end

              end
            end
          end
      end
  end
  return array2
end 


def player_stats(player_name)
  new_array=[]
  
  game_hash.each do |location, team_data|
    team_data.each do |attribute, values|
      if attribute == :players
        values.each do |person, data|
          if person == player_name
            new_array.push(data)
          end
        end
      end
    end
  end
  new_array[0]
end



def big_shoe_rebounds(game)
  max_player = nil
  game.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      max_player ||= player_hash
      max_player = player_hash if player_hash[:shoe_size] > max_player{:shoe_size]
       end
    end

end 






