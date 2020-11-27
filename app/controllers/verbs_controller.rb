class VerbsController < ApplicationController
  before_action :set_verb, only: %i(edit update destroy verify_partizip)

  def new
    @verb = Verb.new
  end

  def create
    @verb = Verb.new(verb_params)
    if @verb.save
      flash[:notice] = "Verb added successfully"
      redirect_to new_verb_example_path(@verb)
    else
      flash[:error] = @verb.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
  end

  def update
    if @verb.update(verb_params)
      flash[:notice] = "Verb updated successfully"
      redirect_to terms_path
    else
      flash[:error] = @verb.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @verb.destroy
    redirect_to verbs_path
  end

  def learn_partizip
    verbs = Verb.order(Arel.sql('RANDOM()'))
    @verb = verbs.first
  end

  def verify_partizip
    if perfect_correct? && praeteritum_correct?
      redirect_to learn_partizip_verbs_path
    else
      flash[:error] = "Ooops! #{"Perfect is wrong!" unless perfect_correct?} #{"Praeteritum is wrong!" unless praeteritum_correct?} <a href='/verbs/learn_partizip'>Continue Learning</a>"
      redirect_to edit_verb_url(@verb)
    end
  end

  private

  def perfect_correct?
    params[:perfect] == @verb.perfect
  end

  def praeteritum_correct?
    params[:praeteritum] == @verb.praeteritum
  end

  def set_verb
    @verb = Verb.find(params[:id])
  end

  def verb_params
    params
      .require(:verb)
      .permit(
        :base,
        :perfect,
        :praeteritum,
        :meaning,
      )
  end
end
