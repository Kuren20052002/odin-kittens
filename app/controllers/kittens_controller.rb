class KittensController < ApplicationController
  before_action :set_kitten, only: [ :show, :edit, :update ]

  def index
    @kittens = Kitten.all
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
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @kitten.update(kitten_params)
      flash[:success] = "Kitten was successfully updated."
      redirect_to kittens_path
    else
      flash.now[:errors] = @kitten.errors.full_messages.to_sentence
      render :edit
    end
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
