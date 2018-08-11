class SessionsController < ApplicationController
  def show
    render html: "session show"
  end

  def new
    @session = Account.new
  end

  def edit
    @session = Account.first
  end

end
