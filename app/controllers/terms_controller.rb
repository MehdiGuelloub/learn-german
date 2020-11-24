class TermsController < ApplicationController
  def index
    @terms = Term.all
    @terms = @terms.search(params[:search_term]) if params[:search_term].present?
    @terms = @terms.page(params[:page]).per(per_page)
  end
end
