class Game

  attr_accessor :board, :player_1, :player_2, :token

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

  def current_player
    token_count = board.cells.count {|space| space != " "}
    token_count.odd? ? @player_2 : @player_1
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_combination.all? {|space| board.cells[space] == player_1.token} || win_combination.all? { |space| board.cells[space] == player_2.token}
    end
  end

  def draw?
    if !won? && @board.cells.none? {|cell| cell == " "}
      true
    end
  end

  def winner
    if won?
      board.cells[won?[0]]
    else
      nil
    end
  end
    # if WIN_COMBINATIONS.detect {|win_combination| win_combination.all? {|space| board.cells[space] == player_1.token}}
    #   player_1.token
    # elsif WIN_COMBINATIONS.detect {|win_combination| win_combination.all? {|space| board.cells[space] == player_2.token}}
    #   player_2.token
    # end

  def turn
    puts "what space do you want to go in?"
    index = current_player.move(board)
    if board.valid_move?(index)
      board.update(index, current_player)
    else
      puts "not a valid move, try again"
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_combination.all? {|space| board.cells[space] == player_1.token} ||
      win_combination.all? {|space| board.cells[space] == player_2.token}
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

  def self.start
    puts "what kind of game do you want to play?"
    input = gets.strip
      if "0"
        game = Game.new( mmn bvcxzZhplayer_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
        game.play
      end
    end


end
