class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #Top Row
    [3,4,5], #Middle Row
    [6,7,8], #Bottom Row
    [0,3,6], #Left Column
    [1,4,7], #Middle Column
    [2,5,8], #Right Column
    [0,4,8], #Diagonal from top right
    [6,4,2] #Diagonal from top left
    ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, current_player = "X")
    @board[position.to_i-1] = current_player
  end

  def position_taken?(position)
    @board[position] != " " && @board[position] != ""
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn_count
    @board.count {|token| token == "X" || token == "O"}
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "#{current_player}, please enter a valid move for positions 1-9:"
    position = gets.strip
    if valid_move?(position)
      move(position, current_player)
    else
      puts "Invalid move."
      turn
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.detect do |win_comb|
      if (win_comb.any? {|position| position_taken?(position)}) && (@board[win_comb[0]] == @board[win_comb[1]] && @board[win_comb[0]] == @board[win_comb[2]])
        win_comb
      end
    end
  end

  def full?
    @board.none? do |position|
      position == " "
    end
  end

  def draw?
    full? && !(won?)
  end

  def over?
    full? || won? || draw?
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
      puts "You've won the game!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end
