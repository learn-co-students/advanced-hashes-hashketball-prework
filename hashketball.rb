# Write your code here!

require "pry"


def game_hash
  {
    away: { team_name: 'Charlotte Hornets',
            colors: ["Turquoise", "Purple"],
            players: [
              { player_name: 'Jeff Adrien',
                number: 4,
                shoe: 18,
                points: 10,
                rebounds: 1,
                assists: 1,
                steals: 2,
                blocks: 7,
                slam_dunks: 2 },
              { player_name: 'Bismack Biyombo',
                number: 0,
                shoe: 16,
                points: 12,
                rebounds: 4,
                assists: 7,
                steals: 22,
                blocks: 15,
                slam_dunks: 10 },
              { player_name: 'DeSagna Diop',
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5 },
              { player_name: 'Ben Gordon',
                number: 8,
                shoe: 15,
                points: 33,
                rebounds: 3,
                assists: 2,
                steals: 1,
                blocks: 1,
                slam_dunks: 0 },
              { player_name: 'Kemba Walker',
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 7,
                blocks: 5,
                slam_dunks: 12 }
            ] 
      
    },
    home: { team_name: 'Brooklyn Nets',
            colors: ["Black", "White"],
            players: [
              { player_name: 'Alan Anderson',
                number: 0,
                shoe: 16,
                points: 22,
                rebounds: 12,
                assists: 12,
                steals: 3,
                blocks: 1,
                slam_dunks: 1 },
              { player_name: 'Reggie Evans',
                number: 30,
                shoe: 14,
                points: 12,
                rebounds: 12,
                assists: 12,
                steals: 12,
                blocks: 12,
                slam_dunks: 7 },
              { player_name: 'Brook Lopez',
                number: 11,
                shoe: 17,
                points: 17,
                rebounds: 19,
                assists: 10,
                steals: 3,
                blocks: 1,
                slam_dunks: 15 },
              { player_name: 'Mason Plumlee',
                number: 1,
                shoe: 19,
                points: 26,
                rebounds: 11,
                assists: 6,
                steals: 3,
                blocks: 8,
                slam_dunks: 5 },
              { player_name: 'Jason Terry',
                number: 31,
                shoe: 15,
                points: 19,
                rebounds: 2,
                assists: 2,
                steals: 4,
                blocks: 11,
                slam_dunks: 1 }
            ] }
  }
end


# Method 2
def num_points_scored(player_name)
  game_hash.each do |location, team|
    team.each do |team_info, data|
      if team_info == :players
        data.each do |player|
        if player[:player_name] == player_name
          return player[:points] 
      end
    end
  end
end
end 
end 

# Method 3
def shoe_size(player_name)
  game_hash.each do |location, team|
    team.each do |team_info, data|
      if team_info == :players
        data.each do |player|
        if player[:player_name] == player_name
          return player[:shoe] 
      end
    end
  end
end
end 
end 

# Method 4 

def team_colors(team_name)
  game_hash.each do |location, team|
      if team[:team_name] == team_name
        return team[:colors]
      end
    end
  end

# Method 5 
  def team_names
  teams = []
  teams << game_hash[:home][:team_name]
  teams << game_hash[:away][:team_name]
  teams
end

# Method 6 

def player_numbers(name)
  numbers = []
  game_hash.each do |_place, team|
    next unless team[:team_name] == name

    team.each do |info, data|
      next unless info == :players

      data.each do |data|
        numbers.push(data[:number])
      end
    end
  end
  numbers
end
  
# Method 7
def player_stats(name)
  stats = {}
  game_hash.map do |place, team|
    team.each do |info, property|
      next unless info == :players

      game_hash[place][info].each do |player|
        next unless player[:player_name] == name

        stats = player.delete_if do |key, value|
          key == :player_name
        end
      end
    end
  end
  stats
end

# Method 8
def big_shoe_rebounds
  shoes = 0
  rebounds = 0
  game_hash.each do |team, info|
    info[:players].each do |player|
      if player[:shoe] > shoes
        shoes = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
  end

  rebounds
end

  def most_points_scored 
    most_points = []
  game_hash.each do |location, team_data|
        team_data[:players].each do |player, player_stats|
          if player_stats == [:points]
            most_points >> player_stats[:points]
        most_points.sort 
        most_points[-1]
      end
    end 
  end 
end 

      
    
