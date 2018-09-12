class ValidateController < ApplicationController

  def index
    @presenter = ValidationPresenter.new(params[:word])
  end

end
