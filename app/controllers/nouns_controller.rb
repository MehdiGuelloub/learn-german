class NounsController < ApplicationController
  before_action :set_noun, only: %i(edit update destroy)

  def new
    @noun = Noun.new
  end

  def create
    @noun = Noun.new(noun_params)
    if @noun.save
      flash[:notice] = "Noun added successfully"
      redirect_to new_noun_example_path(@noun)
    else
      flash[:error] = @noun.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
  end

  def update
    if @noun.update(noun_params)
      flash[:notice] = "Noun updated successfully"
      redirect_to terms_path
    else
      flash[:error] = @noun.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @noun.destroy
    redirect_to nouns_path
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
