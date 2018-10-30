class SearchController < ApplicationController
  def index
    @word_search = WordSearchFacade.new(params[:q])
  end
end
