class EntriesController < ApplicationController

  helper_method :entries, :entry
  attr_accessor :entries, :entry

  before_action :authenticate_admin!, except: [ :index, :show ]

  def index
    @entries = Entry.all
  end

  def new
    @entry = current_admin.entries.build
  end

  def create
    @entry = current_admin.entries.build(entry_params)
    if entry.save
      flash[:notice] = 'Your entry was created!'
      redirect_to entries_path
    else
      flash[:alert] = 'There was an error :('
      render :new
    end
  end

  # edit

  def show
    # Anyone should be able to see this, not just an admin
    @entry = Entry.where(id: params[:id]).first
  end

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
