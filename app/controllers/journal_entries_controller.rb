class JournalEntriesController < ApplicationController
  before_action :authenticate_user

  def index
    journal_entries = current_user.journal_entries
    render json: journal_entries.as_json
  end

  def show
    journal_entry = current_user.journal_entry.find_by(id: params[:id])
    render json: journal_entry.as_json
  end

  def create
    journal_entry = JournalEntry.create(
      title: params[:title],
      text: params[:text],
      journal_id: params[:text],
    )
    if journal_entry.save
      render json: journal_entry.as_json
    else
      render json: { errors: journal_entry.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
