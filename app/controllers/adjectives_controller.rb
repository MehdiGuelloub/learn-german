class AdjectivesController < ApplicationController
  before_action :set_adjective, only: %i(edit update destroy)
  skip_before_action :verify_authenticity_token

  def new
    @adjective = Adjective.new
  end

  def create
    @adjective = Adjective.new(adjective_params)
    if @adjective.save
      flash[:notice] = "Adjective added successfully"

      respond_to do |format|
        format.html { redirect_to new_adjective_example_path(@adjective) }
        format.json { render :show }
      end
    else
      flash[:error] = @adjective.errors.full_messages.to_sentence

      respond_to do |format|
        format.html { render :new }
        format.json { render json: @adjective.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @adjective.update(adjective_params)
      flash[:notice] = "Adjective updated successfully"

      respond_to do |format|
        format.html { redirect_to terms_path }
        format.json { render :show }
      end
    else
      flash[:error] = @adjective.errors.full_messages.to_sentence

      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @adjective.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @adjective.destroy

    respond_to do |format|
      format.html { redirect_to terms_path }
      format.json { head 200 }
    end
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
        :meanings_accepted,
      )
  end
end
