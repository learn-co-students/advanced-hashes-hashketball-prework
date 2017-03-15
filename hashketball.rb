# Write your code here!

def game_hash
  hash = {
    home:{
      team_name: "Brooklyn Nets",
      colors: ["Black","White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1},
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7},
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15},
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5},
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1}
        }
      },
      away:{
        team_name: "Charlotte Hornets",
        colors: ["Turquoise","Purple"],
        players: {
          "Jeff Adrien" => {
            number: 4,
            shoe: 18,
            points: 10,
            rebounds: 1,
            assists: 1,
            steals: 2,
            blocks: 7,
            slam_dunks: 2},
          "Bismak Biyombo" => {
            number: 0,
            shoe: 16,
            points: 12,
            rebounds: 4,
            assists: 7,
            steals: 7,
            blocks: 15,
            slam_dunks: 10},
          "DeSagna Diop" => {
            number: 2,
            shoe: 14,
            points: 24,
            rebounds: 12,
            assists: 12,
            steals: 4,
            blocks: 5,
            slam_dunks: 5},
          "Ben Gordon" => {
            number: 8,
            shoe: 15,
            points: 33,
            rebounds: 3,
            assists: 2,
            steals: 1,
            blocks: 1,
            slam_dunks: 0},
          "Brendan Haywood" => {
            number: 33,
            shoe: 15,
            points: 6,
            rebounds: 12,
            assists: 12,
            steals: 22,
            blocks: 5,
            slam_dunks: 12}
          }
        }
  }
end

def num_points_scored(player_name)
  points_scored = ""
  game_hash.each do |location, data|
    data.each do |team_data, info|
    if team_data == :players
      info.each do |names, stats|
        if names == player_name
         stats.each do |category, value|
           if category == :points
             points_scored=value
        end
      end
    end
  end
end
end
end
points_scored
end

def shoe_size(player_name)
  shoe_size = ""
  game_hash.each do |location, data|
    data.each do |team_data, info|
    if team_data == :players
      info.each do |names, stats|
        if names == player_name
         stats.each do |category, value|
           if category == :shoe
             shoe_size= value.to_i
        end
      end
    end
  end
end
end
end
shoe_size
end

def team_colors(team_name)
  color = []
  game_hash.each do |location, data|
    data.each do |team_data, info|
      if info.include?(team_name)
            color = game_hash[location][:colors]
      end
    end
  end
  color
end

def team_names
  name = []
  game_hash.each do |location, data|
    data.each do |team_data, info|
      if team_data == :team_name
        name.push(info)
      end
    end
  end
  name
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |location, data|
    if game_hash[location][:team_name] == team_name
      data.each do |team_data, info|
        if team_data == :players
          info.each do |names, stats|
            stats.each do |category, value|
              if category == :number
                numbers.push(value.to_i)
              end
          end
        end
      end
    end
  end
end
  numbers
end

def player_stats(player_name)
  stat = {}
  game_hash.each do |location, data|
    data.each do |team_data, info|
    if team_data == :players
      info.each do |names, stats|
        if names == player_name
          stat = stats
        end
      end
    end
  end
end
  stat
end

def big_shoe_rebounds
  shoe_size = []
  rebound = ""
  game_hash.each do |location, data|
    data.each do |team_data, info|
    if team_data == :players
      info.each do |names, stats|
        stats.each do |category, value|
          if category == :rebounds
            shoe_size << value
          end
          stats.each do |category, value|
            if category == :shoe && value == shoe_size.max
              rebound = game_hash[location][team_data][names][:rebounds]
            end
          end
        end
      end
    end
  end
end
rebound
end
