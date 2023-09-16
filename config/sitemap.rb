
require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://joband.co'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.create do
  group(:filename => :english) do 
    add '/?locale=en', :alternate => { :href => 'http://joband.co', :lang => 'en'}, changefreq: 'daily', priority: 1.0, :mobile => true
    add '/', :changefreq => 'daily', :priority => 0.9, :mobile => true
    add '/profiles', :changefreq => 'daily', :priority => 0.8, :mobile => true
    add '/bands', :changefreq => 'daily', :priority => 0.8, :mobile => true
    add '/bands', :changefreq => 'daily', :priority => 0.8, :mobile => true
    add '/activities', :changefreq => 'daily', :priority => 0.8, :mobile => true
    add 'communities/posts', :changefreq => 'weekly', :priority => 0.6, :mobile => true
    add '/contact_us', :changefreq => 'yearly', :priority => 0.4, :mobile => true
    add_to_index '/sitemap.xml', :host => 'http://joband.co'
    add_to_index '/sitemap.xml.gz', :host => 'http://joband.co'
  end
  group(:filename => :chinese) do
    add '/?locale=tw', :alternate => { :href => 'http://joband.co', :lang => 'tw'}, changefreq: 'daily', priority: 1.0, :mobile => true
    add '/', :changefreq => 'daily', :priority => 0.9, :mobile => true
    add '/profiles', :changefreq => 'daily', :priority => 0.8, :mobile => true
    add '/bands', :changefreq => 'daily', :priority => 0.8, :mobile => true
    add '/bands', :changefreq => 'daily', :priority => 0.8, :mobile => true
    add '/activities', :changefreq => 'daily', :priority => 0.8, :mobile => true
    add 'communities/posts', :changefreq => 'weekly', :priority => 0.6, :mobile => true
    add '/contact_us', :changefreq => 'yearly', :priority => 0.4, :mobile => true
    add_to_index '/sitemap.xml', :host => 'http://joband.co'
    add_to_index '/sitemap.xml.gz', :host => 'http://joband.co'
  end
end
SitemapGenerator::Sitemap.ping_search_engines

