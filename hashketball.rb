def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        },

      },
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
         "Bismak Biyombo" => {
           :number => 0,
           :shoe => 16,
           :points => 12,
           :rebounds => 4,
           :assists => 7,
           :steals => 7,
           :blocks => 15,
           :slam_dunks => 10
         },
         "DeSagna Diop" => {
           :number => 2,
           :shoe => 14,
           :points => 24,
           :rebounds => 12,
           :assists => 12,
           :steals => 4,
           :blocks => 5,
           :slam_dunks => 5
         },
         "Ben Gordon" => {
           :number => 8,
           :shoe => 15,
           :points => 33,
           :rebounds => 3,
           :assists => 2,
           :steals => 1,
           :blocks => 1,
           :slam_dunks => 0
         },
         "Brendan Haywood" => {
           :number => 33,
           :shoe => 15,
           :points => 6,
           :rebounds => 12,
           :assists => 12,
           :steals => 22,
           :blocks => 5,
           :slam_dunks => 12
         }
      },
    },
  }
end

def num_points_scored(name)
  game_hash.each do |key, value|
    value[:players].each do |p_name, p_stats|
      if p_name == name
        return p_stats[:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |key, value|
    value[:players].each do |p_name, p_stats|
      if p_name == name
        return p_stats[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  the_colors = []
  game_hash.each do |key, value|
    if value[:team_name] == team_name
      the_colors = value[:colors]
    end
  end
  the_colors
end

def team_names
  team_names_array = []
  game_hash.each do |key, value|
    if value[:team_name]
      team_names_array << value[:team_name]
    end
  end
  team_names_array
end




def player_numbers(team_name)
  result = game_hash.select { |key, value| value[:team_name] == team_name }
  result.values[0][:players].map { |_, attribute| attribute[:number] }
end

def player_stats(name)
    game_hash.each_with_object([]) do |(key, value), result|
      unless game_hash[key][:players][name].nil?
        result << game_hash[key][:players][name]
    end
  end.first
end

def big_shoe_rebounds
  result = game_hash.each_with_object([]) do |(key, value), r|
    r << value[:players].map do |_, attribute|
      [attribute[:shoe], attribute[:rebounds]]
    end.max
  end.max.last
end
