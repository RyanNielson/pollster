class PollsController < ApplicationController
  before_action :set_poll, only: %i[show]
  before_action :set_voted, only: %i[show]

  def show; end

  def new
    @poll = Poll.new
    populate_choices
    # @poll.choices.build
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

  # TODO: Fix this because it's terrible.
  def populate_choices
    case @poll.choices.size
    when 0
      @poll.choices.build([{}, {}])
    when 1
      @poll.choices.build
    end
  end

  def set_poll
    @poll = Poll.find_by!(slug: params[:slug])
  end

  def set_voted
    @voted = cookies.permanent["voted-#{@poll.slug}"].present?
  end

  # Only allow a list of trusted parameters through.
  def poll_params
    params.require(:poll).permit(:text, choices_attributes: [:text])
  end
end
