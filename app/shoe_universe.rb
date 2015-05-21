require_relative '../lib/application/cell'
require_relative '../lib/application/universe'

class ShoeUniverse < Universe

  def initialize(app, width, height)
    @app = app
    @shoe_cells = Hash.new
    super([width, height])
    draw_dead_cells
  end

  def draw
    @cells.each do |location, cell|
      if living_cells_locations.any? { |live_location| live_location ==location }
        @shoe_cells[location].resurrect
        @shoe_cells[location].draw
      else
        @shoe_cells[location].kill
        @shoe_cells[location].draw
      end
    end
  end

  def tick
    @cells = @shoe_cells
    super
  end

  def clear
    clean_up
    super
  end

  private

  def clean_up
    living_cells_locations.each do |location|
      @shoe_cells[location].kill
      @shoe_cells[location].draw
    end
  end

  def draw_dead_cells
    @dimensions[0].times do |i|
      @dimensions[1].times do |j|
        @shoe_cells[[i, j]] = ShoeCell.dead(@app, i, j)
        @shoe_cells[[i, j]].draw
      end
    end
  end
end