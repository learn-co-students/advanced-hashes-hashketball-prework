require "pry"

def game_hash
 { home:  {
    team_name: "Brooklyn Nets",
    colors: ["Black", "White"],
    players: {
      "Alan Anderson" => {
      number: "0",
      shoe: "16",
      points: "22",
      rebounds: "12",
      assists: "12",
      steals: "3",
      blocks: "1",
      slam_dunks: "1"
      },
      "Reggie Evans" => {
      number: "30",
      shoe: "14",
      points: "12",
      rebounds: "12",
      assists: "12",
      steals: "12",
      blocks: "12",
      slam_dunks: "7"
      },
      "Brook Lopez" => {
      number: "11",
      shoe: "17",
      points: "17",
      rebounds: "19",
      assists: "10",
      steals: "3",
      blocks: "1",
      slam_dunks: "15"
      },
      "Mason Plumlee" => {
      number: "1",
      shoe: "19",
      points: "26",
      rebounds: "12",
      assists: "6",
      steals: "3",
      blocks: "8",
      slam_dunks: "5"
      },
      "Jason Terry" => {
      number: "31",
      shoe: "15",
      points: "19",
      rebounds: "2",
      assists: "2",
      steals: "4",
      blocks: "11",
      slam_dunks: "1"
      }}},
  away:  {
    team_name: "Charlotte Hornets",
    colors: ["Turquoise", "Purple"],
    players: {
      "Jeff Adrien" => {
      number: "4",
      shoe: "18",
      points: "10",
      rebounds: "1",
      assists: "1",
      steals: "2",
      blocks: "7",
      slam_dunks: "2"
      },
      "Bismak Biyombo" => {
      number: "0",
      shoe: "16",
      points: "12",
      rebounds: "4",
      assists: "7",
      steals: "7",
      blocks: "15",
      slam_dunks: "10"
      },
      "DeSagna Diop" => {
      number: "2",
      shoe: "14",
      points: "24",
      rebounds: "12",
      assists: "12",
      steals: "4",
      blocks: "5",
      slam_dunks: "5"
      },
      "Ben Gordon" => {
      number: "8",
      shoe: "15",
      points: "33",
      rebounds: "3",
      assists: "2",
      steals: "1",
      blocks: "1",
      slam_dunks: "0"
      },
      "Brendan Haywood" => {
      number: "33",
      shoe: "15",
      points: "6",
      rebounds: "12",
      assists: "12",
      steals: "22",
      blocks: "5",
      slam_dunks: "12"
      }}}
 }

end

def num_points_scored(player_name)
  game_hash.each do |team, team_data|
    team_data[:players].each do |player, player_data|
      return player_data[:points].to_i if player.to_s == player_name
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |team, team_data|
    team_data[:players].each do |player, player_data|
      return player_data[:shoe].to_i if player.to_s == player_name
    end
  end
end

def team_colors(team_name)
  game_hash.each do |team, team_data|
      return team_data[:colors] if team_data[:team_name] == team_name
    end
end

def team_names
  team_names_list = []
  game_hash.each { |team, team_data| team_names_list << team_data[:team_name] }
  team_names_list
end

def player_numbers(team_name)
  number_list = []
  game_hash.each do |team, team_data|
    if team_data[:team_name].to_s == team_name
      team_data[:players].each { |player, player_data| number_list << player_data[:number].to_i }
    end
  end
  number_list.sort
end

def player_stats(player_name)
  new_hash = {}
  game_hash.each do |team, team_data|
    team_data[:players].each do |name, player_data|
        player_data.each {|key, value| new_hash[key] = value.to_i} if name.to_s == player_name
    end
  end
  new_hash
end

def big_shoe_rebounds
  biggest_show_size = 0
  rebounds_biggest_show_size = 0

  game_hash.each do |team, team_data|

    team_data[:players].each do |player_name, player_data|

      if biggest_show_size == 0 || player_data[:shoe].to_i > biggest_show_size
        biggest_show_size = player_data[:shoe].to_i
        rebounds_biggest_show_size = player_data[:rebounds].to_i
      end
    end
  end
  rebounds_biggest_show_size
end

def most_points_scored
  highest_score = 0
  highest_score_player = 0

  game_hash.each do |team, team_data|

    team_data[:players].each do |player_name, player_data|

      if highest_score == 0 || player_data[:points].to_i > highest_score
        highest_score = player_data[:points].to_i
        highest_score_player = player_name.to_s
      end
    end
  end
  highest_score_player
end
