class Game

  attr_accessor :board, :player_1, :player_2, :input, :winner

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    board.display
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
     board.turn_count.even? ? player_1 : player_2
  end

  def won?
    value = false
    WIN_COMBINATIONS.each do |combo|
        if (@board.cells[combo[0]] == @board.cells[combo[1]] &&
          @board.cells[combo[1]] == @board.cells[combo[2]] &&
          @board.taken?(combo[0]+1))
          value = combo
        end
      end
      value
   end

  def draw?
    @board.full? && !won? ? true : false
  end

  def over?
     (won? || draw?) ? true : false
  end

  def winner
    if won?
      combo = won?
      @board.cells[combo[0]]
    end
  end


  def turn
    puts "Please enter a number 1-9:"
      @input = current_player.move(@board)
   if @board.valid_move?(@input)
     @board.update(@input, current_player)
   else puts "Please enter a number 1-9:"
     @board.display
     turn
   end
   @board.display
  end

  def play
   turn until over?
   if won?
     puts "Congratulations #{winner}!"
   elsif draw?
     puts "Cat's Game!"
   end
 end

 def start

   def game_start
     new_game = Game.new_game
     puts "\nWelcome to Tic Tac Toe!"
     puts "\nWhat type of game would you like to play, 0 - 1 - or 2 player?"
     puts "\nEnter '0', '1', or '2' : "
     game_type = gets.strip

     case game_type
     when 1 then (
       puts "\nWould you like to be 'X' and take the first turn?"
       puts "\nEnter 'y' or 'n' : "
       if gets.strip == "y"
         Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new).play
       else   Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new).play
       end)

     when 0 then
       Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play

     when 2 then
       Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new).play
     end

     puts "Play again? Enter 'y' or 'n': "
     play_again = gets.strip

   end

   game_start until play_again == "n"
end


end
