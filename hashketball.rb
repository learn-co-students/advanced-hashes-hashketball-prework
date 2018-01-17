
# Write your code here!

def big_shoe_rebounds
  hash = game_hash
  biggest_player = nil
  team = nil
  size = "0"
  hash[:home][:players].each do |player,stats|
    if size.to_i < stats[:shoe].to_i
      team = :home
      biggest_player = player
    end
  end #home each
  hash[:away][:players].each do |player,stats|
    if size.to_i < stats[:shoe].to_i
      team = :away
      biggest_player = player
    end
  end #home each
  hash[team][:players][biggest_player][:rebounds].to_i

end

def player_stats(player)
  # puts "****************************#{player}"
  hash = game_hash
  # desired_key=desired_key.to_sym
  value = nil
  team = nil
  return_hash = {}
  if hash[:home][:players][player].nil?
    team = :away
  else
    team = :home
  end
  hash[team][:players][player].each do |key,value|
    return_hash[key]=value.to_i
  end
  return_hash
end

def player_numbers(team_name)
  hash = game_hash
  team = nil
  jersey_numbers = []
  if hash[:home][:team_name]==team_name
      team = :home
  else
    team = :away
  end
  hash[team][:players].each do |player,stats|
    jersey_numbers << stats[:number].to_i
    # puts "***********************#{stats[:number]}"
  end #hash players
  jersey_numbers
end

def team_names
  names = []
  names << game_hash[:home][:team_name]
  names << game_hash[:away][:team_name]
  names
end

def team_colors(team)
  hash = game_hash
  # desired_key=desired_key.to_sym
  value = nil
  if hash[:home][:team_name] != team
    value = hash[:away][:colors]
  else
    value = hash[:home][:colors]
  end
  # # puts "************************************#{value}||#{desired_key}" #not getting value
  # value.join(", ")
  # puts "********************************************#{  value.join(", ")}"
  value
end


def key_finder(player_name,desired_key)   #players keys only
  hash = game_hash
  # desired_key=desired_key.to_sym
  value = nil
  if hash[:home][:players][player_name].nil?
    value = hash[:away][:players][player_name][desired_key]
  else
    value = hash[:home][:players][player_name][desired_key]
  end
  # puts "************************************#{value}||#{desired_key}" #not getting value
  value.to_i
end

def shoe_size(player_name)
  # key_finder(player_name,"shoe")
  key_finder(player_name,:shoe)
end

def num_points_scored(player_name)
  key_finder(player_name,:points)
  # hash = game_hash
  # points = nil
  # if hash[:home][:players][player_name].nil?
  #   points = hash[:away][:players][player_name][:points]
  # else
  #   points = hash[:home][:players][player_name][:points]
  # end
  # points.to_i
end


def game_hash
  # The top level of the hash has two keys: :home, for the home team, and :away, for the away team.
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => [ "Black", "White"],
      :players => {
        "Alan Anderson"=>{
          :number=>"0",
          :shoe=>"16",
          :points=>"22",
          :rebounds=>"12",
          :assists=>"12",
          :steals=>"3",
          :blocks=>"1",
          :slam_dunks=>"1"
        },   #"Alan Anderson"
        "Reggie Evans"=>{
          :number=>"30",
          :shoe=>"14",
          :points=>"12",
          :rebounds=>"12",
          :assists=>"12",
          :steals=>"12",
          :blocks=>"12",
          :slam_dunks=>"7"
        },#Reggie Evans
        "Brook Lopez"=>{
          :number=>"11",
          :shoe=>"17",
          :points=>"17",
          :rebounds=>"19",
          :assists=>"10",
          :steals=>"3",
          :blocks=>"1",
          :slam_dunks=>"15"
        },#Brook Lopez

        "Mason Plumlee"=>{
          :number=>"1",
          :shoe=>"19",
          :points=>"26",
          :rebounds=>"12",
          :assists=>"6",
          :steals=>"3",
          :blocks=>"8",
          :slam_dunks=>"5"
        },#Mason Plumlee

        "Jason Terry"=>{
          :number=>"31",
          :shoe=>"15",
          :points=>"19",
          :rebounds=>"2",
          :assists=>"2",
          :steals=>"4",
          :blocks=>"11",
          :slam_dunks=>"1"
        }#Jason Terry
      }#:players
    }, #end :home
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => [ "Turquoise", "Purple"],
      :players => {
        "Jeff Adrien"=>{
          :number=>"4",
          :shoe=>"18",
          :points=>"10",
          :rebounds=>"1",
          :assists=>"1",
          :steals=>"2",
          :blocks=>"7",
          :slam_dunks=>"2"
        },#Jeff Adrien
        "Bismak Biyombo"=>{
          :number=>"0",
          :shoe=>"16",
          :points=>"12",
          :rebounds=>"4",
          :assists=>"7",
          :steals=>"7",
          :blocks=>"15",
          :slam_dunks=>"10"
        },#Bismak Biyombo
        "DeSagna Diop"=>{
          :number=>"2",
          :shoe=>"14",
          :points=>"24",
          :rebounds=>"12",
          :assists=>"12",
          :steals=>"4",
          :blocks=>"5",
          :slam_dunks=>"5"
        },#DD
        "Ben Gordon"=>{
          :number=>"8",
          :shoe=>"15",
          :points=>"33",
          :rebounds=>"3",
          :assists=>"2",
          :steals=>"1",
          :blocks=>"1",
          :slam_dunks=>"0"
        },#BG
        "Brendan Haywood"=>{
          :number=>"33",
          :shoe=>"15",
          :points=>"6",
          :rebounds=>"12",
          :assists=>"12",
          :steals=>"22",
          :blocks=>"5",
          :slam_dunks=>"12"
        }#Brendan Haywood
      }#players away
    } #end :away
  }
end
