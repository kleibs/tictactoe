class TicTacToe

    def initialize
    @board = {1 => ' ', 2 => ' ', 3 => ' ',
          4 => ' ', 5 => ' ', 6 => ' ', 
          7 => ' ', 8 => ' ', 9 => ' '}
  end

  def draw_board
      puts "#{@board[1]} | #{@board[2]} | #{@board[3]}"   
      puts "----------"
      puts "#{@board[4]} | #{@board[5]} | #{@board[6]}"
      puts "----------"
      puts "#{@board[7]} | #{@board[8]} | #{@board[9]}"
  end

  class Player
    def initialize(name, symbol)
      @name = name
      @symbol = symbol
    end

    def name
      @name
    end

    def symbol
      @symbol
    end
  end

  def turn(player)
    print "#{player.name}, choose a square: "
    move = gets.chomp.to_i
    puts "\n"
    @board[move] = player.symbol
  end

 def win?(player)
  if @board[1] + @board[2] + @board[3] == player.symbol * 3 || 
     @board[4] + @board[5] + @board[6] == player.symbol * 3 || 
     @board[7] + @board[8] + @board[9] == player.symbol * 3 || 
     @board[1] + @board[4] + @board[7] == player.symbol * 3 || 
     @board[2] + @board[5] + @board[8] == player.symbol * 3 || 
     @board[3] + @board[6] + @board[9] == player.symbol * 3 || 
     @board[3] + @board[5] + @board[7] == player.symbol * 3 || 
     @board[1] + @board[5] + @board[9] == player.symbol * 3
    return true
  else
    false
  end
  end

  def start
    p1 = Player.new("Player 1", "X")
    p2 = Player.new("Player 2", "O")
    self.draw_board
    moves = 0
    while true
      self.turn(p1)
      moves += 1
      self.draw_board
      if self.win?(p1)
        puts "#{p1.name} wins"
        break
      elsif moves == 5
        puts "It's a tie."
        break
      end
      self.turn(p2)
      self.draw_board
      if self.win?(p2)
        puts "#{p2.name} wins"
        break
      end
    end
  end

end

game = TicTacToe.new
game.start