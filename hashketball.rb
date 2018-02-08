require 'pry'

def game_hash
  hash = {:home =>
          {:team_name => "Brooklyn Nets",
           :colors => ["Black", "White"],
           :players => {
             "Alan Anderson" =>
                {:number => 0,
                :shoe => 16,
                :points => 22,
                :rebounds => 12,
                :assists => 12,
                :steals => 3,
                :blocks => 1,
                :slam_dunks => 1},
              "Reggie Evans" => {
                :number => 30,
                :shoe => 14,
                :points => 12,
                :rebounds => 12,
                :assists => 12,
                :steals => 12,
                :blocks => 12,
                :slam_dunks => 7},
              "Brook Lopez" => {
                :number => 11,
                :shoe => 17,
                :points => 17,
                :rebounds => 19,
                :assists => 10,
                :steals => 3,
                :blocks => 1,
                :slam_dunks => 15},
              "Mason Plumlee" => {
                :number => 1,
                :shoe => 19,
                :points => 26,
                :rebounds => 12,
                :assists => 6,
                :steals => 3,
                :blocks => 8,
                :slam_dunks => 5},
              "Jason Terry" => {
                :number => 31,
                :shoe => 15,
                :points => 19,
                :rebounds => 2,
                :assists => 2,
                :steals => 4,
                :blocks => 11,
                :slam_dunks => 1}}},

        :away =>
        {:team_name => "Charlotte Hornets",
         :colors => ["Turquoise", "Purple"],
         :players => {
           "Jeff Adrien" =>
              {:number => 4,
              :shoe => 18,
              :points => 10,
              :rebounds => 1,
              :assists => 1,
              :steals => 2,
              :blocks => 7,
              :slam_dunks => 2},
            "Bismak Biyombo" => {
              :number => 0,
              :shoe => 16,
              :points => 12,
              :rebounds => 4,
              :assists => 7,
              :steals => 7,
              :blocks => 15,
              :slam_dunks => 10},
            "DeSagna Diop" => {
              :number => 2,
              :shoe => 14,
              :points => 24,
              :rebounds => 12,
              :assists => 12,
              :steals => 4,
              :blocks => 5,
              :slam_dunks => 5},
            "Ben Gordon" => {
              :number => 8,
              :shoe => 15,
              :points => 33,
              :rebounds => 3,
              :assists => 2,
              :steals => 1,
              :blocks => 1,
              :slam_dunks => 0},
            "Brendan Haywood" => {
              :number => 33,
              :shoe => 15,
              :points => 6,
              :rebounds => 12,
              :assists => 12,
              :steals => 22,
              :blocks => 5,
              :slam_dunks => 12}}
              }
            }
end



def num_points_scored (name)

  game_hash.each do |location, details|
      details.each do |attribute, data|
        if attribute == :players
            game_hash[location][attribute].each do |player, info|
              if player == name
                return info[:points]
              end
            end
        end
      end
  end
end

def shoe_size(name)
  game_hash.each do |location, details|
      details.each do |attribute, data|
        if attribute == :players
            game_hash[location][attribute].each do |player, info|
              if player == name
                return info[:shoe]
              end
            end
        end
      end
  end
end

def shoe_size(name)
  game_hash.each do |location, details|
      details.each do |attribute, data|
        if attribute == :players
            game_hash[location][attribute].each do |player, info|
              if player == name
                return info[:shoe]
              end
            end
        end
      end
    end
  end

def team_colors(team)
  location = nil
        if team == "Brooklyn Nets"
            location = :home
        elsif team == "Charlotte Hornets"
            location = :away
        end
    return game_hash[location][:colors]
end

def team_names
  teams = []
  teams << game_hash[:home][:team_name]
  teams << game_hash[:away][:team_name]
  teams
end

def player_stats(name)
  game_hash.each do |location, details|
    details.each do |attribute, data|
      if attribute == :players
          game_hash[location][attribute].each do |player, info|
            if player == name
              return info
            end
          end
      end
    end
  end
end

def big_shoe_rebounds
  game_hash[:home][:players]["Mason Plumlee"][:rebounds]
end

# def player_numbers(team)
#   numbers = []
#   game_hash.each do |location, details|
#     if details[:team_name] = team
#       details[:players].each do |player|
#         player.each do |key, value|
#           if key == :number
#             numbers << value
#           end
#         end
#       end
#     end
#   end
#   numbers
# end

# def player_numbers (team_name)
#   player_numbers_list = []
#   game_hash.each do |team, team_details_hash|
#     if team_details_hash[:name] == team_name
#       team_details_hash[:players].each do |player|
#         player.each do |key, value|
#           if key == :number
#             player_numbers_list << value
#           end
#         end
#       end
#     end
#   end
#   player_numbers_list
# end


# def player_numbers(team)
#   location = nil
#   numbers = []
#         if team == "Brooklyn Nets"
#             location = :home
#         elsif team == "Charlotte Hornets"
#             location = :away
#         end
#       game_hash[location][team][:players].each_value do |stat|
#       numbers << stat[:number]
#   end
#     numbers
# end
# def player_numbers(team_name)
#   game_hash.each do |team, game_data|
#     if game_data[:team_name] == team_name
#       return game_data[:players].collect do |player|
#         player[:number]
#       end
#     end
#   end
# end
