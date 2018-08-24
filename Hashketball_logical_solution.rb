require 'pry'
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

#QUESSTION ONE:
#Build a method, num_points_scored that takes in an argument of a player's name
#and returns the number of points scored for that player.

#There is a 3 step process to get the result:

#STEP 1:
#Get the hash of all the player_stats
def players
  home_players = game_hash.fetch(:home).fetch(:players)
  away_players = game_hash.fetch(:away).fetch(:players)
  home_players + away_players
end

#STEP 2:
#Create a method to find the hash of a single player when neame given:
def find_the_player(name)
  #this iteration returns the first HASH of the player where the
  #condition in the code block is true!
  players.find {|player| player.fetch(:player_name) == name}
end

#STEP 3:
#take the method from step 2 and save result in variable
#then access the value by accessing the related key as normal
def num_points_scored(name)
  player = find_the_player(name)
  player.fetch(:points)
end


#QUESSTION TWO:
#Build a method, shoe_size, that takes in an argument of a player's
#name and returns the shoe size for that player.

#This is simple given the we already have the 'find_the_player(name)' method
#above:

def shoe_size(player_name)
  player = find_the_player(name)
  player.fetch(:shoe)
end

#QUESSTION 3:
#Build a method, team_colors, that takes in an argument of the team name and
#returns an array of that teams colors.

#This is another 3 step method:

#STEP 1: Get all the teams:
def teams
  game_hash.values
end

#STEP 2: Find the right team:
def find_the_team(team_name)
  teams.find {|team| team.fetch(:team_name) == team_name}
end

#STEP 3: Once you have the right team, get the colours!
def team_colors(team_name)
  team = find_the_team(team_name)
  team.fetch(:colors)
end

#Solution written in a single method:
def team_colors(team_name)
  #Step 1:
  teams = game_hash.values
  #Step 2:
  rigth_team = teams.find {|team| team.fetch(:team_name) == team_name}
  #Step 3:
  rigth_team.fetch(:colors)
end

#QUESSTION 4:
#Build a method, team_names, that operates on the game hash to
#return an array of the team names.

def team_names
  teams = game_hash.values
  team.map do |team|
    team[:team_name]
  end
end

#QUESSTION 5:
#Build a method, player_numbers, that takes in an argument of a team name and
#returns an array of the jersey number's for that team.

def player_numbers(team_name)
  #Step 1:
  teams = game_hash.values
  #Step 2:
  rigth_team = teams.find {|team| team.fetch(:team_name) == team_name}
  #Step 3: iterate over player hashes and access jersey number
  right_team[:players].map do |player|
    players[:number]
  end
end

#QUESSTION 6:
#Build a method, player_stats, that takes in an argument of a player's name
#and returns a hash of that player's stats.

def player_stats(player_name)
  #Step 1: get all player hashes
  home_players = game_hash.fetch(:home).fetch(:players)
  away_players = game_hash.fetch(:away).fetch(:players)
  players = home_players + away_players
  #Step 2: Find the correctr Hash
  players.find {|player| player.fetch(:player_name) == player_name}
end

#QUESSTION 7:
#Build a method, big_shoe_rebounds, that will return the number of rebounds
#associated with the player that has the largest shoe size. Break this one down
#into steps:

#Step one: find player with largest shoe shoe_size

def largest_shoe_size
  home_players = game_hash.fetch(:home).fetch(:players)
  away_players = game_hash.fetch(:away).fetch(:players)
  players = home_players + away_players

  #Step 1: Find player with biggest shoe size
  player = players.sort_by {|player| player.fetch(:shoe) }.last
  #Step 2: Access rebounds:
  player.fetch(:rebounds)

  # shoe_sizes = []
  # players.each do |player|
  #   shoe_sizes << player[:shoe]
  # end
  # largest_shoe = shoe_sizes.sort.last
  #
  # right_hash = players.find do |player|
  #   player.fetch(:shoe) == largest_shoe
  # end
  #
  # right_hash[:rebounds]
end


#BONUS QUESTIONS

#Which player has the most points? Call the method most_points_scored.

def most_points_scored
    #Now using the 'players method for simplicity'

    player = players.sort_by {|player| player.fetch(:points) }.last
    binding.pry
    player[:player_name]

end

#Which team has the most points? Call the method winning_team.

def winning_team

  home_team = []
  away_team = []

  game_hash.fetch(:home).fetch(:players).map |player|
    home_team << player[points]
  end

  game_hash.fetch(:away).fetch(:players).map |player|
    away_team << player[points]
  end


  home_total = home_team.inject(0){ |sum, n| sum + n }
  away_total = away_team.inject(0){ |sum, n| sum + n }

  if home_total > away_total
    game_hash.fetch(:home).fetch(:team_name)
  else
    game_hash.fetch(:away).fetch(:team_name)
  end

end
