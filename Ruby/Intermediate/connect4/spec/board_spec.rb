# frozen_string_literal: true

# spec/board_spec.rb

require './lib/Game/game.rb'
require 'rspec'

describe Game do
  describe 'board' do

    it 'adds properly' do
      game = Game.new
      3.times { game.board.add(0, 'X') }
      expect(game.board.display.scan(/X/).length).to eql(3)
    end

    it 'wont add when full' do
      game = Game.new
      12.times { game.board.add(0, 'X') }
      expect(game.board.add(0, 'X')).to eql(false)
    end
  end
end
