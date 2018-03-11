class Game

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
]

 attr_accessor :player_1, :board, :player_2

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    self.board.turn_count % 2 == 0 ? self.player_1 : self.player_2
  end

  def won?
    win = nil
    WIN_COMBINATIONS.each do |combo|
      combos = []
      combo.each do |space|
        combos << board.cells[space]
      if combos == ["X","X","X"] || combos == ["O","O","O"]
        win = combo
      end
    end
  end
    win
  end

  def draw?
    @board.full? && self.won? == nil ? true : false
  end

  def over?
    self.won? || self.draw?
  end

  def winner
    self.won? ? @board.cells[won?[0]] : nil
  end

  def turn
    player = self.current_player
    input = player.send :gets
  until @board.valid_move?(input)
    input = player.send :gets
  end
    @board.update(input, player)
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

 def start
   puts "Welcome to Tic-tac-toe."
   puts "How many players would you like?"
   input = gets.strip

   if input == "2"
     Game.new.play
   elsif input == "1"
     puts "Do you want to be X or O?"
     input2 = gets.strip
     if input2 == "X"
       Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new).play
     elsif
       Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new).play

   else input == "0"
     Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play
   end
     count = 0
     win_count = 0
     loss_count = 0
       game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play
       if game
       win_count += 1
       else
         loss_count += 1
       end
     count += 1
     puts win_count
     puts loss_count
     end


    puts "Play again? (Y/N)"
    input3 = gets.strip

   if input3 == "Y"
     Game.new.start
   else input3 == "N"
     puts "Thanks for playing!"
   end
 end
 end
