require 'pry'

class Computer < Player

  def move(board)
    my_move = nil

    o_tok = "X"
    if @token == "X"
      o_tok = "O"
    end

    my_move = check_match_point(board, o_tok)

    if board.valid_move?("5")
      puts "Computer player played on space 5."
      return "5"
    elsif board.valid_move?("1")
      puts "Computer player played on space 1."
      return "1"
    end

    if my_move == nil
      my_move = create_match_point(board, o_tok)
    end

    if my_move == nil
      my_move = default_move(board)
    end

    puts "Computer player played on space #{my_move}."
    my_move

  end

  def check_match_point(board, o_tok)
    check_these = Array.new
    Game::WIN_COMBINATIONS.each{|a| check_these << a}
   
    check_these = check_these.delete_if{|a|
      board.cells[a[0]] == @token || board.cells[a[1]] == @token || board.cells[a[2]] == @token
    }

    check_these = check_these.delete_if{|a|
      !((board.cells[a[0]] == o_tok && board.cells[a[1]] == o_tok) || (board.cells[a[0]] == o_tok && board.cells[a[2]] == o_tok) || (board.cells[a[1]] == o_tok  && board.cells[a[2]] == o_tok))
    }

    if check_these.size > 0
      spot = check_these[0].select{|a| board.cells[a] != o_tok}
      spot = spot[0] + 1
      return spot
    else
      nil
    end
  end

  def create_match_point(board, o_tok)
    analysis = Array.new
    go_here = Array.new
    Game::WIN_COMBINATIONS.each{|a| go_here << a}

    go_here.delete_if{|a|
      board.cells[a[0]] != @token && board.cells[a[1]] != @token && board.cells[a[2]] != @token
    }
    go_here.delete_if{|a|
      board.cells[a[0]] == o_tok || board.cells[a[1]] == o_tok || board.cells[a[2]] == o_tok
    }
    if go_here.size > 0
      go_here.each{|a| analysis << a.count{|b| board.cells[b] == @token}}
      go_here = go_here[analysis.index(analysis.max)]
      spot = go_here.select{|a| board.cells[a] == " "}
      spot = spot[0] + 1
      return spot
    else
      nil
    end
  end

  def default_move(board)
  possible_moves = ["1","2","3","4","5","6","7","8","9"]
  spot = possible_moves.detect{|a| board.valid_move?(a) == true}
  spot
  end
end







