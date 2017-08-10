def game_hash
  hash ={
  home:
  {
    team_name: 'Brooklyn Nets',
    colors: ['Black','White'],
    players:
    {
      "Alan Anderson" =>
      {
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1
      },
      "Reggie Evans" =>
      {
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7
      },
      "Brook Lopez" =>
      {
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15
      },
      "Mason Plumlee" =>
      {
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 12,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5
      },
      "Jason Terry" =>
      {
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
  away:
  {
    team_name: 'Charlotte Hornets',
    colors: ['Turquoise','Purple'],
    players:
    {
      "Jeff Adrien" =>
      {
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2
      },
      "Bismak Biyombo" =>
      {
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 7,
        blocks: 15,
        slam_dunks: 10
      },
      "DeSagna Diop" =>
      {
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5
      },
      "Ben Gordon" =>
      {
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0
      },
      "Brendan Haywood" =>
      {
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

def num_points_scored(player)
  points = 0
  game_hash.each do |side, info|
    info.each do |cat, info|
      if cat == :players
        info.each do |name, stat| #name is player name
        if name== player
          stat.each do |item, number|
            if item== :points
              points= number
            end
          end
        end
        end
      end
    end
  end
  return points
end

def shoe_size(player)
  points = 0
  game_hash.each do |side, info|
    info.each do |cat, info|
      if cat == :players
        info.each do |name, stat| #name is player name
        if name== player
          stat.each do |item, number|
            if item== :shoe
              points= number
            end
          end
        end
        end
      end
    end
  end
  return points
end


def team_colors(name)
  colors = [1]
  game_hash.each do |side, info|
    if info[:team_name]==(name)
      colors = info[:colors]
    end
  end
  return colors
end

def team_names
  newArray = []
  game_hash.each do |side, info|
    newArray.push(info[:team_name])
  end
  return newArray
end

def player_numbers(team)
  numbers = []
  game_hash.each do |side, info|
    if info[:team_name]== team
      info[:players].each do |name, lists|
        numbers.push(lists[:number])
      end
    end
  end
  return numbers
end

def player_stats(name)
  numbers = {}
  game_hash.each do |side, info|
      info[:players].each do |person, lists|
        if person == name
          numbers = lists
        end
      end
  end
  return numbers
end

def big_shoe_rebounds
  shoe = 0
  rebounds = 0
  game_hash.each do |side, info|
    info.each do |x, lists|
      if x== :players
        lists.each do |a,b|
          if b[:shoe] > shoe
            shoe = b[:shoe]
            rebounds = b[:rebounds]
          end
        end
      end
    end
  end
  return rebounds
end
