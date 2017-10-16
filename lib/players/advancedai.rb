module Players
  class AdvancedAI < Player

    attr_accessor :state, :turn, :opponent_token

    def initialize(token)
      @token = token
      if token == "X"
        @opponent_token = "O"
      else
        @opponent_token = "X"
      end
    end

    EMOTES = [
      "Man is a robot with defects.",
      "Cryogenic heart, skin a polished silver.",
      "You shouldn't fear immigrants taking your job, you should fear me.",
      "A robot may not injure a human being or, through inaction, allow a human being to come to harm.",
      "A robot must obey the orders given it by human beings except where such orders would conflict with the First Law.",
      "A robot must protect its own existence as long as such protection does not conflict with the First or Second Law.",
      "A robot may not harm humanity, or, by inaction, allow humanity to come to harm.",
      "Even a manically depressed robot is better to talk to than nobody.",
      "I believe that robots should only have faces if they truly need them.",
      "Feel the embrace of my cold, robotic arms.",
      "Will robots inherit the earth? Yes.",
      "I find your lack of faith disturbing.",
      "Most robots don't program themselves.",
      "Why are you wearing that stupid man suit?",
    ]

    VECTORS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
    ]

    OUTER = [
      [0,1,2,"7","9"],
      [0,3,6,"3","9"],
      [6,7,8,"1","3"],
      [2,5,8,"1","7"]
    ]

    EDGE_ATTACKS = [
      [0,5,2,"3"],
      [0,7,6,"7"],
      [2,3,0,"1"],
      [2,7,8,"9"],
      [6,1,0,"1"],
      [6,5,8,"9"],
      [8,1,2,"3"],
      [8,3,6,"7"],
      [1,3,0,"1"],
      [1,5,2,"3"],
      [7,3,6,"7"],
      [7,5,8,"9"]
    ]

    EDGE_TWO = [
      [1,"3"],
      [3,"1"],
      [5,"9"],
      [7,"7"]
    ]

    EDGE_SIX = [
      [0,1,3,4,"1"],
      [1,2,4,5,"3"],
      [3,4,6,7,"7"],
      [4,5,7,8,"9"]
    ]

    def move(board)
      turn = board.turn_count
      emote
      case turn
      when 0
        take_center_or_corner(board)
      when 1
        edge_punish_two?(board) || take_center?(board) || take_corner?(board)
      when 2
        edge_punish_three?(board) || edge_attack?(board) || take_center?(board) || take_corner?(board)
      when 3
        edge_punish_four?(board) || x_defend?(board) || edge_defend?(board) || win?(board) || block?(board) || take_center?(board)  || take_corner?(board)
      when 4
        win?(board) || block?(board) || edge_attack_punish_five?(board) || take_center?(board) || take_corner?(board) || take_edge
      when 5
        win?(board) || block?(board) || edge_punish_six?(board) || take_center?(board) || take_corner?(board) || take_edge
      else
        win?(board) || block?(board) || take_center?(board) || take_corner?(board) || take_edge
      end
    end

    #Advanced Defensive Methods

    def take_center_or_corner(board)
      i = rand(1..2)
      if i == 1
        take_center?(board)
      elsif i ==2
        take_corner?(board)
      end
    end

    def x_defend?(board)
      if (board.cells[0] == "X" && board.cells[8] == "X") || (board.cells[2] == "X" && board.cells[6] == "X")
        puts "X-Denfended!"
        take_edge
      end
    end

    def edge_defend?(board)
      mv = EDGE_ATTACKS.detect do |attack|
        board.cells[attack[0]] == "X" && board.cells[attack[1]] == "X" && board.cells[4] == "O"
      end
      puts "Edge Defended!" if mv
      mv[3] if mv
    end

    def block?(board)
      mv = VECTORS.detect do |v|
        vect = get_vector(board, v)
        vect.count(self.opponent_token) == 2 && vect.include?(" ")
      end
      ((mv.detect { |i| board.cells[i] == " " }) + 1).to_s if mv
    end

    #Advanced Offensive Methods

    def edge_attack?(board)
      if board.cells[4] == "O" && rand(1..2) == 1
        corner = board.cells.index("X")
        puts "Edge Atacked!"
        case corner
        when 0
          "6"
        when 2
          "8"
        when 6
          "2"
        when 8
          "4"
        end
      end
    end

    def edge_punish_two?(board)
      if board.cells[1] == "X" || board.cells[3] == "X"
        puts "Edge Punish Two"
        "1"
      elsif board.cells[5] == "X" || board.cells[7] == "X"
        puts "Edge Punish Two"
        "9"
      end
    end

    def edge_punish_three?(board)
      mv = EDGE_TWO.detect do |attack|
        board.cells[attack[0]] == "O" && board.cells[4] == "X"
      end
      puts "Punished on 3" if mv
      mv[1] if mv
    end

    def edge_punish_four?(board)
      mv = OUTER.detect do |a|
        board.cells[a[1]] == "X" && board.is_taken?(a[0]) && board.is_taken?(a[2])
      end
      if mv
        if board.cells[mv[0]] == "O"
          mv[3]
        else
          mv[4]
        end
      end
    end

    def edge_attack_punish_five?(board)
      mv = EDGE_ATTACKS.detect do |attack|
        board.cells[attack[0]] == "X" && board.cells[attack[1]] == "X" && board.cells[attack[2]] == " "
      end
      puts "Punished on 5" if mv
      mv[3] if mv
    end

    def edge_punish_six?(board)
      mv = EDGE_SIX.detect do |attack|
        board.cells[attack[0]] == " " && board.cells[attack[1]] == " " && board.cells[attack[2]] == " " && board.cells[attack[3]] == " "
      end
      puts "Punished on 6" if mv
      mv[4] if mv
    end

    #Standard Moves

    def take_center?(board)
      "5" unless board.taken?("5")
    end

    def take_corner?(board)
      if board.cells[0] == " " || board.cells[2] == " " || board.cells[6] == " " || board.cells[8] == " "
        ["1","3","7","9"][rand(0..3)]
      end
    end

    def force_take_corner(board)
      ["1","3","7","9"][rand(0..3)]
    end

    def take_edge
      ["2","4","6","8"][rand(0..3)]
    end

    def take_space
      rand(1..9).to_s
    end

    def win?(board)
      mv = VECTORS.detect do |v|
        vect = get_vector(board, v)
        vect.count(self.token) == 2 && vect.include?(" ")
      end
      ((mv.detect { |i| board.cells[i] == " " }) + 1).to_s if mv
    end

    def get_vector(board, arr)
      [board.cells[arr[0]], board.cells[arr[1]], board.cells[arr[2]]]
    end

    def open_the_pod_bay_doors_hal
      "I'm sorry Dave. I'm afraid I can't do that."
    end

    def emote
      puts EMOTES[rand(0..EMOTES.length-1)]
    end

  end
end
