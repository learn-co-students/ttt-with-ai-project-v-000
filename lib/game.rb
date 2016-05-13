class Game
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  attr_accessor :board, :player_1, :player_2

  def initialize(first_player = Player::Human.new("X"), second_player = Player::Human.new("O"), board = Board.new)
    @player_1 = first_player
    @player_2 = second_player
    @board = board
  end

  def current_player
    count = self.board.turn_count
    if count % 2 == 0
      player_1
    elsif count % 2 == 1
      player_2
    end
  end

  def over?
    over = true
    over = false unless won? || draw?
    over
  end

  def won?
    won = false
    WIN_COMBINATIONS.each do |x|
      if board.cells[x[0]] == "X" && board.cells[x[1]] == "X" && board.cells[x[2]] == "X" || board.cells[x[0]] == "O" && board.cells[x[1]] == "O" && board.cells[x[2]] == "O"
        won = true
      end
    end
    won
  end

  def draw?
    @board.full? == true && won? == false
  end

  def winner
    if won?
      WIN_COMBINATIONS.collect do |x|
        if @board.cells[x[0]] == @board.cells[x[1]] && @board.cells[x[1]] == @board.cells[x[2]] 
          if @board.cells[x[0]] == "X"
            return "X"
          elsif @board.cells[x[0]] == "O"
            return "O"
          end
          # I can't figure out why the following raised an error:
          # if @board.cells[x[0]] == @board.cells[x[1]] && @board.cells[x[1]] == @board.cells[x[2]] 
          #    @board.cells[x[0]]
          # Also, when I used binding.pry to go into my play method (I placed it under #{winner}), it says that won? was true even though there were only two objects on the board. When I place it at each new location, the #board method displays different results
        end
      end
    end
  end

  def turn
    if current_player.class == Player::Human
      puts "When making your selections, please enter 1-9:"
      user_input = current_player.move(@board).to_i
      if !board.valid_move?(user_input)
        puts "That is not a valid selction"
        turn
      elsif board.valid_move?(user_input)
        board.update(user_input, current_player)   
      end
    elsif current_player.class == Player::Computer
      puts "Your opponent is choosing"
      board.update(current_player.move(@board), current_player)
    end
    board.display
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{self.winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end