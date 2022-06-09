class VotesController < ApplicationController
  include ChoiceScoped

  before_action :prevent_multiple_votes, only: %i[create]

  def create
    @vote = @choice.votes.build

    if @vote.save
      cookies.permanent["voted-#{@choice.poll.slug}"] = true
      redirect_to poll_results_url(@choice.poll), notice: 'Vote was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def prevent_multiple_votes
    redirect_to poll_results_url(@poll), alert: 'You already voted!' if cookies.permanent["voted-#{@poll.slug}"]
  end
end
