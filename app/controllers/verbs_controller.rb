class VerbsController < ApplicationController
  before_action :set_verb, only: %i(edit update destroy verify_partizip)
  skip_before_action :verify_authenticity_token

  def new
    @verb = Verb.new
  end

  def create
    @verb = Verb.new(verb_params)
    if @verb.save
      flash[:notice] = "Verb added successfully"

      respond_to do |format|
        format.html { redirect_to new_verb_example_path(@verb) }
        format.json { render :show }
      end
    else
      flash[:error] = @verb.errors.full_messages.to_sentence

      respond_to do |format|
        format.html { render :new }
        format.json { render json: @verb.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @verb.update(verb_params)
      flash[:notice] = "Verb updated successfully"

      respond_to do |format|
        format.html { redirect_to terms_path }
        format.json { render :show }
      end
    else
      flash[:error] = @verb.errors.full_messages.to_sentence

      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @verb.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @verb.destroy

    respond_to do |format|
      format.html { redirect_to terms_path }
      format.json { head 200 }
    end
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
        :meanings_accepted,
      )
  end
end
