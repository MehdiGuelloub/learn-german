class WordsController < ApplicationController
    before_action :set_word, only: %i(edit update destroy verify migrate)

    def index
        @words = Word.all
        @words = @words.search(params[:search_term]) if params[:search_term].present?
        @words = @words.order("consecutive_correct_answers #{params[:direction]}") if params[:sort_by_streak]
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
            flash[:notice] = "Word updated successfully"
            redirect_to words_path
        else
            render :edit
        end
    end

    def learn
        words = Word.order(Arel.sql('RANDOM()'))

        if params[:smart_mode] == "true"
            words = words
                .where("consecutive_correct_answers < ?", 10)
                .or(words.where('updated_at < ?', 10.day.ago.to_datetime))
        end

        @word = words.first
        @translation = params[:translation]&.to_sym.presence || [:de_en, :en_de].sample
    end

    def learn_articles
        @word = Word.where.not(:article => 0).order(Arel.sql('RANDOM()')).first
    end

    def history
        @word_count_groups = Word.order('DATE(created_at) DESC').group('DATE(created_at)').count
    end

    def verify
        # Learning articles
        if params[:article].present?
            if @word.article == params[:article]
                @word.update(
                    :article_attempts => @word.article_attempts + 1,
                    :article_consecutive_correct_answers => @word.article_consecutive_correct_answers + 1
                )
                redirect_to learn_articles_words_path
            else
                @word.update(
                    :article_attempts => @word.article_attempts + 1,
                    :article_mistakes => @word.article_mistakes + 1,
                    :article_consecutive_correct_answers => 0
                )
                render :verify
            end
        end

        # Learning words
        if params[:word].present? && params[:meaning].present?
            increment_daily_practice
            if @word.word.downcase == params[:word].downcase && @word.meaning.downcase == params[:meaning].downcase
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

    def migrate
        params[:type] ||= "Noun" unless @word.article_none?
        @term = Term.new
    end

    private

    def word_params
        params.require(:word).permit(:word, :article, :meaning, :notes)
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
