# frozen_string_literal: true

# spec/game_spec.rb

require './lib/Game/game.rb'
require 'rspec'

describe Game do
  describe 'game' do

    it '4 horizontal is a win' do
      game = Game.new

      4.times do |index|
        game.board.add(index, 'B')
      end

      expect(game.winner).to_not eql(false)
    end

    it '4 vertical is a win' do
    game = Game.new

    4.times do
      game.board.add(0, 'B')
    end

    expect(game.winner).to_not eql(false)
    end

    it '4 diagonal is a win' do
      game = Game.new

      3.times { game.board.add(0, 'B') }
      game.board.add(0, 'W')
      2.times { game.board.add(1, 'B') }
      game.board.add(1, 'W')
      game.board.add(2, 'B')
      game.board.add(2, 'W')
      game.board.add(3, 'W')

      expect(game.winner).to_not eql(false)
    end

    it '4 antediagonal is a win' do
      game = Game.new

      game.board.add(0, 'W')
      game.board.add(1, 'B')
      game.board.add(1, 'W')
      2.times { game.board.add(2, 'B') }

      game.board.add(2, 'W')

      2.times { game.board.add(3, 'B') }
      2.times { game.board.add(3, 'W') }

      game.board.add(4, 'W')
      2.times { game.board.add(4, 'B') }
      game.board.add(4, 'W')

      expect(game.winner).to_not eql(false)
    end
  end
end
