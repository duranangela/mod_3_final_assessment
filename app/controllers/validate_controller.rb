class ValidateController < ApplicationController

  def index
    @presenter = ValidationPresenter.new(params[:word])
    binding.pry
    @word = 'foxes'
    @root = 'fox'
  end

end
