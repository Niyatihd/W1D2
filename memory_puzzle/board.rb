require_relative "card.rb"

class Board
  attr_reader :grid

  def initialize(grid = Array.new(4) { Array.new(4) })
    @grid = grid
  end

  def [](pos)
    self[pos] = self.grid[pos[0]][pos[1]]
  end

  def []=(pos, val)
    self.grid[pos[0]][pos[1]] = val
  end

  def get_cards
    set_of_cards = []
    until set_of_cards.length == 8
      card = Card.new
      unless set_of_cards.include? card
        set_of_cards << card
      end
    end
    set_of_cards
  end

  def empty?
    @grid.flatten.empty?
  end

  def populate
    pop_arr = (get_cards + get_cards).shuffle
    i = 0
    while i < @grid.length
      j = 0
      while j < @grid[0].length
        @grid[i][j] = pop_arr.pop
        j += 1
      end
      i += 1
    end
  end

  def render
    str_render = []
    @grid.each_with_index do |row, i|
      row = @grid[i].map do |ele|
        if ele.hidden == true
          "*"
        else
          ele.symbol
        end
      end
      str_render << row.join(" ")
    end
    str_render.join("\n")
  end

  def reveal(guessed_pos)
    self[guessed_pos].reveal
  end

  def won?
    @grid.flatten.all? { |el| el.hidden == false }
  end

end

# new_board = Board.new
# new_board.populate
# # new_board.render
# # new_board.reveal([0,2])
# # new_board.render
# p new_board.won?

