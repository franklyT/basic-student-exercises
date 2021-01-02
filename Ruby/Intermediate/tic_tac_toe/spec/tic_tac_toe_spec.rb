# frozen_string_literal: true
#spec/tic_tac_toe_spec.rb

require './lib/tic_tac_toe'

describe TicTacToe do
  describe '#win' do
    tictactoe = TicTacToe.new
    expect(TicTacToe.winner(player1)).to eql(player1)
  end
end
