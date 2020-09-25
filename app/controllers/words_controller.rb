class WordsController < ApplicationController
    before_action :set_word, only: %i(edit update destroy verify)

    def index
        @words = Word.order(created_at: :DESC)
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
        @word = Word.order(Arel.sql('RANDOM()')).first
        @translation = params[:translation]&.to_sym.presence || [:de_en, :en_de].sample
    end

    def learn_articles
        @word = Word.where.not(:article => 0).order(Arel.sql('RANDOM()')).first
    end

    def verify
        @word.update(:attempts => @word.attempts + 1)

        # Learning articles
        if params[:article].present?
            if @word.article == params[:article]
                @word.update(:consecutive_correct_answers => @word.consecutive_correct_answers + 1)
                redirect_to learn_articles_words_path
            else
                @word.update(:mistakes => @word.mistakes + 1)
                @word.update(:consecutive_correct_answers => 0)
                render :verify
            end
        end

        # Learning words
        if params[:word].present? && params[:meaning].present?
            if @word.word.downcase == params[:word].downcase && @word.meaning.downcase == params[:meaning].downcase
                @word.update(:consecutive_correct_answers => @word.consecutive_correct_answers + 1)
                redirect_back :fallback_location => learn_words_path
            else
                @word.update(:mistakes => @word.mistakes + 1)
                @word.update(:consecutive_correct_answers => 0)
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
        params.require(:word).permit(:word, :article, :meaning, :notes)
    end

    def set_word
        @word = Word.find(params[:id])
    end
end
