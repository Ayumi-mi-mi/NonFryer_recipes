require "open-uri"
require "nokogiri"
require "addressable/uri"
require "uri"

class Embed < ApplicationRecord
  belongs_to :recipe

  enum kind: { website: 0, youtube: 1, instagram: 2 }
  before_save :ogp, if: -> { url_changed? && kind == "website" }

  validates :kind, presence: true, if: -> { url.present? }

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

  def safe_url
    begin
      uri = URI.parse(url)
      return url if uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)
    rescue URI::InvalidURIError
    end
    "#"
  end

  private

  def youtube
    url.split("/").last
  end

  def instagram
    return "" unless url.present?

    %(
      <blockquote class="instagram-media" data-instgrm-permalink="#{url}" data-instgrm-version="14">
        <a href="#{url}"></a>
      </blockquote>
    )
  end

  def ogp
    begin
      encoded_url = Addressable::URI.parse(url).normalize.to_s
      encoded_html = URI.open(encoded_url).read

      doc = Nokogiri::HTML(encoded_html)
      self.ogp_title = doc.at("meta[property='og:title']")&.[]("content").presence || url
      self.ogp_description = doc.at("meta[property='og:description']")&.[]("content")
      self.ogp_image_url = doc.at("meta[property='og:image']")&.[]("content")
      self.ogp_site_name = doc.at("meta[property='og:site_name']")&.[]("content")

    rescue OpenURI::HTTPError => e
      puts "エラーが発生しました: #{e.message}"
    rescue => e
      puts "OGP取得エラー: #{e.message}"
      puts "エラーが発生しました: #{e.message}"
    end
  end
end
