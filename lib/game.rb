class Game
  attr_accessor :board, :player_1, :player_2, :win_token

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
    # assign win combinations
    WIN_COMBINATIONS.each do |win_combo|
      index_1= win_combo[0]
      index_2 = win_combo[1]
      index_3 = win_combo[2]

      #check if spots are taken, then assign to a token
      if @board.taken?(index_1) && @board.taken?(index_2) && @board.taken?(index_3)
        token_1 = @board.cells[index_1]
        token_2 = @board.cells[index_2]
        token_3 = @board.cells[index_3]

        #check if tokens are the same if yes, it is a win
        if token_1 == token_2 && token_2 == token_3
          @win_token = token_1
          return true
        end
      else
        false
      end
    end
    false
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def draw?
    if self.won?
      false
    elsif @board.full?
      true
    else
      false
    end
  end

  def over?
     self.won? || @board.full? || self.draw? ? true : false
  end

  def winner
    @win_token if self.won?
  end

  def turn
    current_player = self.current_player
    input = current_player.move(@board)
    if @board.valid_move?(input)
      @board.cells[self.input_to_index(input)] = current_player.token
    else
      puts "invalid"
      self.turn
    end
  end

  def play
    until self.over?
      self.turn
    end

    if self.won?
      puts "Congratulations #{win_token}!"
    else
      puts "Cat's Game!"
    end
  end

end
