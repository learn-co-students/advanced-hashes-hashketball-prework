require 'pry'

# Write your code here!
def game_hash

  game_hsh = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players:{
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise","Purple"],
      players:{
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }

  }
end

def num_points_scored(gamehash)
  hsh = game_hash
  ret = []
  hsh.each do |k,v|
    v.each do |key, val|
      if key == :players
        val.each do |name, data|
          if name == gamehash
            data.each do |stats,values|
              if stats == :points
                #binding.pry
                ret << values
              end
            end
          end
        end
      end
    end
  end
  #binding.pry
  ret[0]
end

def shoe_size(gamehash)
  hsh = game_hash
  ret = []
  hsh.each do |k,v|
    v.each do |key, val|
      if key == :players
        val.each do |name, data|
          if name == gamehash
            data.each do |stats,values|
              if stats == :shoe
                #binding.pry
                ret << values
              end
            end
          end
        end
      end
    end
  end
  #binding.pry
  ret[0]
end

def team_colors(gamehash)
  #binding.pry
  hsh = game_hash
  ret = []
  hsh.each do |k,v|
    v.each do |key, val|
      #binding.pry
      if val == gamehash
        ret << hsh[k][:colors]
      end
    end
  end
  #binding.pry
  ret[0]
end

def team_names
  hsh = game_hash
  ret = []
  hsh.each do |k,v|
    ret << hsh[k][:team_name]
  end
  ret
end

def player_numbers(gamehash)
  hsh = game_hash
  ret = []
  hsh.each do |k,v|
    v.each do |key,val|
      if val == gamehash
        hsh[k][:players].each do |p,d|
          d.each do |num, va|
            #inding.pry
            if num == :number
                #binding.pry
                ret << va
            end
          end
        end
      end
    end
  end
  ret
end

def player_stats(gamehash)
  hsh = game_hash
  ret = []
  hsh.each do |k,v|
    v.each do |ke, va|
      if ke == :players
        va.each do |key,val|
          if key == gamehash
            #binding.pry
            ret = val
          end

        end
      end
    end
  end
  ret
end

def big_shoe_rebounds
  hsh = game_hash
  ret = 0
  bigshoe = 0
  hsh.each do |k,v|
    v.each do |ke,va|
      if ke == :players
        va.each do |key,val|
          val.each do |keys,values|
            if keys == :shoe
              if bigshoe < values
                bigshoe = values
                #binding.pry
                ret = hsh[k][ke][key][:rebounds]
              end

            end
          end
        end
      end
    end
  end
  ret
end
