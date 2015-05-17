require 'spec_helper'

describe 'Game Of Life' do

  it 'should create a universe' do
    game_of_life = GameOfLife.new
    expect(game_of_life.universe).to be_kind_of(Universe)
  end
end