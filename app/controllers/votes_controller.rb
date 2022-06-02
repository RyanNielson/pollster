class VotesController < ApplicationController
  before_action :set_poll, only: %i[create]
  before_action :set_choice, only: %i[create]
  before_action :prevent_multiple_votes, only: %i[create]

  # before_action :set_vote, only: %i[ show edit update destroy ]

  # GET /votes
  # def index
  #   @votes = Vote.all
  # end

  # # GET /votes/1
  # def show; end

  # # GET /votes/new
  # def new
  #   @vote = Vote.new
  # end

  # GET /votes/1/edit
  # def edit; end

  # POST /votes
  def create
    p 'RYAN CREATE'
    p @choice
    p @poll
    @vote = @choice.votes.build

    if @vote.save
      cookies.permanent["voted-#{@poll.slug}"] = true
      # redirect_to @vote, notice: 'Vote was successfully created.'
      redirect_to @poll, notice: 'Vote was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /votes/1
  # def update
  #   if @vote.update(vote_params)
  #     redirect_to @vote, notice: 'Vote was successfully updated.'
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /votes/1
  # def destroy
  #   @vote.destroy
  #   redirect_to votes_url, notice: 'Vote was successfully destroyed.'
  # end

  private

  def set_poll
    @poll = Poll.find_by!(slug: params[:poll_slug])
  end

  def set_choice
    @choice = @poll.choices.find(params[:choice_id])
  end

  def set_vote
    @vote = Vote.find(params[:id])
  end

  def prevent_multiple_votes
    redirect_to @poll, alert: 'You already voted!' if cookies.permanent["voted-#{@poll.slug}"]
  end

  # # Only allow a list of trusted parameters through.
  # def vote_params
  #   params.require(:vote).permit(:choice_id)
  # end
end
