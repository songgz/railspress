module SitemapHelper

  def create_sitemap
    # Set the host name for URL creation
    SitemapGenerator::Sitemap.default_host = RP_SITEURL
    SitemapGenerator::Sitemap.sitemaps_host = RP_SITEMAP_HOST
    SitemapGenerator::Sitemap.sitemaps_path = RP_SITEMAP_PATH
    SitemapGenerator::Sitemap.public_path = 'public/'
    SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new

    SitemapGenerator::Sitemap.create do
      posts = Post.where("published=?", true)
      posts.each do |post|
        add post_path(post), :lastmod => post.updated_at
      end
    end
    
  end

end

