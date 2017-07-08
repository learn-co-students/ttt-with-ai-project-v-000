class Game

  attr_accessor :board, :player_1, :player_2

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

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    self.board = board
    self.player_1 = player_1
    self.player_2 = player_2
  end

  def current_player
    board.turn_count.odd? ? player_2 : player_1
  end


  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      board.cells[combination[0]] == board.cells[combination[1]] &&
      board.cells[combination[1]] == board.cells[combination[2]] &&
      (board.cells[combination[0]] == "X" || board.cells[combination[0]] == "O")
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    if won?
      winning_player = won?[0]
      board.cells[winning_player]
    else

      nil
    end

  end

  def turn
    puts "Please enter a number from 1-9"
    move = current_player.move(self.board)
    if self.board.valid_move?(move)
      self.board.update(move, current_player)
    else
      turn
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def start
    puts "How many human players will be joining us?"
    human_players = gets.chomp

    case human_players.to_i
    when 0
      game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
    when 1
      puts "Who should go first and be \"X\"?"
      input = gets.chomp
      set_player_with_computer(input)

    when 2
      puts "Who should go first and be \"X\"?"
      input = gets.chomp

      set_players_just_humans(input)

    end

  end

  def set_player_with_computer(input)
    puts "enter 'computer' or 'me'."
    if input == 'computer'
      game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
    elsif input == 'me'
      game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
    else
      puts "invalid input. Please enter 'computer' or 'me'."
      input = gets.chomp
      set_player_with_computer(input)
    end
  end

  def set_players_just_humans(input)
    puts "enter 'player 1' or 'player 2'."
    if input == 'player 1'
      game = Game.new(Players::Human.new("X"), Players::Human.new("O"))
    elsif input == 'player 2'
      game = Game.new(Players::Human.new("O"), Players::Human.new("X"))
    else
      puts "invalid input. Please enter 'player 1' or 'player 2'."
      input = gets.chomp
      set_players_just_humans(input)
    end
  end

end
