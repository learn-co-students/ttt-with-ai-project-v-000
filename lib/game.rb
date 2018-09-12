class Game
  include Players
  attr_accessor :board, :player_1, :player_2

  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2], #Top row
    [3,4,5], #Middle Row
    [6,7,8], #Bottom row
    [0,3,6], #first columns
    [1,4,7], #second columns
    [2,5,8], #last column
    [0,4,8], #first diagonal
    [2,4,6] #second diagonal
  ]

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"),board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  #Defines the current player
  def current_player
    x_plays = 0
    o_plays = 0

    @board.cells.each do |spot_on_board|
      x_plays += 1 if spot_on_board == "X"
      o_plays += 1 if spot_on_board == "O"
    end

    player = x_plays == o_plays ? "X" : "O"
    player == player_1.token ? @player_1 : @player_2
  end


    #determines if win is true or false
    def won?
      won = false
      WIN_COMBINATIONS.each do |win_combination|
        board_entries = [@board.cells[win_combination[0]], @board.cells[win_combination[1]], @board.cells[win_combination[2]]]
        board_entries == ["X", "X", "X"] || board_entries == ["O", "O", "O"] ? won = win_combination : false
      end
      won
    end

    #If the board includes "" or " ", the board is not full.
    def full?
      @board.cells.include?("") || @board.cells.include?(" ") ? false : true
    end

    #if nobody won but the board is full, it's a draw
    def draw?
      won? == false && full? ? true : false
    end

    # the game is over when somebody wins or there is a draw
    def over?
      draw? || won? ? true : false
    end

    #defines the winner if the game has been won
    def winner
      win_combination = won?
      if win_combination == false
        nil
      elsif @board.cells[win_combination[0]] == "X"
        return "X"
      elsif @board.cells[win_combination[0]] == "O"
        return "O"
      end
    end

    #user takes a turn
    def turn
      input = current_player.move(@board)
      if @board.valid_move?(input)
        @board.cells[input.to_i - 1] = current_player.token
        @board.display
      else
        turn
      end
    end

    def play
      while over? == false
        turn
      end

      if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
      else
        puts "Cat's Game!"
      end
    end

end
