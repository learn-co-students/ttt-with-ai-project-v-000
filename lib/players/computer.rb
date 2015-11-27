class Computer < Player

  attr_accessor :offense, :defense, :local_win, :totally_not_local_win
  attr_reader :board, :cells

  def initialize(token)
    super
    # @offense = Game::WIN_COMBINATIONS
    # @defense = Game::WIN_COMBINATIONS

    # ///this was causing me to change value of WIN_COMB
    # have run into this issue a few times, suspect relates to
    # variable reference value issues, but not sure of best practice

    @local_win = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    @totally_not_local_win = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    @offense = @local_win
    @defense = @totally_not_local_win #same issue as above
  end

  def update_board(board)
    @board = board
    @cells = board.cells
    @local_win = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    @totally_not_local_win = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    @offense = @local_win
    @defense = @totally_not_local_win
  end

  def move(board)
    update_board(board)
    my_move = make_decision
    my_move
  end

  def make_decision
    my_move = nil
    my_move = create_match_point
    # better way to write these checks?
    if my_move == nil
      my_move = early_priority_move
    end
    if my_move == nil
      my_move = check_match_point
    end
    if my_move == nil
      my_move = default_move
    end
    puts "Computer player played on space #{my_move}."
    my_move
  end

  def check_match_point
    update_defense
    if @defense.size > 0
      spot = @defense[0].select{|a| @cells[a] != @o_tok}
      spot = spot[0] + 1
      spot
    end
  end

  def update_defense
    @defense = @defense.delete_if{|a|
      @cells[a[0]] == @token || 
      @cells[a[1]] == @token || 
      @cells[a[2]] == @token
    }

    @defense.select!{|a|
      ((@cells[a[0]] == @o_tok && @cells[a[1]] == @o_tok) || 
      (@cells[a[0]] == @o_tok && @cells[a[2]] == @o_tok) || 
      (@cells[a[1]] == @o_tok  && @cells[a[2]] == @o_tok))
    }
  end

  def create_match_point
    update_offense
    if @offense.size > 0
      @offense = @offense[0].select!{|a| @board.valid_move?(a) == true}
      @offense[0] + 1
    end
  end

  def update_offense
    @offense.delete_if{|a|
      @cells[a[0]] == @o_tok || 
      @cells[a[1]] == @o_tok || 
      @cells[a[2]] == @o_tok
    }
    @offense.select!{|a|
      @cells[a[0]] == @token && @cells[a[1]] == @token ||
      @cells[a[0]] == @token && @cells[a[2]] == @token ||
      @cells[a[1]] == @token && @cells[a[2]] == @token
    }
  end

  def early_priority_move
    if @token == "X"
      basic_priority_move
    else
      player2_strat
    end
  end

  def basic_priority_move
    #add checker to do either 1 or 9 based on opp play
    if @board.valid_move?("5")
      "5"
    elsif @board.valid_move?("1")
      "1"
    end
  end

  def player2_strat
    if @board.turn_count < 3
      p1_went = @cells.index("X") + 1
      case p1_went
      when 1
        9
      when 9
        1
      when 3
        7
      when 7 
        3
      when 2
        1
      when 4
        1
      when 6
        9
      when 8
        9
      else 
        1
      end
    end
  end

  # above and below very hardcoded, 
  # but simpler than logic only because of small scope of game possibilities
  def default_move
    possible_moves = ["5","1","3","7","9","2","4","6","8"]
    spot = possible_moves.detect{|a| @board.valid_move?(a) == true}
    spot
  end
end







