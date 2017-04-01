# Write your code here!
def game_hash
    {
    :home => {
      :team_name => 'Brooklyn Nets',
      :colors => ['Black','White'],
      :players => {
        :names =>{
        'Alan Anderson' => {
        :number => 0 ,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3, 
        :blocks => 1,
        :slam_dunks => 1
        },
        'Reggie Evans' => {
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12, 
        :blocks => 12,
        :slam_dunks => 7
        },
        'Reggie Evans' => {
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12, 
        :blocks => 12,
        :slam_dunks => 7
        },
        'Brook Lopez' => {
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3, 
        :blocks => 1,
        :slam_dunks => 15
        },
        'Mason Plumlee' => {
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3, 
        :blocks => 8,
        :slam_dunks => 5
        },
          'Jason Terry' => {
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4, 
        :blocks => 11,
        :slam_dunks => 1
        }
      }
    }
  },
    :away => {
      :team_name => 'Charlotte Hornets',
      :colors => ['Turquoise','Purple'],
      :players => {
        :names =>{
        'Jeff Adrien' => {
        :number => 4 ,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2, 
        :blocks => 7,
        :slam_dunks => 2
        },
        'Bismak Biyombo' => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7, 
        :blocks => 15,
        :slam_dunks => 10
        },
        'DeSagna Diop' => {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4, 
        :blocks => 5,
        :slam_dunks => 5
        },
        'Ben Gordon' => {
        :number => 8 ,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1, 
        :blocks => 1,
        :slam_dunks => 0
        },
        'Brendan Haywood' => {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22, 
        :blocks => 5,
        :slam_dunks => 12
        }
      }
    }
    }
  }
end

def num_points_scored (name)
  if (game_hash[:home][:players][:names][name])
    game_hash[:home][:players][:names][name][:points]
  elsif (game_hash[:away][:players][:names][name])
    game_hash[:away][:players][:names][name][:points]
  else 
    return nil
  end
end


def shoe_size (name)
  if (game_hash[:home][:players][:names][name])
    return game_hash[:home][:players][:names][name][:shoe]
  else 
    return game_hash[:away][:players][:names][name][:shoe]
  end
end

  def team_colors (name)
    if (game_hash[:home][:team_name] == name)
      game_hash[:home][:colors]
    elsif (game_hash[:away][:team_name] == name)
      game_hash[:away][:colors]
    else 
      nil
    end
  end

def team_names ()
  teams = []
  game_hash.each do |ha,data|
    data.each do |titles,data|
      if titles == :team_name
        teams.push(data)
        end
    end
  end
  teams
end

def player_numbers (team)
  teams = []
  game_hash.each do |ha,data|
    data.each do |titles,data|
      if titles == :team_name
        teams.push(data)
        end
    end
  end
  teams
end

def player_numbers (team)
  nums = []
  if (game_hash[:home][:team_name] == team)
    game_hash[:home][:players][:names].each do |name,stats|
      nums.push(stats[:number])
    end
  else
    game_hash[:away][:players][:names].each do |name,stats|
      nums.push(stats[:number])
    end
  end
  nums
end

def player_stats (name)
  if (game_hash[:home][:players][:names][name])
    return game_hash[:home][:players][:names][name]
  else 
    return game_hash[:away][:players][:names][name]
  end
end

def big_shoe_rebounds 
  size = 0
  big_boy = {}
  game_hash[:home][:players][:names].each do |name,stats|
    if stats[:shoe] > size
      size = stats[:shoe]
    end
  end
  game_hash[:away][:players][:names].each do |name,stats|
    if stats[:shoe] > size
      size = stats[:shoe]
    end
  end
  game_hash[:home][:players][:names].each do |name,stats|
    if stats[:shoe] == size
      return stats[:rebounds]
    end
  end
  game_hash[:away][:players][:names].each do |name,stats|
    if stats[:shoe] == size
      return stats[:rebounds]
    end
  end
end