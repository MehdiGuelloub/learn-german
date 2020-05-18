class WordsController < ApplicationController

    def index
        @words = Word.all
    end

    def new
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

    def learn
        @word = Word.order(Arel.sql('RANDOM()')).first
        @translation = [:de_en, :en_de].sample
    end

    def verify
        @word = Word.find(params[:id])
        @word.update(:attempts => @word.attempts + 1)
        
        if @word.word.downcase == params[:word].downcase && @word.meaning.downcase == params[:meaning].downcase
            flash[:notice] = "Bravo!"
            redirect_to learn_words_path
        else
            @word.update(:mistakes => @word.mistakes + 1)
            flash[:alert] = "Ooops!"
            render :verify
        end
    end

    private

    def word_params
        params.require(:word).permit(:word, :meaning, :example)
    end
end
