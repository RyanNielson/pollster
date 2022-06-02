class PollsController < ApplicationController
  before_action :set_poll, only: %i[show edit update destroy]
  before_action :set_voted, only: %i[show]

  # GET /polls
  def index
    @polls = Poll.all
  end

  # GET /polls/1
  def show; end

  # GET /polls/new
  def new
    @poll = Poll.new
    @poll.choices.build
    @poll.choices.build
  end

  # GET /polls/1/edit
  def edit; end

  # POST /polls
  def create
    @poll = Poll.new(poll_params)

    if @poll.save
      redirect_to @poll, notice: 'Poll was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /polls/1
  def update
    if @poll.update(poll_params)
      redirect_to @poll, notice: 'Poll was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /polls/1
  def destroy
    @poll.destroy
    redirect_to polls_url, notice: 'Poll was successfully destroyed.'
  end

  private

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
