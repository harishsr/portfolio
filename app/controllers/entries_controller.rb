class EntriesController < ApplicationController

  helper_method :entries, :entry
  attr_accessor :entries, :entry

  def index
    @entries = Entry.all
  end

  def new
    entry = Entry.new
  end

  def create
    entry = Entry.new(entry_params)
    # entry.admin = current_user
    if entry.save
      flash[:success] = 'Your entry was created!'
      redirect_to :index
    else
      flash[:error] = 'There was an error :('
      render :new
    end
  end

  # edit
  # show
  # update
  # destroy

  private

  def entry_params
    params.require(:entry).permit(:title, :content, :favorite)
  end

end
