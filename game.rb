require './board'

class Game
  def initialize
    @board = ::Board.new
    @com = "X" # the computer's marker
    @hum = "O" # the user's marker
  end

  def start_game
    # start by printing the board
    print_board
    puts "Enter [0-8]:"
    # loop through until the game was won or tied
    until game_is_over? || game_is_tied?
      get_human_spot
      if !game_is_over? && !game_is_tied?
        eval_board
      end
      print_board
    end
    puts "Game over"
  end

  def get_human_spot
    spot = nil
    until spot
      spot = gets.chomp.to_i
      if @board.board[spot] != "X" && @board.board[spot] != "O"
        @board.board[spot] = @hum
      else
        spot = nil
      end
    end
  end

  def eval_board
    spot = nil

    until spot
      if @board.board[4] == "4"
        spot = 4
        @board.board[spot] = @com
      else
        spot = @board.get_best_move(@com, @hum)

        if @board.board[spot] != "X" && @board.board[spot] != "O"
          @board.board[spot] = @com
        else
          spot = nil
        end
      end
    end
  end

  private
  
  attr_reader :board

  def stop_game
    game_is_over? || game_is_tied?
  end

  def print_board
    board.show
  end

  def game_is_tied?
    board.game_is_tied?
  end 

  def game_is_over?
    board.game_is_over?
  end 
end

game = Game.new
game.start_game
