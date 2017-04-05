class EntriesController < ApplicationController

  helper_method :entries, :entry
  attr_accessor :entries, :entry

  def index
    @entries = Entry.all
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new entry_params
    # entry = current_user.entries.build(entry_params)
    if entry.save
      flash[:notice] = 'Your entry was created!'
      redirect_to :index
    else
      flash[:alert] = 'There was an error :('
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

  def resource
    entry
  end

  def collection
    entries
  end

end
