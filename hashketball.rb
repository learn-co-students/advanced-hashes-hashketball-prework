# Write your code here!
require 'pry'

def game_hash
  game = {
    home: {
      team_name:"Brooklyn Nets",
      colors: "Black, White",
      players: {
        "Alan Anderson" => {number:0, shoe:16, points:22, rebounds:12, assists:12, steals:3, blocks:1, slam_dunks:1}
      }
    },
    away: {
      team_name:"Charlotte Hornets",
      colors: "Turquoise, Purple",
      players: {
        "Jeff Adrien" => {number:4, shoe:18, points:10, rebounds:1, assists:1, steals:2, blocks:7, slam_dunks:2},
        "Bismak Biyombo" => {number:0, shoe:16, points:12, rebounds:4, assists:7, steals:7, blocks:15, slam_dunks:10},
        "DeSagna Diop" => {number:2, shoe:14, points:24, rebounds:12, assists:12, steals:4, blocks:5, slam_dunks:5},
        "Ben Gordon" => {number:8, shoe:15, points:33, rebounds:3, assists:2, steals:1, blocks:1, slam_dunks:0},
        "Brendan Haywood" => {number:33, shoe:15, points:6, rebounds:12, assists:12, steals:22, blocks:5, slam_dunks:12}
      }
    }
  }

  game[:home][:players]["Reggie Evans"] = {number:30, shoe:14, points:12, rebounds:12, assists:12, steals:12, blocks:12, slam_dunks:7}
  game[:home][:players]["Brook Lopez"] = {number:11, shoe:17, points:17, rebounds:19, assists:10, steals:3, blocks:1, slam_dunks:15}
  game[:home][:players]["Mason Plumlee"] = {number:1, shoe:19, points:26, rebounds:12, assists:6, steals:3, blocks:8, slam_dunks:5}
  game[:home][:players]["Jason Terry"] = {number:31, shoe:15, points:19, rebounds:2, assists:2, steals:4, blocks:11, slam_dunks:1}
  game
end


# #num_points_scored
#   knows the number of points scored by each player (FAILED - 1)
def num_points_scored (name="Jeff Adrien")
  point = 0
  if(game_hash[:home][:players].keys.include?(name))
    point= game_hash[:home][:players][name][:points]
  elsif (game_hash[:away][:players].keys.include?(name))
    point = game_hash[:away][:players][name][:points]
  else
    point
  end
end

#puts num_points_scored("Jeff Adrien")

# #shoe_size
#   knows the shoe size of each player (FAILED - 2)
def shoe_size (name="Jeff Adrien")
  size = 0
  if(game_hash[:home][:players].keys.include?(name))
    size= game_hash[:home][:players][name][:shoe]
  elsif (game_hash[:away][:players].keys.include?(name))
    size = game_hash[:away][:players][name][:shoe]
  else
    size
  end
end


# #team_colors
#   knows the Brooklyn Nets colors are Black and White (FAILED - 3)
#     knows the Brooklyn Nets colors are Black and White (FAILED - 3)
def team_colors(team_n)
  game_hash.each do |location, team_data|
    #binding.pry
    if (team_data[:team_name] ==  team_n)
      return team_data[:colors].split(", ")
    end
  end
  return nil
end

#puts team_colors("Brooklyn Nets")

#   #team_names
#     returns the team names (FAILED - 4)
def team_names()
  temp =[]
  game_hash.each do |location, team_data|
    #binding.pry
      temp << team_data[:team_name]
  end
  temp
end

#   #player_numbers
#     returns the player jersey numbers (FAILED - 5)
def player_numbers (name="Brooklyn Nets")
  n = []
  game_hash.each do |location, team_data|
    if(team_data[:team_name] == name)
      team_data[:players].each do |key, data|
        n << data[:number]
      end
    end
  end

  n
end

#   #player_stats
#     returns all stats for a given player (FAILED - 6)
def player_stats(name="Jeff Adrien")
  player_stats={}
  if(game_hash[:home][:players].keys.include?(name))
    player_stats= game_hash[:home][:players][name]
  elsif (game_hash[:away][:players].keys.include?(name))
    player_stats = game_hash[:away][:players][name]
  else
    player_stats
  end
end


#   #big_shoe_rebounds
#     returns the number of rebounds of the player with the biggest shoe size (FAILED - 7)

def big_shoe_rebounds
  b_size =0
  rebounds = 0
  player = ""

  game_hash.each do |location, team_data|
    team_data[:players].each do |p_name, stats|
      if (stats[:shoe] > b_size)
        b_size = stats[:shoe]
        player = p_name.to_s
        rebounds = stats[:rebounds]
      end #if
    end #team_data
  end #game_hash
  rebounds
end

def most_points_scored ()
  m_point = 0
  player = ""

  game_hash.each do |location, team_data|
    team_data[:players].each do |p_name, stats|
      if(stats[:points]> m_point)
        m_point = stats[:points]
        player = p_name
      end #if
    end #team_data
  end # game_hash
  player

end

# #winning_team
#   returns the Brooklyn Nets (FAILED - 2)
def winning_team
  team_p = []
  team_n = []

  game_hash.each do | location, team_data|
    temp = 0
    team_data[:players].each do |p_name, stats|
      temp += stats[:points]
    end
    team_n << team_data[:team_name]
    team_p << temp
  end

  team_p[0] > team_p[1] ? team_n[0] : team_n[1]

end

# #player_with_longest_name
#   returns Brendan Haywood (FAILED - 3)
def player_with_longest_name
  longest_name = 0
  the_player = ""

  game_hash.each do |location, team_data|
      team_data[:players].each do |name,stats|
        if (name.size > the_player.size)
          the_player = name
        end #if
      end #team_data
  end #game_hash
  the_player

end
