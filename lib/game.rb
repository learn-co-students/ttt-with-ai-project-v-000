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

  def initialize( player_1 = Player::Human.new("X") , player_2 = Player::Human.new("O"), board = Board.new)#,   player_2 = Player::Computer.new("O")
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? @player_1 : @player_2
  end

  def draw?
    !won? && board.full?
  end

  def over?
    draw? || won?
  end

  def won?
      WIN_COMBINATIONS.detect do |combination|
       board.taken?(combination[0]+1) && board.cells[combination[0]] == board.cells[combination[1]] && board.cells[combination[2]] == board.cells[combination[1]]
      end
  end



  def winner
    won? ? board.cells[won?.first] : nil
  end

  def turn
    player = current_player
    player.class == Player::Human ? (puts "Your move") : (puts "Player #{player.token}'s move")

    current_move = player.move(board)
    


    !board.valid_move?(current_move) ? turn : board.update(current_move,player)
    puts "moved to position #{current_move}"

    board.display
  end

   def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end



      # expect(Game::WIN_COMBINATIONS).to include_array([0,1,2])
      # expect(Game::WIN_COMBINATIONS).to include_array([3,4,5])
      # expect(Game::WIN_COMBINATIONS).to include_array([6,7,8])
      # expect(Game::WIN_COMBINATIONS).to include_array([0,3,6])
      # expect(Game::WIN_COMBINATIONS).to include_array([1,4,7])
      # expect(Game::WIN_COMBINATIONS).to include_array([2,5,8])
      # expect(Game::WIN_COMBINATIONS).to include_array([0,4,8])
      # expect(Game::WIN_COMBINATIONS).to include_array([6,4,2])