class TodosController < ApplicationController
	before_filter :require_user, :except => [:index, :show, :create]

  def new
  end

  def create
  end
end
