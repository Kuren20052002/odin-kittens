class KittensController < ApplicationController
  before_action :set_kitten, only: [ :show, :edit, :update, :destroy ]

  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html
      format.json  { render json: @kittens }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      flash[:success] = "Kitten was successfully created."
      redirect_to kittens_path
    else
      flash.now[:errors] = @kitten.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json  { render json: @kitten }
    end
  end

  def edit; end

  def update
    if @kitten.update(kitten_params)
      flash[:success] = "Kitten was successfully updated."
      redirect_to kittens_path
    else
      flash.now[:errors] = @kitten.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten.destroy
    flash[:success] = "Kitten was successfully ******."
    redirect_to kittens_path
  end

  private

  def set_kitten
    @kitten = Kitten.find_by(id: params[:id])
    unless @kitten
      flash[:errors] = "Kitten not found."
      redirect_to kittens_path
    end
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
