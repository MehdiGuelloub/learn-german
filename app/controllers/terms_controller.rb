class TermsController < ApplicationController
  def index
    @terms = Term.all
    @terms = @terms.search(params[:search_term]) if params[:search_term].present?
    @terms = @terms.page(params[:page]).per(per_page)
  end

  def create
    @word = Word.find(params[:word_id])
    @term = Term.new(term_params)
    if @term.save
      @word.update! migrated: true
      flash[:notice] = "Word Migrated"
      redirect_to url_for([:new, @term, :example])
    else
      flash[:error] = @term.errors.full_messages.to_sentence
      redirect_to migrate_word_path(@word)
    end
  end

  private

  def term_params
    params
      .require(:term)
      .permit(
        :type,
        :base,
        :meaning,
        :perfect,
        :praeteritum,
        :article,
        :plural,
        :comparative,
        :superlative,
      )
  end
end
