class EntryController < ApplicationController

  helper_method :entries
  attr_reader :entries

  def index
    @entries = Entry.all
  end

  # new
  # edit
  # show
  # create
  # update
  # destroy

end
