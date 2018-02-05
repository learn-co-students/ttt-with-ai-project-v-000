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
    [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def turn_count
    count = 0
    @board.cells.each do |index|
      if index != "" && index != " " && index != nil
        count +=1
      end
    end
    return count
  end

  def current_player
    if turn_count % 2 == 0
      return @player_1
    else return @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
       @board.cells[combo[0]] == @board.cells[combo[1]] &&
       @board.cells[combo[1]] == @board.cells[combo[2]] &&
       @board.taken?(combo[0]+1)
     end
  end

  def full?
    !@board.cells.any?{|element| element == nil || element == "" || element == " "}
  end

  def over?
    won? || full?
  end

  def draw?
    full? && !won?
  end

  def winner
    # if !over? || draw?
    #   return nil
    # elsif
    if combo = won?
      @board.cells[combo.first]
    end
  end

  def turn
    @board.display
    index = current_player.move(@board)
    if !@board.valid_move?(index)
      turn
    else
      @board.update(index,current_player)
      @board.display
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

  def self.start(input)
    if input == "0"
      new_game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
      new_game.play
    elsif input == "1"
      puts "Who would you like to go first? Enter A for human player, B for computer player."
      input_2 = gets.strip
      if input_2 == "A"
        new_game = Game.new(Players::Human.new("X"), Players::Computer.new("O"),Board.new)
        new_game.play
      elsif input_2 == "B"
        new_game = Game.new(Players::Computer.new("X"), Players::Human.new("O"),Board.new)
        new_game.play
      else
        puts "Input not valid."
      end
    elsif input == "2"
      new_game = Game.new
      new_game.play
    else
      puts "Input not valid."
    end

    if new_game.over?
       puts "Would you like to play again? Y/N"
       input_3 = gets.strip
       if input_3 == "Y"
         new_game = Game.new
         new_game.play
       end
     end
  end


end
