class WordsController < ApplicationController
  before_action :admin_user,     only: [:create, :destroy]
  
  def index
    @words = Word.paginate page: params[:page]
  end

  def show
    @word = Word.find params[:id]
    @answers = @word.answers
    @user_word = current_user.user_words.build 
  end

  def new
    @word = Word.new
    4.times { @word.answers.build }
  end

  def create
    @word = Word.new word_params 
    if @word.save
      flash[:success] = t :create_word_success
      redirect_to words_url
    else
      render 'create'
    end
  end

  def destroy
    Word.find(params[:id]).destroy
    flash[:success] = t :word_deleted
    redirect_to words_url
  end

  private
  def word_params
    params.require(:word).permit(:content_jp,
                          answers_attributes: [:content, :correct_answer])
  end
end
