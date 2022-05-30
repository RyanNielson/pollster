class ChoicesController < ApplicationController
  before_action :set_choice, only: %i[ show edit update destroy ]

  # GET /choices
  def index
    @choices = Choice.all
  end

  # GET /choices/1
  def show
  end

  # GET /choices/new
  def new
    @choice = Choice.new
  end

  # GET /choices/1/edit
  def edit
  end

  # POST /choices
  def create
    @choice = Choice.new(choice_params)

    if @choice.save
      redirect_to @choice, notice: "Choice was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /choices/1
  def update
    if @choice.update(choice_params)
      redirect_to @choice, notice: "Choice was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /choices/1
  def destroy
    @choice.destroy
    redirect_to choices_url, notice: "Choice was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_choice
      @choice = Choice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def choice_params
      params.require(:choice).permit(:text, :poll_id)
    end
end
