require_relative 'shoe_universe'
require_relative 'shoe_cell'


Shoes.app(title: 'The Game of Life', width: 800, height: 620, resizable: true) do
  background white
  @animate = false
  WIDTH = 10

  stack(margin: 10) do
    @universe = ShoeUniverse.new(app, 40, 40)
    animate(10) do
      if @animate
        @universe.draw
        @universe.tick
      end
    end
  end

  flow(displace_left: 650) do
    stack do
      @run_button = button('Run', width: 100) { play }
      @stop_button = button('Stop', width: 100) { stop }
      @stop_button.hide
    end
  end

  def play
    @animate = true
    @run_button.hide
    @stop_button.show
  end

  def stop
    @animate = false
    @stop_button.hide
    @run_button.show
  end

end
