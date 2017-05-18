# frozen_string_literal: true

class EntriesController < ApplicationController
  helper_method :entries, :entry
  attr_accessor :entries, :entry

  before_action :authenticate_admin!, except: %i[index show]

  def index
    @entries = Entry.page(params[:page]).per(4)
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
      render :new
    end
  end

  def edit; end

  def update
    if entry.update_attributes(entry_params)
      flash[:notice] = 'Your entry was updated.'
      redirect_to entries_path
    else
      render :edit
    end
  end

  def show
    # Anyone should be able to see this, not just an admin
    @entry = Entry.where(id: params[:id]).first
  end

  def destroy
    if entry.destroy
      flash[:notice] = 'Your entry was destroyed.'
      redirect_to entries_path
    else
      flash[:alert] = 'There was an error :('
      redirect_to :back
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :content, :favorite, :image)
  end

  def entry
    @entry ||= current_admin.entries.where(id: params[:id]).first
  end

  def resource
    entry
  end

  def collection
    entries
  end
end
