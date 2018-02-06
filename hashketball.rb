def game_hash
    game = {
        home:{
            team_name:'Brooklyn Nets',
            colors:['Black','White'],
            players:{
                'Alan Anderson'=>{
                    number:0,
                    shoe:16,
                    points:22,
                    rebounds:12,
                    assists:12,
                    steals:3,
                    blocks:1,
                    slam_dunks:1
                },
                'Reggie Evans'=>{
                    number:30,
                    shoe:14,
                    points:12,
                    rebounds:12,
                    assists:12,
                    steals:12,
                    blocks:12,
                    slam_dunks:7
                },
                'Brook Lopez'=>{
                    number:11,
                    shoe:17,
                    points:17,
                    rebounds:19,
                    assists:10,
                    steals:3,
                    blocks:1,
                    slam_dunks:15
                },
                'Mason Plumlee'=>{
                    number:1,
                    shoe:19,
                    points:26,
                    rebounds:12,
                    assists:6,
                    steals:3,
                    blocks:8,
                    slam_dunks:5
                },
                'Jason Terry'=>{
                    number:31,
                    shoe:15,
                    points:19,
                    rebounds:2,
                    assists:2,
                    steals:4,
                    blocks:11,
                    slam_dunks:1
                }
            }
        },
        away:{
            team_name:'Charlotte Hornets',
            colors:['Turquoise','Purple'],
            players:{
                'Jeff Adrien'=>{
                    number:4,
                    shoe:18,
                    points:10,
                    rebounds:1,
                    assists:1,
                    steals:2,
                    blocks:7,
                    slam_dunks:2
                },
                'Bismak Biyombo'=>{
                    number:0,
                    shoe:16,
                    points:12,
                    rebounds:4,
                    assists:7,
                    steals:7,
                    blocks:15,
                    slam_dunks:10
                },
                'DeSagna Diop'=>{
                    number:2,
                    shoe:14,
                    points:24,
                    rebounds:12,
                    assists:12,
                    steals:4,
                    blocks:5,
                    slam_dunks:5
                },
                'Ben Gordon'=>{
                    number:8,
                    shoe:15,
                    points:33,
                    rebounds:3,
                    assists:2,
                    steals:1,
                    blocks:1,
                    slam_dunks:0
                },
                'Brendan Haywood'=>{
                    number:33,
                    shoe:15,
                    points:6,
                    rebounds:12,
                    assists:12,
                    steals:22,
                    blocks:5,
                    slam_dunks:12
                }
            
            }
        }
    }
end

def num_points_scored(get_player)
    points = 0
    hash = game_hash
    hash.each do |team,data|
        if data[:players].has_key?(get_player)
            points = data[:players][get_player][:points]
        end
    end
    points
end
                
def shoe_size(get_player)
    size = 0
    hash = game_hash
    hash.each do |team,data|
        if data[:players].has_key?(get_player)
            size = data[:players][get_player][:shoe]
        end
    end
    size
end

def team_colors(team)
    colors = nil
    hash = game_hash
    hash.each do |t, data|
        if data[:team_name] == team
            colors = data[:colors]
        end
    end
    colors
end

def team_names
    hash = game_hash
    hash.collect {|team, data| data[:team_name]}
end

def player_numbers(team)
    hash = game_hash
    nums = []
    hash.each do |t, data|
        if data[:team_name] == team
            nums = data[:players].collect {|player, stats| stats[:number]}
        end
    end
    nums
end

def player_stats(get_player)
    stats = 0
    hash = game_hash
    hash.each do |team,data|
        if data[:players].has_key?(get_player)
            stats = data[:players][get_player]
        end
    end
    stats
end

def big_shoe_rebounds
    rebounds = 0
    biggest_shoe = 0
    hash = game_hash
    hash.each do |team, data|
        data[:players].each do |player, stats|
            if stats[:shoe] > biggest_shoe
                rebounds = stats[:rebounds]
                biggest_shoe = stats[:shoe]
            end
        end
    end
    rebounds
end
    
    





    
    
