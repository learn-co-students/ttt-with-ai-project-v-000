class Board
  attr_accessor :cells

  def initialize
    binding.pry
    reset!
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def reset!
    binding.pry
    self.cells = [" "," "," "," "," "," "," "," "," "]
  end

  def position(user_input)
    self.cells[user_input.to_i - 1]
  end

  def full?
      self.cells.all?{|token| token == "X" || token == "O" }
  end

  def turn_count
    self.cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(index)
    self.cells[index.to_i-1] == "X" || self.cells[index.to_i-1] == "O"
  end

  def valid_move?(index)
    index.to_i.between?(1,9) && !taken?(index)
  end

  def turn
    binding.pry
    input = self.current_player.move(board)
    while(!self.board.valid_move?(input))
      puts "Invalid move, please pick again"
      input = self.current_player.move(board)
    end
    self.board.update(input, self.current_player)
  end

  def play
    binding.pry
    while(!self.board.full?)
      binding.pry
      turn
    end
      #binding.pry
    if(won?)
      puts "Congratulations #{winner}"
    elsif (draw?)
      puts "Cat's Game!"
    end
  end

end
