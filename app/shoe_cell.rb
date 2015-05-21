require_relative '../lib/application/cell'

class ShoeCell < Cell
  WIDTH = 15

  def self.alive(app, *location)
    ShoeCell.new(app, Cell::ALIVE, *location)
  end

  def self.dead(app, *location)
    ShoeCell.new(app, Cell::DEAD, *location)
  end

  def initialize(app, status, *location)
    @app = app
    @shoes_cell = @app.rect(left: WIDTH * location[1], top: WIDTH * location[0], width: WIDTH)
    @shoes_cell.click { toggle_status; draw }
    super(status, *location)
  end

  def draw
    @shoes_cell.style(fill: (@status == Cell::ALIVE) ? '#000' : '#fff')
  end

  def kill
    @status = Cell::DEAD
  end

  private

  def toggle_status
    @status = if alive?
                Cell::DEAD
              else
                Cell::ALIVE
              end
  end

end