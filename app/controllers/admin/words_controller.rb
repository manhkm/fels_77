class Admin::WordsController < ApplicationController
  before_action :admin_user,     only: [:create, :destroy]
  
  def index
    @filterrific = initialize_filterrific(
      Word,
      params[:filterrific],
      select_options: {
        with_category_id: Category.options_for_select
      }
    ) or return
    @words = @filterrific.find.paginate page: params[:page]
    respond_to do |format|
      format.html
      format.js
    end
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
      redirect_to admin_words_url
    else
      render 'create'
    end
  end

  def destroy
    Word.find(params[:id]).destroy
    flash[:success] = t :word_deleted
    redirect_to admin_words_url
  end

  private
  def word_params
    params.require(:word).permit(:content_jp,
                          answers_attributes: [:content, :correct_answer])
  end
end
