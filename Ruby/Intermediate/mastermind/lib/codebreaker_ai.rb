# frozen_string_literal: true

require_relative 'codebreaker'

# Extends codebreaker
class CodebreakerAI < Codebreaker
  def initialize
    super

    # 1122 guess baked in per algo
    @guess = %w[B B G G]
    @guess_memory = [@guess.clone]
    @guess_letter_memory = []
    @first_turn = true
    @is_human = false
  end

  def turn
    guess_engine
    compare_guess_to_code

    @first_turn = false if @first_turn == true
    puts "#{@name} has guessed #{@guess}"
    newline
  end

  def build_previous_guesses(index_of_iteration)
    @guess_memory.each do |prior_guess|
      prior_guess.each_with_index do |prior_guess_letter, prior_guess_letter_index|
        @guess_letter_memory.push(prior_guess_letter) if prior_guess_letter_index == index_of_iteration
      end
    end
  end

  def unused_letter_at_index
    return (colors_key - @guess_letter_memory).sample
  end

  def guess_engine
    return if @first_turn

    4.times do |index_of_iteration|
      next if @guess[index_of_iteration] == @code[index_of_iteration]

      build_previous_guesses(index_of_iteration)

      @guess[index_of_iteration] = unused_letter_at_index
      @guess_letter_memory = []
    end

    @guess_memory << @guess.clone
  end
end
