def game_hash 
  { 
    :home => {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      :players => 
        [ 
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
    :away => {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      :players => 
        [ 
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
          assists:12,
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
  game_hash.each do |location, team_data|
   team_data[:players].each do |player|
        if player[:player_name] == name
          return player[:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
   team_data[:players].each do |player|
        if player[:player_name] == name
          return player[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  end
end

def team_names
  game_hash.collect do |location, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team_name)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      return team_data[:players].collect do |player|
        player[:number]
      end
    end
  end
end

def player_stats(name) 
  game_hash.each do |location, team_data|
   team_data[:players].each do |player|
        if player[:player_name] == name
          player.shift
          return player
      end
    end
  end
end

def big_shoe_rebounds
  shoe = 0 
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player[:shoe] > shoe
        shoe = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  player_name = ""
  scored = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player[:points] > scored
        player_name = player[:player_name]
        scored = player[:points]
      end
    end
  end
  player_name
end

def winning_team
  nets = 0
  hornets = 0
  game_hash.each do |location, team_data|
    if location == :home
    team_data[:players].each do |player|
        nets += player[:points]
      end
    else
      team_data[:players].each do |player|
         hornets += player[:points]
      end
    end
  end
  if nets > hornets
    return "Brooklyn Nets"
  else 
    return "Charlotte Hornets"
  end
end
  

def player_with_longest_name
  player_name = ""
  length = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player[:player_name].length > length
        player_name = player[:player_name]
        length = player[:player_name].length
      end
    end
  end
  player_name
end

def long_name_steals_a_ton?
  player_name = ""
  steals = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player[:steals] > steals
        player_name = player[:player_name]
        steals = player[:steals]
      end
    end
  end
  if player_name == player_with_longest_name
   return true
 end
end

