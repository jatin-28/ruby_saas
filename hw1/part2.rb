class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
    winningPairs = [["R","S"],["S","P"],["P","R"]]
    if winningPairs.include?([m2[1],m1[1]])
        m2
        else
        m1
    end
end

def rps_game_winner(game)
    raise WrongNumberOfPlayersError unless game.length == 2
    
    game.each { |pair|
        raise NoSuchStrategyError unless ['P','R','S'].include? pair[1]
    }
    
    rps_result game[0],game[1]
end

def rps_tournament_winner(tournament)
    first = tournament.send(:first)
    if Array === first[0] 
        first = rps_tournament_winner first
    end
    second = tournament.send(:last)
    if Array === second[1]
        second = rps_tournament_winner second
    end
    
    rps_game_winner [first,second]
end

