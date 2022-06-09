class PollsController < ApplicationController
  before_action :set_poll, only: %i[show]
  before_action :redirect_to_results_if_voted, only: %i[show]

  def show; end

  def new
    @poll = Poll.new
    populate_choices
  end

  def create
    @poll = Poll.new(poll_params)

    if @poll.save
      redirect_to @poll, notice: 'Poll was successfully created.'
    else
      populate_choices
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Make sure there are always at least two choices.
  def populate_choices
    @poll.choices.build(Array.new(2 - @poll.choices.size) { {} }) if @poll.choices.size < 2
  end

  def set_poll
    @poll = Poll.find_by!(slug: params[:slug])
  end

  def poll_params
    params.require(:poll).permit(:text, choices_attributes: [:text])
  end

  def redirect_to_results_if_voted
    redirect_to poll_results_url(@poll) if cookies.permanent["voted-#{@poll.slug}"]
  end
end
