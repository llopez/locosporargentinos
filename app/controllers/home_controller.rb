# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @articles = Article.all
    @categories = Category.with_articles
  end

  def show
    category = Category.find_by(slug: params[:slug])
    @categories = Category.with_articles
    @articles = category.articles

    render 'pages/index'
  end
end