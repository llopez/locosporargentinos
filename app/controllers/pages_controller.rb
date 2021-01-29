# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    @articles = Article.all
    @categories = Category.with_articles
  end
end
