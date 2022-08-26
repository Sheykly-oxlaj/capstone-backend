class JournalEntriesController < ApplicationController
  def index
    journal_entries = JournalEntry.all
    render :json journal_entries.as_json
  end
end
