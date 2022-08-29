class JournalEntriesController < ApplicationController
  before_action :authenticate_user

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
