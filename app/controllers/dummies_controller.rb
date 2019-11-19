class DummiesController < ApplicationController
  before_action :set_dummy, only: [:show, :update, :destroy]

  # GET /dummies
  def index
    @dummies = Dummy.all

    render json: @dummies
  end

  # GET /dummies/1
  def show
    render json: @dummy
  end

  # POST /dummies
  def create
    @dummy = Dummy.new(dummy_params)

    if @dummy.save
      render json: @dummy, status: :created, location: @dummy
    else
      render json: @dummy.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dummies/1
  def update
    if @dummy.update(dummy_params)
      render json: @dummy
    else
      render json: @dummy.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dummies/1
  def destroy
    @dummy.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dummy
      @dummy = Dummy.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dummy_params
      params.require(:dummy).permit(:name, :number)
    end
end
