class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player1 = Player::Human.new("X"), player2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player1
    @player_2 = player2
    @board = board
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #left column
    [1,4,7], #middle column
    [2,5,8], #right column
    [0,4,8], #top left to bottom right
    [6,4,2]  #bottom left to top right
  ]

  def current_player
    (self.board.turn_count.even? ? self.player_1 : self.player_2)
  end

  def over?
    (self.draw? || self.won? ? true : false)
  end

  def full?
    @board.cells.each do |token|
      if token == " "
        return false
      end
    end
  end

  def draw?
    if full? && !won?
      return true
    elsif !won? && !full?
      return false
    else
      return false
    end
  end

  def won?
    winner = false

    WIN_COMBINATIONS.each do |combo|
      if @board.cells[combo[0]] == "X" && 
         @board.cells[combo[1]] == "X" && 
         @board.cells[combo[2]] == "X" || 
         @board.cells[combo[0]] == "O" && 
         @board.cells[combo[1]] == "O" && 
         @board.cells[combo[2]] == "O"
          winner = [combo[0],combo[1],combo[2]]
      end
    end

    return winner
  end

  def winner
    if won? == false
      return nil
    else 
      @board.cells[won?[0]]
    end
  end

  def turn
    player = current_player
    puts "Player #{player.token}:"
    token_placement = player.move(@board)
    if @board.valid_move?(token_placement)
      @board.update(token_placement, player)
      @board.display
      puts "\r\n"
    else
      puts "invalid"
      turn
    end
  end

  def play
    until over?
      turn
    end
    if winner == nil
      puts "Cats Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end

end