def game_hash 

hash1 = {
:home => {team_name: 'Brooklyn Nets' , colors: ['Black','White'] , :players=>{'Alan Anderson' =>{number: 0,
shoe: 16,
points: 22,
rebounds: 12,
assists: 12,
steals: 3,
blocks: 1,
slam_dunks: 1},
'Reggie Evans' => {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
'Brook Lopez' => {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
'Mason Plumlee' => {number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
'Jason Terry' => {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
}, 
},
:away => {team_name: 'Charlotte Hornets' , colors: ['Turquoise', 'Purple'] , :players=>{'Jeff Adrien' =>{number: 4,
shoe: 18,
points: 10,
rebounds: 1 ,
assists: 1,
steals: 2,
blocks: 7,
slam_dunks: 2},
'Bismak Biyombo' => {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
'DeSagna Diop' => {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
'Ben Gordon' => {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
'Brendan Haywood' => {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
}
}
}
end

def num_points_scored(player_name)
score = ''
  game_hash.each do |location,team|
    team.each do |attributes, data|
        if attributes == :players
          data.each do |players, value|
            if players == player_name
             score = value[:points]
             
            end
          end
      end
    end
  end
score
end

def shoe_size(player_name)
x = ''
  game_hash.each do |location,team|
    team.each do |attributes, data|
        if attributes == :players
          data.each do |players, value|
            if players == player_name
             x = value[:shoe]
             
            end
          end
      end
    end
  end
x
end

def team_colors(team_name)
colors = ''
  game_hash.each do |location,team|
    if team[:team_name] == team_name
      colors= team[:colors]
    end
  end
colors
end

def team_names
array1 = []
  game_hash.each do |location,team|
    if team[:team_name]
      array1 << team[:team_name]
    end
end
array1
end

def player_numbers(team1)
array1 = []
  game_hash.each do |location,team|
    team.each do |attributes, data|
        if attributes == :players
          data.each do |players, value|
            if team[:team_name] == team1
             array1 << value[:number]
             
            end
          end
      end
    end
  end

array1
end

def player_stats(player)
x = ''
  game_hash.each do |location,team|
    team.each do |attributes, data|
        if attributes == :players
          data.each do |players, value|
            if players == player
             x =  value
             
            end
          end
      end
    end
  end

x
end

def big_shoe_rebounds

# figures out which player has the largest shoe size
hash2 = game_hash[:home][:players]
hash3 = game_hash[:away][:players]

hash4 = hash2.merge(hash3)

sorted_array = hash4.sort_by {|x,y| y[:shoe]}
x = sorted_array[-1]
winner = x[0]


rebounds = ''
  game_hash.each do |location,team|
    team.each do |attributes, data|
        if attributes == :players
          data.each do |players, value|
            if players == winner
             rebounds = value[:rebounds]
             
            end
          end
      end
    end
  end
rebounds
end



