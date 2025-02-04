class PagesController < ApplicationController
  def home
    keywords = params.dig(:q, :tags_name_or_title_cont_any).to_s.strip.split(/\p{blank}+/)
    @q = Recipe.ransack(tags_name_or_title_cont_any: keywords.presence || [ "" ])
    @recipes = @q.result(distinct: true).order("created_at desc")
  end
end
