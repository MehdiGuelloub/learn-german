class NounsController < ApplicationController
  before_action :set_noun, only: %i(edit update destroy)
  skip_before_action :verify_authenticity_token

  def new
    @noun = Noun.new
  end

  def create
    @noun = Noun.new(noun_params)
    if @noun.save
      flash[:notice] = "Noun added successfully"

      respond_to do |format|
        format.html { redirect_to new_noun_example_path(@noun) }
        format.json { render :show }
      end
    else
      flash[:error] = @noun.errors.full_messages.to_sentence

      respond_to do |format|
        format.html { render :new }
        format.json { render json: @noun.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @noun.update(noun_params)
      flash[:notice] = "Noun updated successfully"

      respond_to do |format|
        format.html { redirect_to terms_path }
        format.json { render :show }
      end
    else
      flash[:error] = @noun.errors.full_messages.to_sentence

      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @noun.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @noun.destroy

    respond_to do |format|
      format.html { redirect_to terms_path }
      format.json { head 200 }
    end
  end

  private

  def set_noun
    @noun = Noun.find(params[:id])
  end

  def noun_params
    params
      .require(:noun)
      .permit(
        :article,
        :base,
        :plural,
        :meaning,
        :meanings_accepted,
      )
  end
end
