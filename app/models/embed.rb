require 'nokogiri'
require 'open-uri'
require 'cgi'
require 'addressable/uri'  # 追加

class Embed < ApplicationRecord
  belongs_to :recipe

  enum kind: { website: 0, youtube: 1, twitter: 2, instagram: 3 }

  def embed_type
    return "" unless url.present?

    case kind
    when "youtube"
      youtube
    when "instagram"
      instagram
    else
      ogp
    end
  end

  private

  def youtube
    url.split('/').last
  end

  def instagram
    %(
      <blockquote class="instagram-media" data-instgrm-permalink="#{url}" data-instgrm-version="14">
        <a href="#{url}"></a>
      </blockquote>
      <script async src="https://www.instagram.com/embed.js"></script>
    ).html_safe
  end

  def ogp
    begin
      # URLエンコードを `Addressable::URI.encode` で行う
      encoded_url = Addressable::URI.parse(url).normalize.to_s

      # `User-Agent` を設定し、HTMLを取得
      html = URI.open(encoded_url, "User-Agent" => "Mozilla/5.0").read

      # 文字エンコーディングをUTF-8に変換
      encoded_html = html.encode("UTF-8", invalid: :replace, undef: :replace, replace: "?")

      # Nokogiriでパース
      doc = Nokogiri::HTML(encoded_html)

      # OGP情報を取得
      self.ogp_title = doc.at("meta[property='og:title']")&.[]('content')
      self.ogp_description = doc.at("meta[property='og:description']")&.[]('content')
      self.ogp_image_url = doc.at("meta[property='og:image']")&.[]('content')
      self.ogp_site_name = doc.at("meta[property='og:site_name']")&.[]('content')
      save

    rescue OpenURI::HTTPError => e
      puts "HTTPエラー: #{e.message}"
    rescue => e
      puts "OGP取得エラー: #{e.message}"
    end
  end
end
