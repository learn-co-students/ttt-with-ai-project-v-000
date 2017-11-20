class Game
  attr_accessor :board, :player_1, :player_2, :winner
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize(player_1 = Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if @board.turn_count % 2 == 0
      @player_1
    else
      @player_2
    end
  end

  def over?
    if self.won? || self.draw?
      true
    else
      false
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      win_index_1 = combo[0]
      win_index_2 = combo[1]
      win_index_3 = combo[2]

      position_1 = @board.cells[win_index_1]
      position_2 = @board.cells[win_index_2]
      position_3 = @board.cells[win_index_3]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X")
        @winner = "X"
        return combo
      elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
        @winner = "O"
        return combo
      end
    end
    false
  end

  def draw?
    if self.won? == false && self.board.full?
      true
    else
      false
    end
  end

  def winner
    if self.won?
      @winner
    end
  end

  def turn
    input = self.current_player.move
    if @board.valid_move?(input)
      @board.update(input, self.current_player)
    else
      self.turn
    end
  end

  def play
    while !self.over?
      @board.display
      self.turn
    end
    if self.draw?
      @board.display
      puts "Cat's Game!"
    else
      @board.display
      puts "Congratulations #{self.winner}!"
    end
  end


  def self.start
    puts "WELCOME TO TIC TAC TOE"
    puts "Would you like to play with 0, 1, or 2 players?"
    input = gets.chomp.to_i
    if !input.between?(0,2)
      self.start
    end

    case input
    when 0
      game = Game.new(Players::Computer.new("X"),Players::Computer.new("O"),Board.new)
      game.play
    when 1
      game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
      game.play
    when 2
      game = Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new)
      game.play
    end
    puts "Would you like to play again? (y/n)"
    again = gets.chomp
    if again == "y"
      self.start
    else
      return
    end
  end
end
