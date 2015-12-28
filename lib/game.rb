class Game 
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], # Top Row
    [3,4,5], # Middle Row
    [6,7,8], # Bottom Row
    [0,3,6], # left vertical row
    [1,4,7], # middle vertical row
    [2,5,8], # right vertical row
    [0,4,8], # top left to bottom right row
    [6,4,2]  # bottom left to top right row
  ]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      win_pos1 = combo[0]
      win_pos2 = combo[1]
      win_pos3 = combo[2]

      position1 = self.board.cells[win_pos1]
      position2 = self.board.cells[win_pos2]
      position3 = self.board.cells[win_pos3]

      if (position1 == "X" && position2 == "X" && position3 == "X") || (position1 == "O" && position2 == "O" && position3 == "O")
        return combo
      end
    end
    return false
  end

  def over?
    if self.board.full? || self.won? || self.draw?
      return true
    end
  end

  def draw?
    self.board.full? && !self.won?
  end

  def winner
    if self.won?
      self.board.cells[self.won?[0]]
    end
  end

  def turn
    if board.turn_count == 0
      puts "#{self.player_1} goes first."
      self.board.display
    end
    input = self.current_player.move(self.board)
    if self.board.valid_move?(input)
      self.board.update(input, self.current_player)
      self.board.display
      sleep(1)
    else
      puts "That move was invalid"
      self.turn
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end


end