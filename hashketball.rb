require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: { "Alan Anderson" =>
        {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        }, "Reggie Evans" =>
        {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        }, "Brook Lopez" =>
        {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        }, "Mason Plumlee" =>
        {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        }, "Jason Terry" =>
        {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: { "Jeff Adrien" =>
        {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        }, "Bismak Biyombo" =>
        {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        }, "DeSagna Diop" =>
        {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        }, "Ben Gordon" =>
        {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        }, "Brendan Haywood" =>
        {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def return_attribute(player, attribute)
  # returns the value for a given player's attribute
  game_hash.each do |location, team_data|
    if team_data[:players][player]
      return team_data[:players][player][attribute]
    end
  end
end

def num_points_scored(player)
  return_attribute(player, :points)
end

def shoe_size(player)
  return_attribute(player, :shoe)
end

def team_colors(team)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      return team_data[:colors]
    end
  end
end
      
def team_names
  game_hash.map do |location, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      return team_data[:players].map { |player, data| data[:number] }
    end
  end
end
  
def player_stats(player)
  game_hash.each do |location, team_data|
    if team_data[:players][player]
      return team_data[:players][player]
    end
  end
end

def find_biggest(stat)
  # returns the player name with the highest count of stat
  count = 0
  name = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, attributes|
      if attributes[stat] > count
        count = attributes[stat]
        name = player
      end
    end
  end
  name
end
  
def big_shoe_rebounds
  return_attribute(find_biggest(:shoe), :rebounds)
end

def most_points_scored
  find_biggest(:points)
end

def player_with_longest_name
  count = 0
  name = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, attributes|
      if player.length > count
        count = player.length
        name = player
      end
    end
  end
  name
end
  
def winning_team
  team = ""
  winning = 0
  game_hash.each do |location, team_data|
    count = 0
    team_data[:players].each do |player, attributes|
      count += attributes[:points]
    end
    if count > winning
      team = team_data[:team_name] 
      winning = count
    end
  end
  team
end

def long_name_steals_a_ton?
  player_with_longest_name == find_biggest(:steals)
end

binding.pry


