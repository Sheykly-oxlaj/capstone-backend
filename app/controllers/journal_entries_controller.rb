class JournalEntriesController < ApplicationController
  def index
    journal_entries = JournalEntry.all
    render :json journal_entries.as_json
  end

  def show
    journal_entry = JournalEntry.find_by(id: params[:id])
    render :json journal_entry.as_json
  end 
end
