class JournalEntriesController < ApplicationController
  def index
    journal_entries = JournalEntry.all
    render json: journal_entries.as_json
  end

  def show
    journal_entry = JournalEntry.find_by(id: params[:id])
    render json: journal_entry.as_json
  end

  def create
    journal_entry = JournalEntry.create(
      title: params[:title],
      text: params[:text],
    )
    if journal_entry.save
      render json: journal_entry.as_json
    else
      render json: { errors: journal_entry.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
