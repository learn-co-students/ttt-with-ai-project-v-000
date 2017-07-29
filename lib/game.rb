class Game

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  #First column
    [1,4,7],  #Second column
    [2,5,8],  #Third column
    [0,4,8],  #diagonal1
    [2,4,6]  #diagonal2
  ]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      board.cells[combination[0]] == board.cells[combination[1]] && board.cells[combination[1]] == board.cells[combination[2]] && board.taken?(combination[0]+1)
    end
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    if won?
      win_index = won?[0]
      @board.cells[win_index]
    else
      return nil
    end
  end


  def turn
    user_input = self.current_player.move(board)
    if board.valid_move?(user_input)
      board.update(user_input, self.current_player)
      board.display
    else
      puts "Invalid. Please pick a spot 1-9"
      turn
    end

  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def play_game
    puts "Would you like to play 0, 1, or 2 player? OR Type exit to exit."
    user_input = gets.chomp
    case user_input
    when '0'
      puts "The computer will play itself."
      Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
    when '1'
      puts "Your opponent will be the computer."
      puts "Would you like to go first and be X? (y/n)"
      input = gets.strip
      if input == 'y'
      Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
    else
      Game.new(Players::Human.new("0"), Players::Computer.new("X")).play
    end

    when '2'
      puts "I see there are two humans. Good luck!"
      puts "Would you like to go first and be X? (y/n)"
      input = gets.strip
      if input == 'y'
      Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
    else
      Game.new(Players::Human.new("0"), Players::Human.new("X")).play
    end
    when 'exit'
      puts "Goodbye for now!"
    end
    replay
  end

  def replay
    puts "Do you want to play again? (y/n)"
    user_input = gets.chomp
    case user_input
    when 'y'
      play_game
    when 'n'
      puts "Goodbye"
    end
  end


end
