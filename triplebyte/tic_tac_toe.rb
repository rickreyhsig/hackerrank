class Board
  def initialize
    @board_state = {'1' => "-", '2' => "-", '3' => "-",
                    '4' => "-", '5' => "-", '6' => "-",
                    '7' => "-", '8' => "-", '9' => "-"}
  end

  def print_board
    @board_state.each do |k, v|
      print v
      print (k.to_i%3 == 0) ? "\n" : "|"
    end
  end

  def add_token(location, value)
    @board_state[location.to_s] = value
  end

  def is_full
    !@board_state.values.include? '-'
  end

  def make_ai_move
    if self.is_full
      raise 'Error - board is already full'
      exit
    end
    @board_state.each do |k,v|
      if v == '-'
        self.add_token(k, 'X')
        return
      end
    end
  end
end

b = Board.new
