class Game
    
    attr_accessor :board, :player_1, :player_2
    #access provided
    
     WIN_COMBINATIONS = [[0,1,2],
                        [3,4,5],
                        [6,7,8],
                        [0,3,6],
                        [1,4,7],
                        [2,5,8],
                        [0,4,8],
                        [6,4,2]
                        ]
     
     def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
         @board = board
         @player_1 = player_1
         @player_2 = player_2
     end
     #initialize 2 players & board w/default olayers, X , O & empty board
     
     def current_player
         board.turn_count.even? ? @player_1 : @player_2
     end
     #returns corrct player for 3rd(even) move
     
     def over?
         draw? || won?
     end
     
     def draw?
         @board.full? && !won?
     end
     
     def winner
         winner_token = won?
         winner_token ? @board.cells[winner_token[0]] : nil
     end

     def won?
        WIN_COMBINATIONS.any? do |combo|
            if @board.taken?(combo[0] + 1) && @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]]
                return combo
            end
        end
     end

     def turn
            player = current_player
            puts "\nPlease input 1-9(#{player.token} turn):"
            player_move = player.move(@board)
            if !@board.valid_move?(player_move)
                turn
                else
                @board.update(player_move, player)
                puts "\n\n"
                puts "#{player.token} moved #{player_move}"
                @board.display
            end
     end

     def play
        puts 'Board layout'
        @board.display
        turn until over?
        won? ? (puts "Congratulations #{winner}!") : (puts "Cat's Game!")
     end     
end
