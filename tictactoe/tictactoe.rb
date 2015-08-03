class TicTacToe
  attr_reader :turn_number

  def initialize
  	print("Enter the name of player 1: ")
  	@p1 = gets.chomp
  	print("Enter the name of player 2: ")
  	@p2 = gets.chomp
  	@turn_number = 0
  	@board = Board.new
  end

  def play
  	until game_over?
  	  puts "It is #{turn_number.even? ? @p1 : @p2}'s turn.  Make your move (1-9)."
  	  puts "This is the current board."
      @board.show_board
      #get_player_move will eventually give a valid move
      move = get_player_move
      make_player_move
    end
    give_game_ending
  end

  def current_player
  	turn_number.even? ? @p1 : @p2
  end

  def game_over?; end
  def get_player_move; end
  def make_player_move; end
  def give_game_ending; end


end


class Board

  def initialize
    @board = (1..9).to_a
  end
  #TODO - showing board nicely
  def show_board
  	
    puts '----------'
    puts '|        |'
    puts '|        |'
    puts '|        |'
	puts '----------'
  end

  def open_positions
    @board.filter {|x| x in (1..9)}
  end

  def valid_move?(position)
    open_positions.include? position
  end
end

class Player
  attr_reader :name
  def initialize(name)
  	@name = name
  end

  def to_s
    @name
  end
end

ttoe = TicTacToe.new
ttoe.play