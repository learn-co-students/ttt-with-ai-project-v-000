class Game
    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [6, 4, 2]
    ]

    def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
        @board = board
        @player_1 = player_1
        @player_2  = player_2
    end
    
    def current_player
        board.turn_count.even? ? player_1 : player_2
    end

    def won?
        WIN_COMBINATIONS.find do |win_array|
            board.cells[win_array[0]] == board.cells[win_array[1]] && board.cells[win_array[1]] == board.cells[win_array[2]] && board.cells[win_array[0]] != " "
        end
    end

    def winner
        board.cells[won?[0]] if won?
    end

    def draw?
        board.full? && !won?
    end

    def over?
        won? || draw?
    end

    # game managing methods
    def start
    end
    
    def play
        puts "Game #{@counter}" 
        until over?
          turn
        end
        if draw?
          puts "Cat's Game!"
        elsif won?
          puts "Congratulations #{winner}!"
        end
    end

    def turn
        puts "It's now #{current_player.token}'s turn."
        input = current_player.move(board).to_i
        if board.valid_move?(input.to_s)
          board.update(input, current_player)
          puts "Game #{@counter}"
        elsif input.between?(1, 9) == false
          puts "That is an invalid move"
          turn
        else
          puts "Whoops! Looks like that position is taken"
          turn
        end
    end


end
