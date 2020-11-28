class ExamplesController < ApplicationController
  before_action :set_term, only: %i(new create)
  before_action :set_example, only: %i(destroy verify_meaning)

  def new
    @example = @term.examples.build
  end

  def create
    @example = @term.examples.build(example_params)
    if @term.save
      flash[:notice] = "Example added successfully"
      redirect_to terms_path
    else
      flash[:error] = @term.errors.full_messages.to_sentence
      render :new
    end
  end

  def destroy
    @example.destroy
    redirect_back fallback_location: @example
  end

  def learn
    examples = Example.order(Arel.sql('RANDOM()'))
    @example = examples.first
  end

  def verify_meaning
    attempt = Attempt.new(term: @example.term, correct: @example.term.meanings.include?(params[:meaning].downcase))
    attempt.save!

    if attempt.correct?
      @example.term.update!(meaning_learned: true) if params[:meaning_learned] == "true"
      redirect_to learn_examples_path
    else
      flash[:error] = "Ooops! Your attempt <i class='text-secondary'>#{params[:meaning]}</i> is wrong! <a href='/examples/learn'>Continue Learning</a>"
      redirect_to url_for([:edit, @example.term])
    end
  end

  private

  def set_term
    if params[:verb_id].present?
      @term = Verb.find(params[:verb_id])
    elsif params[:noun_id].present?
      @term = Noun.find(params[:noun_id])
    elsif params[:adjective_id].present?
      @term = Adjective.find(params[:adjective_id])
    else
      raise "Error"
    end
  end

  def set_example
    @example = Example.find(params[:id])
  end

  def example_params
    params
      .require(:example)
      .permit(
        :sentence,
        :keyword,
      )
  end
end
