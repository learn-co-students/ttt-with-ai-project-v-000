class Game
  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def self.one_player1(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
    Game.new(player_1, player_2, board)
  end

  def self.one_player2(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    Game.new(player_1, player_2, board)
  end

  def self.wargames(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
    Game.new(player_1, player_2, board)
  end

  def self.game_choice(input = nil)
    puts "Please select wargames, 1, or 2"
    input = gets.chop
    if input == "wargames"
      counter = 0
      computer1 = 0
      computer2 = 0
      draws = 0
      until counter == 101 do
        new_game = self.wargames
        new_game.play
        puts "After #{counter} game(s) played: Computer 1 = #{computer1} - Computer 2 = #{computer2} - Cat's Game(s) = (#{counter})"
        counter += 1
        end
        self.ask
    elsif input == "1"
      puts "Would you like to go first or second?"
      input2 = gets.chop
      if input2 == "first"
        new_game = self.one_player1
        new_game.play
        self.ask
      elsif input2 == "second"
        new_game = self.one_player2
        new_game.play
        self.ask
      else
        puts "I'm sorry, I couldn't hear you. Please type either first or second."
        puts "Just kidding, you have to start over because you didn't listen. :p"
        self.game_choice(1)
        self.ask
      end
    elsif input == "2"
      puts "Enjoy! May the best player win!"
      new_game = self.new
      new_game.play
      self.ask
    else
      puts "No, no, no, you're lost again."
      self.game_choice
    end
  end

  def self.ask
    puts "Would You like to play again (Y/N)?"
    input = gets.chop
    if input.match(/[yY]/)
      self.game_choice
    elsif input.match(/[nN]/)
      exit
    else
      puts "Okie dokie then. I'll just act like you didn't say that and start over."
      self.ask
    end
  end


  def current_player
    self.board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      self.board.cells[win_combination[0]] == self.board.cells[win_combination[1]] && self.board.cells[win_combination[1]] == self.board.cells[win_combination[2]] && self.board.taken?(win_combination[0] + 1)
    end
  end

  def draw?
    !won? && self.board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      self.board.cells[won?[0]]
    end
  end

  def turn
    puts "Please enter 1-9:"
    player = current_player
    current_move = player.move(self.board)
    if !self.board.valid_move?(current_move)
      turn
    else
      self.board.update(current_move, player)
    end
    self.board.display
  end


  def play
   turn until over?
   if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end
end
