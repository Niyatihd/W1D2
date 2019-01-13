require_relative "board.rb"
require_relative "card.rb"

class Game
  attr_reader :board, :prev_guess

  def initialize(board = Board.new)
    @board = board
    board.populate
    @prev_guess = nil
  end

  def prompt
    print "Pick a position to flip: "
    pos = gets.chomp
    row, col = pos[0].to_i, pos[-1].to_i
    guessed_pos = [row, col]
  end

  def render_board
    puts @board.render
  end

  def make_guess(guessed_pos)
    if @prev_guess == nil
      @prev_guess = @board[guessed_pos]
      flip(@prev_guess)
    elsif @prev_guess == @board[guessed_pos].symbol
      flip(@board[guessed_pos])
      @prev_guess = nil
    else
      flip(@prev_guess)
      @prev_guess = nil
    end
  end

  def flip(card)
    card.reveal if card.hidden
    card.hide if !card.hidden
  end

  def play
    until @board.won?
      render_board
      guess = prompt
      make_guess(guess)
      render_board
    end
  end

end

new_game = Game.new
new_game.play