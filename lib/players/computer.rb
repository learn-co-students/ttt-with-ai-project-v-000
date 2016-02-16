class Computer < Player
  include TTTGame::InstanceMethods
  attr_accessor :computer_move, :computer_skill_move, :x_arr, :o_arr, 
  :x_num, :o_num, :open_arr, :open_num, :my_pieces, :opp_pieces, 
  :my_num, :opp_num, :i_am_player


  def move(board)
    puts "COMPUTER MOVE!"
    comp_move = 1 +rand(9)
    @computer_move = comp_move.to_s
  end

  def determine_scenario(board)
    @x_arr = board.all_X
    @x_num = x_arr.length
    @o_arr = board.all_O
    @o_num = o_arr.length
    @open_arr = board.all_open
    @open_num = open_arr.length
    if self.token == "X"
      @my_pieces = x_arr
      @my_num = x_num
      @opp_pieces = o_arr
      @opp_num = o_num
    elsif self.token == "O"
      @my_pieces = o_arr
      @my_num = o_num
      @opp_pieces = x_arr
      @opp_num = x_num
    end
    if my_num == opp_num
      @i_am_player = 1
    elsif my_num < opp_num
      @i_am_player = 2
    end
  end


  def analyze_move(board)
    determine_scenario(board)
    corners = [0,2,6,8]
    mids = [1,3,5,7]
    center = [4]
    if i_am_player == 1
    case open_num
      when 9
        @computer_skill_move = 1
      when 7
        case opp_pieces[0]
        when 1
          @computer_skill_move = 7
        when 2
          @computer_skill_move = 9
        when 3
          @computer_skill_move = 3
        when 4
          @computer_skill_move = 1 +rand(9)
        when 5
          @computer_skill_move = 3
        when 6
          @computer_skill_move = 9
        when 7
          @computer_skill_move = 7
        when 8
          @computer_skill_move = 2
        end
      when 5, 3
      @computer_skill_move = 1 +rand(9)
      when 1
      @computer_skill_move = open_arr[0]+1
      else
      return
    end

    elsif i_am_player == 2
      case open_num
      when 8
        if corners.include?(opp_pieces[0])
          @computer_skill_move = 5
        elsif opp_pieces[0] == 1 || opp_pieces[0] == 3
          @computer_skill_move = 1
        elsif opp_pieces[0] == 5 || opp_pieces[0] == 7
          @computer_skill_move = 9
        else
          @computer_skill_move = 3
        end
      when 6
        if my_pieces.include?(4)
          if opp_pieces.include?(7)
            @computer_skill_move = 4
          else
          @computer_skill_move = 2
        end
        elsif my_pieces.include?(0) || my_pieces.include?(8)
          @computer_skill_move = 5
        elsif my_pieces.include?(2) && opp_pieces.include?(6)
          @computer_skill_move = 1
        end
      when 4
        if my_pieces.include?(3) && my_pieces.include?(4) && opp_pieces.include?(5) && opp_pieces.include?(7)
          @computer_skill_move = 3
        elsif my_pieces.include?(3) && my_pieces.include?(4) && opp_pieces.include?(5) && opp_pieces.include?(6)
          @computer_skill_move = 2
        elsif my_pieces.include?(1) && my_pieces.include?(4) && opp_pieces.include?(5) && opp_pieces.include?(7)
          @computer_skill_move = 7
        else
          @computer_skill_move = 1 +rand(9)
        end
        when 2
        @computer_skill_move = 1 +rand(9)
      else
        return
      end
    end
    check_for_block
    check_for_win
    computer_skill_move
  end


  def computer_master_move(board)
    analyze_move(board)
    puts "I am #{self.token}"
    puts "MASTER COMPUTER MOVE TO #{computer_skill_move.to_s}"
    computer_skill_move.to_s
  end

  def check_for_block
    case 
    when ([0,1] - opp_pieces).empty? && open_arr.include?(2)
      @computer_skill_move = 3
    when ([0,4] - opp_pieces).empty? && open_arr.include?(8)
      @computer_skill_move = 9
    when ([0,3] - opp_pieces).empty? && open_arr.include?(6)
      @computer_skill_move = 7
    when ([0,2] - opp_pieces).empty? && open_arr.include?(1)
      @computer_skill_move = 2
    when ([0,8] - opp_pieces).empty? && open_arr.include?(4)
      @computer_skill_move = 5
    when ([0,6] - opp_pieces).empty? && open_arr.include?(3)
      @computer_skill_move = 4
    when ([1,2] - opp_pieces).empty? && open_arr.include?(0)
      @computer_skill_move = 1
    when ([1,4] - opp_pieces).empty? && open_arr.include?(7)
      @computer_skill_move = 8
    when ([2,4] - opp_pieces).empty? && open_arr.include?(6)
      @computer_skill_move = 7
    when ([2,5] - opp_pieces).empty? && open_arr.include?(8)
      @computer_skill_move = 9
    when ([2,6] - opp_pieces).empty? && open_arr.include?(4)
      @computer_skill_move = 5
    when ([2,8] - opp_pieces).empty? && open_arr.include?(5)
      @computer_skill_move = 6
    when ([3,4] - opp_pieces).empty? && open_arr.include?(5)
      @computer_skill_move = 6
    when ([3,5] - opp_pieces).empty? && open_arr.include?(4)
      @computer_skill_move = 5
    when ([3,6] - opp_pieces).empty? && open_arr.include?(0)
      @computer_skill_move = 1
    when ([4,5] - opp_pieces).empty? && open_arr.include?(3)
      @computer_skill_move = 4
    when ([4,6] - opp_pieces).empty? && open_arr.include?(2)
      @computer_skill_move = 3
    when ([4,7] - opp_pieces).empty? && open_arr.include?(1)
      @computer_skill_move = 2
    when ([4,8] - opp_pieces).empty? && open_arr.include?(0)
      @computer_skill_move = 1
    when ([5,8] - opp_pieces).empty? && open_arr.include?(2)
      @computer_skill_move = 3
    when ([6,7] - opp_pieces).empty? && open_arr.include?(8)
      @computer_skill_move = 9
    when ([7,8] -opp_pieces).empty? && open_arr.include?(6)
      @computer_skill_move = 7
    end
  end


  def check_for_win
    case 
    when ([0,1] - my_pieces).empty? && open_arr.include?(2)
      @computer_skill_move = 3
    when ([0,4] - my_pieces).empty? && open_arr.include?(8)
      @computer_skill_move = 9
    when ([0,3] - my_pieces).empty? && open_arr.include?(6)
      @computer_skill_move = 7
    when ([0,2] - my_pieces).empty? && open_arr.include?(1)
      @computer_skill_move = 2
    when ([0,8] - my_pieces).empty? && open_arr.include?(4)
      @computer_skill_move = 5
    when ([0,6] - my_pieces).empty? && open_arr.include?(3)
      @computer_skill_move = 4
    when ([1,2] - my_pieces).empty? && open_arr.include?(0)
      @computer_skill_move = 1
    when ([1,4] - my_pieces).empty? && open_arr.include?(7)
      @computer_skill_move = 8
    when ([2,4] - my_pieces).empty? && open_arr.include?(6)
      @computer_skill_move = 7
    when ([2,5] - my_pieces).empty? && open_arr.include?(8)
      @computer_skill_move = 9
    when ([2,6] - my_pieces).empty? && open_arr.include?(4)
      @computer_skill_move = 5
    when ([2,8] - my_pieces).empty? && open_arr.include?(5)
      @computer_skill_move = 6
    when ([3,4] - my_pieces).empty? && open_arr.include?(5)
      @computer_skill_move = 6
    when ([3,5] - my_pieces).empty? && open_arr.include?(4)
      @computer_skill_move = 5
    when ([3,6] - my_pieces).empty? && open_arr.include?(0)
      @computer_skill_move = 1
    when ([4,5] - my_pieces).empty? && open_arr.include?(3)
      @computer_skill_move = 4
    when ([4,6] - my_pieces).empty? && open_arr.include?(2)
      @computer_skill_move = 3
    when ([4,7] - my_pieces).empty? && open_arr.include?(1)
      @computer_skill_move = 2
    when ([4,8] - my_pieces).empty? && open_arr.include?(0)
      @computer_skill_move = 1
    when ([5,8] - my_pieces).empty? && open_arr.include?(2)
      @computer_skill_move = 3
    when ([6,7] - my_pieces).empty? && open_arr.include?(8)
      @computer_skill_move = 9
    when ([7,8] -my_pieces).empty? && open_arr.include?(6)
      @computer_skill_move = 7
    end
  end

end