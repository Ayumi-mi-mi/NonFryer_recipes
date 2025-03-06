module ApplicationHelper
  def default_meta_tags
    {
      site: 'NonFryer recipes',
      title: 'ノンフライヤーのレシピ検索',
      reverse: true,
      charset: 'utf-8',
      description: 'ノンフライヤーで作った料理だけを掲載するアプリです。これって何度で何分やるんだろう... もっと美味しく作るにはどうしたらいい？ どんなものが作れるの？ そんなお悩みを解決します。',
      keywords: 'ノンフライヤー,レシピ,ノンフライヤーレシピ',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('NonFryer_recipes.png'),
        local: 'ja-JP',
      }
    }
  end
end


