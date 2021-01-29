class WordsController < ApplicationController
    before_action :set_word, only: %i(edit update destroy verify)
    skip_before_action :verify_authenticity_token

    def index
        @words = Word.all
        @words = @words.search(params[:search_term]) if params[:search_term].present?
        @words = @words.where(word_type: params[:word_type]) if params[:word_type].present?
        @words = @words.send(params[:learned_status]) if params[:learned_status].present?
        @words = @words.order("consecutive_correct_answers #{params[:direction]}") if params[:sort_by_streak].present?
        @words = @words.page(params[:page]).per(per_page)
    end

    def new
        @word = Word.new
    end

    def create
        @word = Word.new(word_params)
        if @word.save
            flash[:notice] = "Word added successfully"
            redirect_to new_word_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @word.update(word_params)
            respond_to do |format|
                format.html do
                    flash[:notice] = "Word updated successfully"
                    redirect_to words_path
                  end

                  format.js { render }
            end
        else
            render :edit
        end
    end

    def learn
        words = Word.order(Arel.sql('RANDOM()'))
        words = params[:practice_learned] == "true" ? words.meaning_learned : words.to_learn_meaning
        words = words.where("consecutive_correct_answers < ?", 10).or(words.where('updated_at < ?', 10.day.ago.to_datetime)) if params[:smart_mode] == "true"
        words = words.where.not(updated_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day) if params[:once_a_day] == "true"
        @word = words.first
        @translation = params[:translation]&.to_sym.presence || [:de_en, :en_de].sample
    end

    def learn_articles
        @word = Word.where.not(:article => 0).order(Arel.sql('RANDOM()')).first
    end

    def learn_verb_prepositions
        @word = Word.to_learn_preposition.order(Arel.sql('RANDOM()')).first
        solution = [@word.verb_preposition]
        suggestions_without_solution = Word.verb_prepositions.keys - solution
        @prepositions_suggestions = suggestions_without_solution.sample(3).concat(solution).shuffle
    end

    def history
        @word_count_groups = Word.order('DATE(created_at) DESC').group('DATE(created_at)').count
    end

    def verify
        # Learning articles
        if params[:article].present?
            if @word.article == params[:article]
                redirect_to learn_articles_words_path
            else
                render :verify
            end
        end

        # Learning prepositions
        if params[:verb_preposition].present?
            if @word.verb_preposition == params[:verb_preposition]
                redirect_to learn_verb_prepositions_words_path
            else
                render :verify
            end
        end

        # Learning words
        if params[:word].present? && params[:meaning].present?
            increment_daily_practice
            if @word.accepted_forms_for_word.include?(params[:word].downcase) && @word.accepted_forms_for_meaning.include?(params[:meaning].downcase)
                @word.update(
                    :attempts => @word.attempts + 1,
                    :consecutive_correct_answers => @word.consecutive_correct_answers + 1
                )
                redirect_back :fallback_location => learn_words_path
            else
                increment_daily_mistakes
                @word.update(
                    :attempts => @word.attempts + 1,
                    :mistakes => @word.mistakes + 1,
                    :consecutive_correct_answers => 0
                )
                render :verify
            end
        end
    end

    def destroy
        @word.destroy
        redirect_to words_path
    end

    private

    def word_params
        params
            .require(:word)
            .permit(
                :word_type,
                :article,
                :word,
                :example,
                :keyword,
                :meaning,
                :notes,
                :perfect,
                :praeteritum,
                :plural,
                :comparative,
                :superlative,
                :meaning_forms,
                :learned_status,
                :verb_preposition,
            )
    end

    def set_word
        @word = Word.find(params[:id])
    end

    def increment_daily_practice
        practice = Practice.find_or_initialize_by(date: Date.today)
        practice.increment(:number_of_practiced_words_per_day)
        practice.save!
    end

    def increment_daily_mistakes
        practice = Practice.find_or_initialize_by(date: Date.today)
        practice.increment(:number_of_mistakes_per_day)
        practice.save!
    end
end
