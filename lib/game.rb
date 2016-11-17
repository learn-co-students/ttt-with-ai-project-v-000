class Game
attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left columns
  [1,4,7], #middle columns
  [2,5,8], #right columns
  [0,4,8], #diagonal 1
  [2,4,6] #diagonal 2
]

#on initialization you select player1 and 2's statuses as either human or computer, and initialize them with their token value; i defaulted a human vs human here
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end


  #current_player return's either player_1 or player_2, which are instance variables = to instance of Player, where Player.token = their token
    def current_player #player 1 goes first because 0 is even. so first turn is player 1, second is player 2, 3rd is player 1
      @board.turn_count.even? ? @player_1 : @player_2
    end

    def full?
      @board.cells.all? do |position|
        position != " "
      end
    end

    def draw?
      !won? && full?
    end

    def over?
      won? != false || draw? == true
    end

    def won? #goes through our WIN_COMBINATIONS constant, isolates the win_combos.  checks to see if all 3 positions of win_combos are filled by the same character that isn't zero. if so, game is won, and it will return said win_combination, which remember is a set of positions on the Board
        if WIN_COMBINATIONS.detect do |win_combination|
    		    if @board.cells[win_combination[0]] == @board.cells[win_combination[1]] && @board.cells[win_combination[1]] == @board.cells[win_combination[2]] && @board.cells[win_combination[0]] != " "
              return win_combination
            end
        end
        else
          false
        end
    end

    def winner #returns X or O
      WIN_COMBINATIONS.detect do |win_combination|
        if @board.cells[win_combination[0]] == @board.cells[win_combination[1]] && @board.cells[win_combination[1]] == @board.cells[win_combination[2]] && @board.cells[win_combination[0]] != " "
          return @board.cells[win_combination[0]]
        else
          nil
        end
      end
    end


    def turn
      input = current_player.move(board) #asks human player_1 or computer player_1 at first, what position do u wanna try. so will do player_1.move, whcih will return string, then we check if valid. if so, we make the move via update, which takes in the string, and the current_player; #update handles their move AND token. if it is invalid, try again

      if @board.valid_move?(input) == true

        @board.update(input, current_player)
      else
        turn
      end
      @board.display
    end


    def play #runs turn until the game is over.
      @board.display
      until over? == true
      turn
      end
      if won? != false
        character = winner
        puts "Congratulations #{character}!"
      elsif draw?
        puts "Cats Game!"
      end
    end







end
