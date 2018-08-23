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

def num_points_scored(player_name)
  points = []
  game_hash.each do |game, team|
    team.each do |attribute, values|
      if attribute == :players
        values.each do |person, data|
          if person[:player_name] == player_name
            points << person[:points]
        end
    end
  end
end
end
return points[0]
end

def shoe_size(player_name)
  shoe = []
  game_hash.each do |game, team|
    team.each do |attribute, values|
      if attribute == :players
        values.each do |person, data|
          if person[:player_name] == player_name
            shoe << person[:shoe]
        end
    end
  end
end
end
return shoe[0]
end

def team_colors(team_name)
  colors = []
  game_hash.each do|game, team|
    if team[:team_name] == team_name
      colors << team[:colors]
  end
end
return colors[0]
end

def team_names
  name = []
  game_hash.each do|game, team|
    name << team[:team_name]
end
return name
end


def player_numbers(team_name)
    jerseys = []
    game_hash.each do|game, team|
      if team[:team_name] == team_name
      team.each do |attribute, values|
        if attribute == :players
          values.each do |person, data|
              jerseys << person[:number]
            end
          return jerseys
        end
      end
  end
end
end


def player_stats(player_name)
  game_hash.keys.each do |team|
     if game_hash[team][:players].keys.include?(player_name)
       return game_hash[team][:players][player_name]
     end
    end
  end

def big_shoe_rebounds
  biggest_shoe = nil
  biggest_shoe_player_rebounds = nil

  game_hash.each do |game, team|
    team.each do |attribute, values|
      if attribute == :players
        values.each do |person, data|
          binding.pry
          data.each do |stat, value|
            if stat == :shoe
              if biggest_shoe == nil
                biggest_shoe = value
                biggest_shoe_player_rebounds = game_hash[game][:players][person][:rebounds]
              elsif value > biggest_shoe
                biggest_shoe = value
                biggest_shoe_player_rebounds = game_hash[game][:players][person][:rebounds]
              end
            end
          end
        end
      end
    end
  end
  biggest_shoe_player_rebounds
end
