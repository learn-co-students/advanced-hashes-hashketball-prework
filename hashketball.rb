require 'pry'

def game_hash
  game_hash = {
    home: {
      team_name: 'Brooklyn Nets',
      colors: ['Black','White'],
      players: [
        {
          player_name: 'Alan Anderson',
          number: '0',
          shoe: '16',
          points: '22',
          rebounds: '12',
          assists: '12',
          steals: '3',
          blocks: '1',
          slam_dunks: '1'
        }, {
          player_name: 'Reggie Evans',
          number: '30',
          shoe: '14',
          points: '12',
          rebounds: '12',
          assists: '12',
          steals: '12',
          blocks: '12',
          slam_dunks: '7'
        }, {
          player_name: 'Brook Lopez',
          number: '11',
          shoe: '17',
          points: '17',
          rebounds: '19',
          assists: '10',
          steals: '3',
          blocks: '1',
          slam_dunks: '15'
        }, {
          player_name: 'Mason Plumlee',
          number: '1',
          shoe: '19',
          points: '26',
          rebounds: '12',
          assists: '6',
          steals: '3',
          blocks: '8',
          slam_dunks: '5'
        }, {
          player_name: 'Jason Terry',
          number: '31',
          shoe: '15',
          points: '19',
          rebounds: '2',
          assists: '2',
          steals: '4',
          blocks: '11',
          slam_dunks: '1'
        }
      ] 
    },
    away: {
      team_name: 'Charlotte Hornets',
      colors: ['Turquoise', 'Purple'],
      players: [
      {
          player_name: 'Jeff Adrien',
          number: '4',
          shoe: '18',
          points: '10',
          rebounds: '1',
          assists: '1',
          steals: '2',
          blocks: '7',
          slam_dunks: '2'
        }, {
          player_name: 'Bismak Biyombo',
          number: '0',
          shoe: '16',
          points: '12',
          rebounds: '4',
          assists: '7',
          steals: '7',
          blocks: '15',
          slam_dunks: '10'
        }, {
          player_name: 'DeSagna Diop',
          number: '2',
          shoe: '14',
          points: '24',
          rebounds: '12',
          assists: '12',
          steals: '4',
          blocks: '5',
          slam_dunks: '5'
        }, {
          player_name: 'Ben Gordon',
          number: '8',
          shoe: '15',
          points: '33',
          rebounds: '3',
          assists: '2',
          steals: '1',
          blocks: '1',
          slam_dunks: '0'
        }, {
          player_name: 'Brendan Haywood',
          number: '33',
          shoe: '15',
          points: '6',
          rebounds: '12',
          assists: '12',
          steals: '22',
          blocks: '5',
          slam_dunks: '12'
        }
      ]
    }
  }
end


# def good_practices
#   game_hash.each do |location, team_data|
#     #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#     binding.pry
#       team_data.each do |attribute, data|
#         #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#         binding.pry
 
#         #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
#         data.each do |data_item|
#             binding.pry
#       end
#     end
#   end
# end

# good_practices


def team_names
  name = []
  game_hash.each do |team, team_data|
    name.push(team_data[:team_name])
  end
  name
end

def team_colors(team_name)
  colors = []
  game_hash.each do |team, team_data|
    if team_data[:team_name] == team_name
      colors.push(team_data[:colors])
    end
  end
  colors.flatten
end

def player_numbers(team_name)
  team_numbers = []
  game_hash.each do |team, team_data|
    if team_data[:team_name] == team_name
      team_data.each do |key, values|
        if key == :players
          values.each do |key, value|
            team_numbers << key[:number].to_i
          end
        end
      end
    end
  end
  team_numbers
end

def num_points_scored(player_name)
  points_scored = nil
  game_hash.each do |team, team_data|
    team_data.each do |keys, values|
      if keys == :players
        values.each do |key|
          if key[:player_name] == player_name
            points_scored = key[:points].to_i
          end
        end
      end
    end
  end
  points_scored
end

def shoe_size(players_name)
  shoe_size = nil
  game_hash.each do |team, team_data|
    team_data.each do |team_data, attributes|
      if team_data == :players
        attributes.each do |key|
          if key[:player_name] == players_name
            shoe_size = key.fetch(:shoe).to_i
          end
        end
      end
    end
  end
  shoe_size
end

def big_shoe_rebounds
  rebounds = nil
  biggest_shoe = 0
  game_hash.each do |team, team_data|
    team_data.each do |team_data, attributes|
      if team_data == :players
        attributes.each do |key|
          if key[:shoe].to_i > biggest_shoe
            biggest_shoe = key[:shoe].to_i
            rebounds = key[:rebounds].to_i
          end
        end
      end
    end
  end
  rebounds
end

big_shoe_rebounds