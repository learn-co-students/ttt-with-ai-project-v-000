require 'pry'
class Game
  # extend Players :: Humans (wonder)
  # include Players
  attr_accessor :board, :player_1, :player_2, :user_input

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    #   # return the player whose turn it is
    #   #if move is odd return player_1 token
    if @board.turn_count.even? #if count is even then player 2 jsut moved
      player_1
    else
      player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combination|   #[0,1,2] which is board range (0-8)
        if @board.cells[combination[0]] == @board.cells[combination[1]] &&
          @board.cells[combination[1]] == @board.cells[combination[2]] &&
          @board.taken?(combination[0]+1)
          # user_input range (1-9)
          return combination # returns the winner combination
        end
      end
      return false #if there is not a winner
    end

    def draw? # check if board is full or if anyone won
      @board.full? && !self.won? ? true : false
    end

    def over? # game is over if there is a draw or winner
      self.draw? || self.won?
    end

    def winner #check current player when there is a winning combination
      if won? # self.won?.all? == "X" || "O" # check to see which player
        combination = won?
        @board.cells[combination[0]] # X or O
      end
    end

    def turn
      # check to make sure its a valid move
      #if valid update board
    @user_input = current_player.move(@board)
        if @board.valid_move?(@user_input)
          @board.update(@user_input, current_player)
        else puts "Please enter a number 1-9:"
          @board.display
        turn
        end

      # @user_input = current_player.move(@board)
      #   if @board.valid_move?(@user_input)
      #     @board.update(@user_input, current_player)
      #   else puts "Please enter a number 1-9:"
      #     @board.display
      #   turn
      #   end
      # binding.pry
      # move = @board.valid_move?(user_input)
      # if move == true
      #   @board.update(move,current_player)
      #   _pla
      #   self.current_player
      # else
      #   false
      # end

      # if @board.valid_move?(@board.position,self.current_player) == true
      #
      #   @board.update(self.current_player)
      # end

    end

    def play
      until over?
        turn
      end
      if winner
        puts "Congratulations #{winner}!"
      else draw?
        puts "Cat's Game!"
      end

    end



  WIN_COMBINATIONS = [
 [0,1,2],
 [3,4,5],
 [6,7,8],
 [0,3,6],
 [1,4,7],
 [2,5,8],
 [0,4,8],
 [2,4,6] ]

end
