module SitemapHelper

  def create_sitemap
    # Set the host name for URL creation
    SitemapGenerator::Sitemap.default_host = "http://workabroad.jp"
    SitemapGenerator::Sitemap.sitemaps_host = "http://workabroad.s3.amazonaws.com/"
    SitemapGenerator::Sitemap.public_path = 'public/'
    SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
    SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new

    SitemapGenerator::Sitemap.create do
      posts = Post.where("published=?", true)
      posts.each do |post|
        add post_path(post), :lastmod => post.updated_at
      end
    end
    
  end

end

