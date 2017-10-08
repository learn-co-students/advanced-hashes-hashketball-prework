# Write your code here!

def game_hash
  {
      home: {
        team_name: "Brooklyn Nets",
        colors: ["Black", "White"],
        players: [
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
      away: {
        team_name: "Charlotte Hornets",
        colors: ["Turquoise", "Purple"],
        players: [
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
            assists: 12,
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
  players = game_hash.values.collect{|value| value[:players]}.flatten!

  score = 0
  players.each do |player|
    score = player[:points] if player[:player_name] == name
  end
#  puts players.class
  score
end

def shoe_size(name)
  players = game_hash.values.collect{|value| value[:players]}.flatten!

  shoe = 0
  players.each do |player|
    shoe = player[:shoe] if player[:player_name] == name
  end
#  puts players.class
  shoe
end

def team_colors(what_team)
  colors = []
  game_hash.values.each{|team| colors = team[:colors] if team[:team_name] == what_team}
  colors
end

def team_names
  game_hash.values.collect{|value| value[:team_name]}
end

def player_numbers(what_team)
  jerseys = []
  game_hash.values.each{|team| team[:players].each{|player| jerseys << player[:number]} if team[:team_name] == what_team}
  jerseys
end

def player_stats(name)
  players = game_hash.values.collect{|value| value[:players]}.flatten!

  stats = {}
  players.each do |player|
    # if player[:player_name] == name
    #   player.delete(:player_name)
    #   return player
    # end
    stats= player.select{|key,value| key != :player_name} if player[:player_name] == name
  end
  stats
end

def big_shoe_rebounds
  players = game_hash.values.collect{|value| value[:players]}.flatten!

  player_name_a = ""
  shoe_size_a = 0
  players.each do |player|
    if shoe_size(player[:player_name]) > shoe_size_a
      player_name_a = player[:player_name]
      shoe_size_a = shoe_size(player[:player_name])
    end
  end

  player_stats(player_name_a)[:rebounds]
end
