require './board'
require './human'
require './computer'

class Game
  def initialize
    @board = ::Board.new
    @first_player = ::Human.new(mark: "O")
    @second_player = ::Computer.new(mark: "X")
  end

  def start_game
    print_board
    puts "Enter [0-8]:"

    until stop_game
      first_player.move(board.board, board.available_spaces)

      if !stop_game
        second_player.move(@board, board.available_spaces)
      end

      print_board
    end

    puts "Game over"
  end

  private
  
  attr_reader :board, :first_player, :second_player

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
