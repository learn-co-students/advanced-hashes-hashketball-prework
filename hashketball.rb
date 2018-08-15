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


