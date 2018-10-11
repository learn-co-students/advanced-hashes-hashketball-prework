require("pry")
def game_hash
game={
  :home => {
    team_name:"Brooklyn Nets", 
    colors: ["Black", "White"], 
    :players => {
     "Alan Anderson" =>  {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1}, 
      "Reggie Evans" =>  {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
      "Brook Lopez" =>  {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
      "Mason Plumlee" =>  {number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
      "Jason Terry" =>  {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1},
       
  }}, 
  :away => 
  {
    team_name:"Charlotte Hornets", 
    colors: ["Turquoise", "Purple"], 
    :players => {
     "Jeff Adrien" =>  {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2}, 
      "Bismak Biyombo" =>  {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
      "DeSagna Diop" =>  {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
      "Ben Gordon" =>  {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
      "Brendan Haywood" =>  {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12},
       
  }}
}
game
end
def num_points_scored(player)
  return_val=nil
  game_hash.each do |location,team| 
    team[:players].each do |teamate,stats|
      if teamate==player
        return_val=stats[:points]
      end
    end
  end
  return_val
end

def shoe_size(player)
  return_val=nil
  game_hash.each do |location,team| 
    team[:players].each do |teamate,stats|
      if teamate==player
        return_val=stats[:shoe]
      end
    end
  end
  return_val
end

def player_numbers(query)
  return_val=[]
  game_hash.each do |location,team|
    if team[:team_name]==query
      team[:players].each do |teamate,stats|
          return_val << stats[:number]
       
      end
    end
  end
  return_val
end


def team_colors(inquiry)
  return_val=nil
  game_hash.each do |location,team|
      if team[:team_name]==inquiry
        return_val=team[:colors]
      end
  end
  return_val
end
def team_names
  return_val= []
  game_hash.each do |location,team|
      return_val << team[:team_name]
      end
  return_val
end

def player_stats(player)
  return_val= nil
  game_hash.each do |location,team| 
    team[:players].each do |teamate,stats|
      if teamate==player
        return_val=stats
      end
    end
  end
  return_val
end

def big_shoe_rebounds
  return_val={size: 0, rebounds: nil}
  game_hash.each do |location,team| 
    team[:players].each do |teammate,stats|
      if shoe_size(teammate)>return_val[:size]
        return_val={size: shoe_size(teammate), rebounds: stats[:rebounds]}
        
      end
    end
  end
  return_val[:rebounds]
end



