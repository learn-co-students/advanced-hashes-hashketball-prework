require 'pry'

def game_hash
  hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson": {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans": {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez": {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee": {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry": {
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
      players: {
        "Jeff Adrien": {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo": {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop": {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon": {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood": {
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
  hash
end

def num_points_scored(player)
  game_hash.each do |team, team_data|
    team_data.each do |attributes, players|
      if attributes == :players
        players.each do |person, stats|
          if player == person.to_s
            stats.each do |metric, int|
              if metric == :points
                return int
              end
            end
          end
        end
      end
    end
  end
end

def shoe_size(player)
  game_hash.each do |team, team_data|
    team_data.each do |attributes, players|
      if attributes == :players
        players.each do |person, stats|
          if player == person.to_s
            stats.each do |metric, int|
              if metric == :shoe
                return int
              end
            end
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  loc = ""
  game_hash.each do |team, attributes|
    attributes.each do |attribute, data|
      if data == team_name
        loc = team
      end
      if loc == team && attribute == :colors
        return data
      end
    end
  end
end

def team_names
  names = []
  game_hash.each do |team, attributes|
    attributes.each do |attribute, data|
      if attribute == :team_name
        names.push(data)
      end
    end
  end
  names
end

def player_numbers(team_name)
  jersey_numbers = []
  team_loc = ""
  game_hash.each do |team, attributes|
    attributes.each do |attribute, data|
      if data == team_name
        team_loc = team
      end
      if attribute == :players && team == team_loc
        data.each do |person, stats|
          stats.each do |metric, int|
            if metric == :number
              jersey_numbers.push(int)
            end
          end
        end
      end
    end
  end
  jersey_numbers
end

def player_stats(player)
  game_hash.each do |team, attributes|
    attributes.each do |attribute, team_data|
      if attribute == :players
        team_data.each do |person, stats|
          if person.to_s == player
            return stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  largest_shoe_size = 0
  rebounds = 0
  athlete = ""
  game_hash.each do |team, attributes|
    attributes.each do |attribute, players|
      if attribute == :players
        players.each do |person, stats|
          stats.each do |metric, int|
            if metric == :shoe && int > largest_shoe_size
              athlete = person
              largest_shoe_size = int
            end
            if metric == :rebounds && athlete == person
              rebounds = int
            end
          end
        end
      end
    end
  end
  rebounds
end

def most_points_scored
  points = 0
  player = ""
  game_hash.each do |team, attributes|
    attributes.each do |attribute, players|
      if attribute == :players
        players.each do |person, stats|
          stats.each do |metric, int|
            if metric == :points && int > points
              points = int
              player = person
            end
          end
        end
      end
    end
  end
  player
end

def winning_team
  home_points = 0
  away_points = 0
  home_team = ""
  away_team = ""
  game_hash.each do |team, attributes|
    attributes.each do |attribute, players|
      if attribute == :team_name && team == :home
        home_team = players
      elsif attribute == :team_name && team == :away
        away_team = players
      elsif attribute == :players
        players.each do |person, stats|
          stats.each do |metric, int|
            if metric == :points && team == :home
              home_points += int
            elsif
              metric == :points && team == :away
              away_points += int
            end
          end
        end
      end
    end
  end
  if home_points > away_points
    return home_team
  else
    return away_team
  end
end

def player_with_the_longest_name
  longest_name = ""
  game_hash.each do |team, attributes|
    attributes.each do |attribute, players|
      if attribute == :players
        players.each do |person, stats|
          if person.length > longest_name.length
            longest_name = person
          end
        end
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  steals = 0
  player_with_most_steals = ""
  game_hash.each do |team, attributes|
    attributes.each do |attribute, players|
      if attribute == :players
        players.each do |person, stats|
          stats.each do |metric, int|
            if metric == :steals && int > steals
              steals = int
              player_with_most_steals = person
            end
          end
        end
      end
    end
  end
  player_with_the_longest_name == player_with_most_steals
end
