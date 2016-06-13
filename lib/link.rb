class LinkItem
  include Listable

  attr_reader :site_name

  def initialize(url, options={})
    @description = url
    @site_name = options[:site_name]
    @type = "link"
  end
  
  # def format_name
  #   @site_name ? @site_name : ""
  # end
  def details
    format_description(@description) + "site name: " + format_name
  end
end
