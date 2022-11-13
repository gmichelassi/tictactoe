require './board'
require './human'

class Game
  def initialize
    @board = ::Board.new
    @first_player = ::Human.new(mark: "O")
    @com = "X" # the computer's marker
  end

  def start_game
    # start by printing the board
    print_board
    puts "Enter [0-8]:"
    # loop through until the game was won or tied
    until stop_game
      first_player.move(board.board, board.available_spaces)

      if !stop_game
        eval_board
      end

      print_board
    end

    puts "Game over"
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
  
  attr_reader :board, :first_player

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
