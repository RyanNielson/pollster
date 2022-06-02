class VotesController < ApplicationController
  before_action :set_poll, only: %i[create]
  before_action :set_choice, only: %i[create]
  before_action :prevent_multiple_votes, only: %i[create]

  def create
    @vote = @choice.votes.build

    if @vote.save
      cookies.permanent["voted-#{@poll.slug}"] = true
      redirect_to @poll, notice: 'Vote was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_poll
    @poll = Poll.find_by!(slug: params[:poll_slug])
  end

  def set_choice
    @choice = @poll.choices.find(params[:choice_id])
  end

  def prevent_multiple_votes
    redirect_to @poll, alert: 'You already voted!' if cookies.permanent["voted-#{@poll.slug}"]
  end
end
