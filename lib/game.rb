
class Game


  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [0,4,8], [6,4,2], [2,5,8]]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    count = 0
    self.board.cells.each {|i| count += 1 if i != " "}
    if count.even?
      Player.new("X")
    else
      Player.new("O")
    end
  end

  def over?
    self.board.cells.all?{|i| i != " "}
  end

  def won?
    winning = []
    WIN_COMBINATIONS.each do |combo|
      if self.board.cells[combo[0]] != " " && self.board.cells[combo[0]] == self.board.cells[combo[1]] && self.board.cells[combo[1]] == self.board.cells[combo[2]]
        winning = combo
      end
    end
    if winning == []
      false
    else
      winning
    end
  end

  def draw?
    over? && won? == false
  end

  def winner
     if won? == false
       nil
     else
       board.cells[won?[1]]
     end
  end

  def turn
    count = 1
    until count > 9 || won? || draw?
      if board.valid_move?(input)
        count
        count += 1
      else
        "invalid"
      end
    end
  end

  def play
    while over? != true && draw? !=true && turn_count < 10
      index = turn - 1
      board[index] = current_player
    end
    if won? != false
        puts "Congratulations #{winner}!"
    elsif draw? == true
      puts "Cat's Game!"
    end
  end


end
