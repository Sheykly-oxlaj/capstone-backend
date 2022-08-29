class JournalEntriesController < ApplicationController
  before_action :authenticate_user

  def index
    journal_entries = JournalEntry.where(journal_id: params[:journal_id])
    render json: journal_entries.as_json
  end

  def show
    journal_entry = JournalEntry.find_by(id: params[:id])
    if journal_entry.journal.user_id == current_user.id
      render json: journal_entry.as_json
    else
      render json: { errors: "Must authenticate user" }, status: :unprocessable_entity
    end
  end

  def create
    journal_entry = JournalEntry.new(
      title: params[:title],
      text: params[:text],
      journal_id: params[:journal_id],
    )
    if journal_entry.save
      render json: journal_entry.as_json
    else
      render json: { errors: journal_entry.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
