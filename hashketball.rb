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

def num_points_scored(player_name)
  points_scored = nil
  #set the points scored to nil because at this point, we haven't iterated
  #and there is no points scored because we haven't even gotten a player's name yet
  game_hash.each do |team, team_details|
    #iterate thru the overall hash, game_hash getting the
    #home or away team and the hashes that include that team's details
    player_deetz = team_details[:players]
    #make a new variable that equals the details hash of each player
    player_deetz.each do |player_details|
      #iterate thru the array of the players' details
      if player_details[:player_name] == player_name
      #if the value of the player_name is equal to the name you're looking for
      points_scored = player_details[:points]
      #then the points_scored variable is equal to the value of that player's (key)
      end
    end
  end
  points_scored
end

def shoe_size(name)
  the_shoe_size = nil
  game_hash.each do |team, team_details|
    player_deetz = team_details[:players]
    player_deetz.each do |player_details|
      if player_details[:player_name] == name
        the_shoe_size = player_details[:shoe]
        #the only difference here is you're grabbing the value of the :shoe key
      end
    end
  end
  the_shoe_size
end

def team_colors(team_name)
  colors = nil
  game_hash.each do |team, team_details|
    #iterate thru the game_hash, checking the team and their details
    if team_details[:team_name] == team_name
      #if the value of the team_name equals the team name you're looking for
      colors = team_details[:colors].flatten
      #then the colors of that team equal the value of the :colors key
      #use flatten to return a new array with the info inside of it
    end
  end
  colors
end

def team_names
  game_hash.map do |team, team_details|
    #iterate thru the games_hash, checking the values of the team & their details
    team_details[:team_name]
    #the value of the :team_name hash is the name of that team
  end
end

def player_numbers(team_name)
  players_numbers = []
  #make a new empty array that you will store the info in later
  game_hash.map do |team, team_details|
    #iterate thru the game_hash
    if team_details[:team_name] == team_name
      #if the team name key equals the one entered
      team_details[:players].each do |player|
        #go thru the players hash and iterate thru all the players of that team
        player.each do |key, value|
          #iterate thru the keys and values of each player
          if key == :number
            #if the key is :number
            players_numbers << value
            #then add the value of the :number key to the new array.
            #do this for each and every player of the team entered
          end
        end
      end
    end
  end
  players_numbers
end

def player_stats(player_name)
  players_stats = {}
  #make a new, empty hash which we will store the iteration in later
  game_hash.each do |team, team_details|
    #iterate thru the game hash
    team_details[:players].each do |stats|
      #once in the players hash, iterate thru each stat key/value pair
      if stats[:player_name] == player_name
        #if the player_name equals the player's name entered
        stats.delete(:player_name)
        #delete takes an arguement which is the player_name key/value pair
        #from the returned stat
        players_stats = stats
        #and then the player_stats hash will now include all the status
        #minus the player's name, because you already know the player's name
        #since you entered it in the first place
      end
    end
  end
  players_stats
  #return the new hash with all the info you've entered by iterating
end

def big_shoe_rebounds
  biggest_foot = 0
  rebounds = 0
  #we have to find the player with the biggest shoe size & return their rebounds
  #so we need something to compare each iteration against
  #we start out at zero because in the first loop, whoever is looped first
  #will be compared against no one (so their rebounds will also be zero)
  #and therefore have the biggest foot & their associated rebound #
  game_hash.each do |team, team_details|
    #iterate thru the games_hash
    team_details[:players].each do |stats|
      #iterate thru all the players and their stats
      if stats[:shoe] > biggest_foot
        #if the player's shoe is bigger than the current "biggest_foot"
        #(the person you are comparing against in each iteration)
        biggest_foot = stats[:shoe]
        #then that person's foot is the biggest foot!
        rebounds = stats[:rebounds]
        #get that player's rebounds
      end
    end
  end
  rebounds
  #return that player's # of rebounds
end
