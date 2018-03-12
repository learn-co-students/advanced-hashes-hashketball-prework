require "pry"

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        }, {
          :player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        }, {
          :player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        }, {
          :player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        }, {
          :player_name => "Jason Terry",
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
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        }, {
          :player_name => "Bismak Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        }, {
          :player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        }, {
          :player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        }, {
          :player_name => "Brendan Haywood",
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
  # home = game_hash[:home][:players].find do |element|
  #   element.values.include?(name)
  # end
  #
  # away = game_hash[:away][:players].find do |element|
  #   element.values.include?(name)
  # end
  #
  # home == nil ? away[:points] : home[:points]

team = game_hash.keys.find do |key, value|
  game_hash[key][:players].find do |element|
    element.values.include?(name)
  end
end


player = game_hash[team][:players].find do |element|
  element.values.find do |stat|
    stat == name
  end
end

player[:points]
end


def shoe_size(name)

team = game_hash.keys.find do |key, value|
  game_hash[key][:players].find do |element|
    element.values.include?(name)
  end
end


player = game_hash[team][:players].find do |element|
  element.values.find do |stat|
    stat == name
  end
end

player[:shoe]
end

def team_colors(team)
  place = game_hash.keys.find do |key, value|
    game_hash[key][:team_name].include?(team)
  end

game_hash[place][:colors]

end

def team_names
  names=[]
  game_hash.keys.each do |key, value|
    names << game_hash[key][:team_name]
  end
  names
end

def player_numbers(team)

    numbers=[]
    game_hash.keys.each do |key, value|
      if game_hash[key][:team_name] == team
        game_hash[key][:players].each do |player|
          numbers <<player[:number]
        end
      end
    end
    numbers

end


def player_stats(name)
player = {}
  game_hash.keys.each do |key, value|
    game_hash[key][:players].find do |element|
      if element.values.include?(name)
      element.delete(:player_name)
      player = element
      end
    end
  end
  player

end

def big_shoe_rebounds
athletes=[]

team = game_hash.keys.each do |key, value|
  athletes << game_hash[key][:players]
end

athletes.flatten.sort_by { |element| element[:shoe] }.last[:rebounds]
end
