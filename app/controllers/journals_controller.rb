class JournalsController < ApplicationController
  before_action :authenticate_user

  def index
    journals = current_user.journals
    render json: journals.as_json
  end

  def show #shows all the journal_entries belonging to this journal
    journal_entries = JournalEntry.where(journal_id: params[:id])
    render json: journal_entries.as_json
  end

  def create
    journal = Journal.new(
      name: params[:name],
      user_id: current_user.id,
    )
    if journal.save
      render json: journal.as_json
    else
      render json: { errors: journal.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
