class Player

  attr_reader :token, :name

  def initialize(token, name='')
    @token = token
    name == '' ? @name = token : @name = name
    @mymoves = []
  end



end
