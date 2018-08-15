require "pry"

def game_hash
  {
    home: {team_name: "Brooklyn Nets",
           colors: ["Black", "White"],
           players: {"Alan Anderson" => { number: 0,
                             shoe: 16, 
                             points: 22, 
                             rebounds: 12, 
                             assists: 12, 
                             steals: 3, 
                             blocks: 1,
                             slam_dunks: 1},
                     "Reggie Evans" => { number: 30,
                             shoe: 14, 
                             points: 12, 
                             rebounds: 12, 
                             assists: 12, 
                             steals: 12, 
                             blocks: 12,
                             slam_dunks: 7},       
                     "Brook Lopez" => { number: 11,
                             shoe: 17, 
                             points: 17, 
                             rebounds: 19, 
                             assists: 10, 
                             steals: 3, 
                             blocks: 1,
                             slam_dunks: 15},
                     "Mason Plumlee" => { number: 1,
                             shoe: 19, 
                             points: 26, 
                             rebounds: 12, 
                             assists: 6, 
                             steals: 3, 
                             blocks: 8,
                             slam_dunks: 5},
                     "Jason Terry" => { number: 31,
                             shoe: 15, 
                             points: 19, 
                             rebounds: 2, 
                             assists: 2, 
                             steals: 4, 
                             blocks: 11,
                             slam_dunks: 1}
                    }
          }
    away: {team_name: "",
           colors: ["", ""],
           players: {"" => { number: ,
                             shoe: , 
                             points: , 
                             rebounds: , 
                             assists: , 
                             steals: , 
                             blocks: ,
                             slam_dunks: },
                     "" => { number: ,
                             shoe: , 
                             points: , 
                             rebounds: , 
                             assists: , 
                             steals: , 
                             blocks: ,
                             slam_dunks: },       
                     "" => { number: ,
                             shoe: , 
                             points: , 
                             rebounds: , 
                             assists: , 
                             steals: , 
                             blocks: ,
                             slam_dunks: },
                     "" => { number: ,
                             shoe: , 
                             points: , 
                             rebounds: , 
                             assists: , 
                             steals: , 
                             blocks: ,
                             slam_dunks: },
                     "" => { number: ,
                             shoe: , 
                             points: , 
                             rebounds: , 
                             assists: , 
                             steals: , 
                             blocks: ,
                             slam_dunks: }
                    }
  }
end 


def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry
 
        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end
good_practices


