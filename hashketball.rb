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




def num_points_scored(name)
  output = nil
  game_hash.each do |place, data|
    data.each do |attributes, select_data|
      if attributes == :players
        select_data.each do |info|
          if info[:player_name] == name
              output = info[:points]
          end
        end  
      end
    end
  end
  output
end 


def shoe_size(name)
  output = nil
  game_hash.each do |place, data|
    data.each do |attributes, select_data|
      if attributes == :players
        select_data.each do |info|
          if info[:player_name] == name
              output = info[:shoe]
          end
        end  
      end
    end
  end
  output
end 
  
def team_colors(team)
  output = nil
  game_hash.each do |place, data|
    data.each do |attributes, second_data|
        if second_data == team
          output = data[:colors]
        end
      end
    end
    output
  end

def team_names
  jj = []
  game_hash.each do |place, data|
    #binding.pry
    jj.push(data[:team_name])
  end
  jj
end

def player_numbers(teamzzz)
  output = []
  game_hash.each do |place, data|
    if data[:team_name] == teamzzz
      data.each do |attributes, select_data|
        if attributes == :players
          select_data.each do |info|
          output.push(info[:number])
          end
        end
      end
    end
  end
  output
end 

def big_shoe_rebounds
  player = player_biggest_shoe_size
  player.fetch(:rebounds)
end

def player_biggest_shoe_size
  players.sort_by {|player| player.fetch(:shoe) }.last
end

def players
  home_players = game_hash.fetch(:home).fetch(:players)
  away_players = game_hash.fetch(:away).fetch(:players)
  home_players + away_players
end