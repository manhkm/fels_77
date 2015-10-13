class WordsController < ApplicationController
  before_action :admin_user,     only: [:create, :destroy]
  
  def index
    @search = Word.search(params[:q])
    @words = @search.result.paginate page: params[:page]
  end

  def show
    @word = Word.find params[:id]
    @answers = @word.answers
    @user_word = current_user.user_words.build 
  end
end
