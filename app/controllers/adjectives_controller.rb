class AdjectivesController < ApplicationController
  before_action :set_adjective, only: %i(edit update destroy)

  def new
    @adjective = Adjective.new
  end

  def create
    @adjective = Adjective.new(adjective_params)
    if @adjective.save
      flash[:notice] = "Adjective added successfully"
      redirect_to new_adjective_example_path(@adjective)
    else
      flash[:error] = @adjective.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
  end

  def update
    if @adjective.update(adjective_params)
      flash[:notice] = "Adjective updated successfully"
      redirect_to terms_path
    else
      flash[:error] = @adjective.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @adjective.destroy
    redirect_to adjectives_path
  end

  private

  def set_adjective
    @adjective = Adjective.find(params[:id])
  end

  def adjective_params
    params
      .require(:adjective)
      .permit(
        :base,
        :comparative,
        :superlative,
        :meaning,
      )
  end
end
