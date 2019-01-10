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
      },{
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
      },{
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
  away:{
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
      },{
        player_name: "Bismak Biyombo",
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 7,
        blocks: 15,
        slam_dunks: 10
      },{
        player_name: "DeSagna Diop",
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5
      },{
        player_name: "Ben Gordon",
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0
      },{
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
  game_hash.each do |location, attributes|
    attributes[:players].each do |category, stat|
      if category[:player_name] == player_name
        return category[:points]
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, attributes|
    attributes[:players].each do |category, stat|
      if category[:player_name] == player_name
        return category[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, attributes|
      if attributes[:team_name] == team_name
        return attributes[:colors]
      end
  end
end

def team_names
  game_hash.map do |location, attributes|
      attributes[:team_name]
  end
end

def player_numbers(team_name)
player_numbers_list = []
  game_hash.each do |location, attributes|
    if attributes[:team_name] == team_name
      attributes[:players].each do |category, stat|
        numbers = category[:number]
        player_numbers_list.push(numbers)
      end
    end
  end
  player_numbers_list
end


def player_stats(player_name)
  game_hash.each do |location, attributes|
    attributes[:players].each do |category, stat|
      if category[:player_name] == player_name
        category.delete(:player_name)
        return category
      end
    end
  end
end

def big_shoe_rebounds
max_shoe_player = 0
rebounds = 0
  game_hash.each do |location, attributes|
    attributes[:players].each do |category, stat|
      if category[:shoe] > max_shoe_player
          max_shoe_player = category[:shoe]
          rebounds = category[:rebounds]
      end
    end
  end
  rebounds
end


#bonus questions
def most_points_scored
  max_points_player = 0
  max_player = 0
    game_hash.each do |location, attributes|
      attributes[:players].each do |category, stat|
        if category[:points] > max_points_player
            max_points_player = category[:points]
            max_player = category[:player_name]
        end
      end
    end
    max_player
end


def winning_team
  home_score = 0
  away_score = 0

  game_hash[:home][:players].each do |category, stat|
    home_score += category[:points]
  end
  game_hash[:away][:players].each do |category, stat|
    away_score += category[:points]
  end

  if home_score > away_score
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end


def player_with_longest_name
  longest_name = 0
  long_name_player = 0
    game_hash.each do |location, attributes|
      attributes[:players].each do |category, stat|
        if category[:player_name].length > longest_name
            longest_name = category[:player_name].length
            long_name_player = category[:player_name]
        end
      end
    end
    long_name_player
end

#super bonus
def player_with_most_steals
  most_steals = 0
  most_steals_player = 0
    game_hash.each do |location, attributes|
      attributes[:players].each do |category, stat|
        if category[:steals] > most_steals
            most_steals = category[:steals]
            most_steals_player = category[:player_name]
        end
      end
    end
    most_steals_player
end

def long_name_steals_a_ton?
    if player_with_most_steals == player_with_longest_name
      true
    else
      false
    end
end

binding.pry
