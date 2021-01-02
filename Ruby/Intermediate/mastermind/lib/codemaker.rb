# frozen_string_literal: true

require_relative 'helpers'

# Codemaker role logic
class Codemaker
  include Helpers
  attr_accessor :code, :name

  def initialize
    @code = ''
  end
end
