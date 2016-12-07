class Game
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6], # left column
    [1,4,7], # middle column
    [2,5,8], # right column
    [0,4,8],
    [2,4,6]
  ]

  attr_accessor :board, :player_1, :player_2, :win_player

  def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    if ((@board.full? != false) || self.won? || self.draw?) then
      return true
    else
      return false
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      # puts "win_combination is #{win_combination}"
      win_check = [@board.cells[win_combination[0]], @board.cells[win_combination[1]], @board.cells[win_combination[2]]]
      # puts "win_check is #{win_check}"
      if win_check.all? {|player| player == 'O'} then
          # puts "evaluated true; winner O"
          @win_player = "O"
          #return win_combination
          return true
      elsif win_check.all? {|player| player == 'X'} then
          # puts "evaluated true; winner X"
          @win_player = "X"
          #return win_combination
          return true
      else
          # puts "evaluated false"
      end
    end
    return false
  end

  def draw?
    if ((!self.won?) && (@board.full?)) then
      return true
    else
      return false
    end
  end

  def winner
    self.won?
    return @win_player
  end

  def start
    self.play
    if self.won? then
      return @win_player
    else
      return "draw"
    end
  end

  def turn
    #display_board(board)
    @board.display
    player = current_player
    input_validation = false
    #puts "Player #{player.token}, please enter your move:"
    #input = gets.to_i
    #index = input_to_index(input)

    while input_validation == false do
      input = player.move(@board).to_i
      input_validation = @board.valid_move?(input)
      input_validation ? @board.update(input, player) : (puts "invalid")
    end

    return input

    # input = player.move(@board).to_i
    # if @board.valid_move?(input) then
    #   input = input.to_i
    #   @board.update(input, player)
    #   return input
    # else
    #   puts "invalid"
    # end

  end

  def play
    game_over = false
    self.over? ? game_over = true : game_over = false
    while game_over == false do
      self.turn
      self.over? ? game_over = true : nil
    end
    if game_over then
      self.won? ? (puts "Congratulations #{win_player}!") : nil #works in irb
      self.draw? ? (puts "Cats Game!") : nil #works in irb
      @board.display
    end
  end

end
