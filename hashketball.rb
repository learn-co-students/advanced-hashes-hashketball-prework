# Write your code here!
def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number =>0,
          :shoe =>16,
          :points =>22,
          :rebounds =>12,
          :assists =>12,
          :steals =>3,
          :blocks =>1,
          :slam_dunks =>1
        },
        "Reggie Evans" => {
          :number =>30,
          :shoe =>14,
          :points =>12,
          :rebounds =>12,
          :assists =>12,
          :steals =>12,
          :blocks =>12,
          :slam_dunks =>7
        },
        "Brook Lopez" => {
          :number =>11,
          :shoe =>17,
          :points =>17,
          :rebounds =>19,
          :assists =>10,
          :steals =>3,
          :blocks =>1,
          :slam_dunks =>15
        },
        "Mason Plumlee" => {
          :number =>1,
          :shoe =>19,
          :points =>26,
          :rebounds =>12,
          :assists =>6,
          :steals =>3,
          :blocks =>8,
          :slam_dunks =>5
        },
        "Jason Terry" => {
          :number =>31,
          :shoe =>15,
          :points =>19,
          :rebounds =>2,
          :assists =>2,
          :steals =>4,
          :blocks =>11,
          :slam_dunks =>1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number =>4,
          :shoe =>18,
          :points =>10,
          :rebounds =>1,
          :assists =>1,
          :steals =>2,
          :blocks =>7,
          :slam_dunks =>2
        },
        "Bismak Biyombo" => {
          :number =>0,
          :shoe =>16,
          :points =>12,
          :rebounds =>4,
          :assists =>7,
          :steals =>7,
          :blocks =>15,
          :slam_dunks =>10
        },
        "DeSagna Diop" => {
          :number =>2,
          :shoe =>14,
          :points =>24,
          :rebounds =>12,
          :assists =>12,
          :steals =>4,
          :blocks =>5,
          :slam_dunks =>5
        },
        "Ben Gordon" => {
          :number =>8,
          :shoe =>15,
          :points =>33,
          :rebounds =>3,
          :assists =>2,
          :steals =>1,
          :blocks =>1,
          :slam_dunks =>0
        },
        "Brendan Haywood" => {
          :number =>33,
          :shoe =>15,
          :points =>6,
          :rebounds =>12,
          :assists =>12,
          :steals =>22,
          :blocks =>5,
          :slam_dunks =>12
        }
      }
    }
  }
end

def num_points_scored(player)
  point = nil
  game_hash.each do |location, team_data|
    team_data[:players].each {|name, stats| point = stats[:points] if name == player}
  end
  point
end

def shoe_size(player)
  size = nil
  game_hash.each do |location, team_data|
    team_data[:players].each {|name, stats| size = stats[:shoe] if name == player}
  end
  size
end

def team_colors(team)
  colors = []
  game_hash.each {|location, team_data| colors = team_data[:colors] if team_data[:team_name] == team}
  colors
end

def team_names
  game_hash.collect {|location, team_data| team_data[:team_name]}
end

def player_numbers(team)
  numbers = []
  game_hash.each do |location, team_data|
    team_data[:players].each {|name, stats| numbers << stats[:number] if team_data[:team_name] == team}
  end
  numbers
end

def player_stats(player)
  stat = nil
  game_hash.each do |location, team_data|
    team_data[:players].each {|name, stats| stat = stats if name == player}
  end
  stat
end

def big_shoe_rebounds
  shoe = 0
  rebound = 0
  game_hash.each do |location, team_data|
    team_data[:players].each {|name, stat| shoe > stat[:shoe] ? shoe : shoe = stat[:shoe]}
  end
  game_hash.each do |location, team_data|
    team_data[:players].each {|name, stat| rebound = stat[:rebounds] if stat[:shoe] == shoe}
  end
  rebound
end

def most_points_scored
  point = 0
  player = nil
  game_hash.each do |location, team_data|
    team_data[:players].each {|name, stat| point > stat[:points] ? point : point = stat[:points]}
  end
  game_hash.each do |location, team_data|
    team_data[:players].each {|name, stat| player = name if stat[:points] == point}
  end
  player
end

def winning_team
  score = []
  game_hash.collect do |location, team_data|
    point = 0
    team_data[:players].each {|name, stat| point += stat[:points]}
    score << point
  end
  key = game_hash.keys
  game_hash[key[score.index(score.max)]][:team_name]
end

def player_with_longest_name
  long = ""
  game_hash.each do |location, team_data|
    team_data[:players].each {|name, stat| name.length > long.length ? long = name : long }
  end
  long
end

def long_name_steals_a_ton?
  long = player_with_longest_name
  player = nil
  steal = 0
  game_hash.each do |location, team_data|
    team_data[:players].each {|name, stat| steal, player = stat[:steals], name if stat[:steals] > steal}
  end
  long == player

end