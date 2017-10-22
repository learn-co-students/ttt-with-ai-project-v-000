module Players
  class Computer < Player

    def move(board)
      if board.taken?('1') && board.taken?('2') && board.position('2') == board.position('1') && !board.taken?('3')
        pos = '3'
      elsif board.taken?('1') && board.taken?('3') && board.position('3') == board.position('1') && !board.taken?('2')
        pos = '2'
      elsif board.taken?('2') && board.taken?('3') && board.position('3') == board.position('2') && !board.taken?('1')
        pos = '1'
      elsif board.taken?('1') && board.taken?('5') && board.position('5') == board.position('1') && !board.taken?('9')
        pos = '9'
      elsif board.taken?('1') && board.taken?('9') && board.position('9') == board.position('1') && !board.taken?('5')
        pos = '5'
      elsif board.taken?('5') && board.taken?('9') && board.position('9') == board.position('5') && !board.taken?('1')
        pos = '1'
      elsif board.taken?('1') && board.taken?('4') && board.position('4') == board.position('1') && !board.taken?('6')
        pos = '6'
      elsif board.taken?('1') && board.taken?('7') && board.position('7') == board.position('1') && !board.taken?('4')
        pos = '4'
      elsif board.taken?('4') && board.taken?('7') && board.position('7') == board.position('4') && !board.taken?('1')
        pos = '1'
      elsif board.taken?('3') && board.taken?('7') && board.position('7') == board.position('3') && !board.taken?('5')
        pos = '5'
      elsif board.taken?('3') && board.taken?('5') && board.position('5') == board.position('3') && !board.taken?('7')
        pos = '7'
      elsif board.taken?('7') && board.taken?('5') && board.position('5') == board.position('7') && !board.taken?('3')
        pos = '3'
      elsif board.taken?('3') && board.taken?('6') && board.position('6') == board.position('3') && !board.taken?('9')
        pos = '9'
      elsif board.taken?('3') && board.taken?('9') && board.position('9') == board.position('3') && !board.taken?('6')
        pos = '6'
      elsif board.taken?('6') && board.taken?('9') && board.position('9') == board.position('6') && !board.taken?('3')
        pos = '3'
      elsif board.taken?('2') && board.taken?('8') && board.position('8') == board.position('2') && !board.taken?('5')
        pos = '5'
      elsif board.taken?('2') && board.taken?('5') && board.position('5') == board.position('2') && !board.taken?('8')
        pos = '8'
      elsif board.taken?('5') && board.taken?('8') && board.position('8') == board.position('5') && !board.taken?('2')
        pos = '2'
      elsif board.taken?('4') && board.taken?('5') && board.position('5') == board.position('4') && !board.taken?('6')
        pos = '6'
      elsif board.taken?('4') && board.taken?('6') && board.position('6') == board.position('4') && !board.taken?('5')
        pos = '5'
      elsif board.taken?('5') && board.taken?('6') && board.position('6') == board.position('5') && !board.taken?('4')
        pos = '4'
      elsif board.taken?('7') && board.taken?('9') && board.position('9') == board.position('7') && !board.taken?('8')
        pos = '8'
      elsif board.taken?('7') && board.taken?('8') && board.position('8') == board.position('7') && !board.taken?('9')
        pos = '9'
      elsif board.taken?('8') && board.taken?('9') && board.position('9') == board.position('8') && !board.taken?('7')
        pos = '7'
      elsif !board.taken?('5')
        pos = '5'
      elsif !board.taken?('1') && ((!board.taken?('9') || board.position('9') == self.token) && (!board.taken?('5') || board.position('5') == self.token))
        pos = '1'
      elsif !board.taken?('3') && ((!board.taken?('7') || board.position('7') == self.token) && (!board.taken?('5') || board.position('5') == self.token))
        pos = '3'
      elsif !board.taken?('9') && ((!board.taken?('5') || board.position('5') == self.token) && (!board.taken?('1') || board.position('1') == self.token))
        pos = '9'
      elsif !board.taken?('7') && ((!board.taken?('5') || board.position('5') == self.token) && (!board.taken?('3') || board.position('3') == self.token))
        pos = '7'
      elsif !board.taken?('1') && ((!board.taken?('7') || board.position('7') == self.token) && (!board.taken?('4') || board.position('4') == self.token))
        pos = '1'
      elsif !board.taken?('3') && ((!board.taken?('9') || board.position('9') == self.token) && (!board.taken?('6') || board.position('6') == self.token))
        pos = '1'
      elsif !board.taken?('2') && ((!board.taken?('8') || board.position('8') == self.token) && (!board.taken?('5') || board.position('5') == self.token))
        pos = '2'
      elsif !board.taken?('3') && ((!board.taken?('1') || board.position('1') == self.token) && (!board.taken?('2') || board.position('2') == self.token))
        pos = '3'
      elsif !board.taken?('9') && ((!board.taken?('7') || board.position('7') == self.token) && (!board.taken?('8') || board.position('8') == self.token))
        pos = '9'
      elsif !board.taken?('6') && ((!board.taken?('4') || board.position('4') == self.token) && (!board.taken?('5') || board.position('5') == self.token))
        pos = '6'
      elsif !board.taken?('1')
        pos = '1'
      elsif !board.taken?('3')
        pos = '3'
      elsif !board.taken?('7')
        pos = '7'
      elsif !board.taken?('9')
        pos = '9'
      elsif !board.taken?('2')
        pos = '2'
      elsif !board.taken?('8')
        pos = '8'
      elsif !board.taken?('4')
        pos = '4'
      elsif !board.taken?('6')
        pos = '6'
      end
      puts "The machine moves to position: #{pos}"
      pos
    end
  end
end

=begin
if board.taken?('1') && board.taken?('2') && board.position('2') != self.token
  pos = '3'
elsif board.taken?('1') && board.position('1') != self.token &&  board.taken?('3') && board.position('3') != self.token
  pos = '2'
elsif board.taken?('2') && board.position('2') != self.token &&  board.taken?('3') && board.position('3') != self.token
  pos = '1'
elsif board.taken?('1') && board.position('1') != self.token &&  board.taken?('5') && board.position('5') != self.token
  pos = '9'
elsif board.taken?('1') && board.position('1') != self.token &&  board.taken?('9') && board.position('9') != self.token
  pos = '5'
elsif board.taken?('5') && board.position('5') != self.token &&  board.taken?('9') && board.position('9') != self.token
  pos = '1'
elsif board.taken?('1') && board.position('1') != self.token &&  board.taken?('4') && board.position('4') != self.token
  pos = '6'
elsif board.taken?('1') && board.position('1') != self.token &&  board.taken?('6') && board.position('6') != self.token
  pos = '4'
elsif board.taken?('1') && board.position('1') != self.token &&  board.taken?('6') && board.position('6') != self.token
  pos = '4'
elsif board.taken?('4') && board.position('4') != self.token &&  board.taken?('6') && board.position('6') != self.token
  pos = '1'
elsif board.taken?('3') && board.position('3') != self.token &&  board.taken?('7') && board.position('7') != self.token
  pos = '5'
elsif board.taken?('3') && board.position('3') != self.token &&  board.taken?('5') && board.position('5') != self.token
  pos = '7'
elsif board.taken?('7') && board.position('7') != self.token &&  board.taken?('5') && board.position('5') != self.token
  pos = '3'
elsif board.taken?('3') && board.position('3') != self.token &&  board.taken?('6') && board.position('6') != self.token
  pos = '9'
elsif board.taken?('3') && board.position('3') != self.token &&  board.taken?('9') && board.position('9') != self.token
  pos = '6'
elsif board.taken?('6') && board.position('6') != self.token &&  board.taken?('9') && board.position('9') != self.token
  pos = '3'
elsif board.taken?('2') && board.position('2') != self.token &&  board.taken?('8') && board.position('8') != self.token
  pos = '5'
elsif board.taken?('2') && board.position('2') != self.token &&  board.taken?('5') && board.position('5') != self.token
  pos = '8'
elsif board.taken?('5') && board.position('5') != self.token &&  board.taken?('8') && board.position('8') != self.token
  pos = '2'
elsif board.taken?('4') && board.position('4') != self.token &&  board.taken?('5') && board.position('5') != self.token
  pos = '6'
elsif board.taken?('4') && board.position('4') != self.token &&  board.taken?('6') && board.position('6') != self.token
  pos = '5'
elsif board.taken?('5') && board.position('5') != self.token &&  board.taken?('6') && board.position('6') != self.token
  pos = '4'
elsif board.taken?('7') && board.position('7') != self.token &&  board.taken?('9') && board.position('9') != self.token
  pos = '8'
elsif board.taken?('7') && board.position('7') != self.token &&  board.taken?('8') && board.position('8') != self.token
  pos = '9'
elsif board.taken?('8') && board.position('8') != self.token &&  board.taken?('9') && board.position('9') != self.token
  pos = '7'
=end
