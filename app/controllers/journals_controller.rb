class JournalsController < ApplicationController
  def index
    journals = Journal.all
    render json: journals.as_json
  end

  def create
    journal = Journal.new(
      name: params[:name],
    )
    if journal.save
      render json: journal.as_json
    else
      render json: { errors: journal.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
