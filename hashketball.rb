require './hashketball.rb'



# Write your code below game_hash
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
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
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
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end




def num_points_scored(player)
  player_score = game_hash
  player_score.each do |key, value|
    value[:players].each do |value2|
      if value2[:player_name] == player
        return value2[:points]
    end
  end
 end     
end



def shoe_size(player)
  game_hash.each do |key, value|
    value[:players].each do |value2|
      if value2[:player_name] == player
        return value2[:shoe]
    end
  end
 end     
end




def team_colors (team)
 game_hash.each do |key, value|
    value.each do |key2, value2|
        if value2 == team
          return value[:colors]
     end
  end
 end     
end




def team_names
  game_hash.map { |key, value|
      value[:team_name]
  }
  
      
end

#The map method takes an enumerable object and a block, and runs the block for each element, outputting each returned value from the block (the original object is unchanged unless you use map!):

#What is the difference between map! and each? Here is an example:

#names = ['danil', 'edmund']

# here we map one array to another, convert each element by some rule
#names.map! {|name| name.capitalize } # now names contains ['Danil', 'Edmund']

#names.each { |name| puts name + ' is a programmer' } # here we just do something with each element




def player_numbers(teamname)
  game_hash.each do |key, value|
    if value[:team_name] == teamname
      return value[:players].map { 
       |value2|
            value2[:number]
        }
    end 
  
 end     
end
  
  
def player_stats(playersname)
 game_hash.each do |key, value|
    value[:players].each do |value2|
      if value2[:player_name] == playersname
        return value2
      end
  end
 end     
end






def big_shoe_rebounds
  
  biggestshoe = 0
  biggestshoereal = 0
  playerwithbiggestshoe = ""
  numberofrebounds = 0
  
  game_hash.each do |key, value|
    value[:players].each do |value2|
     biggestshoe = value2[:shoe]
     if biggestshoe > biggestshoereal
       biggestshoereal = biggestshoe
       numberofrebounds = value2[:rebounds]
       playerwithbiggestshoe= value2[:player_name]
        end
      end
    end
 return numberofrebounds
end

# rspec spec/hashketball_spec.rb -e num_points_scored


#game_hash[:home][:team_name]
