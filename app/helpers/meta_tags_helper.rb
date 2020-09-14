# get meta tags
module MetaTagsHelper
    # get meta title
    def meta_title
      content_for?(:meta_title) ? content_for(:meta_title) : DEFAULT_META["meta_title"]
    end
    # geta meta description
    def meta_description
      content_for?(:meta_description) ? content_for(:meta_description) : DEFAULT_META["meta_description"]
    end
    # get meta image  
    def meta_image
      meta_image = (content_for?(:meta_image) ? content_for(:meta_image) : DEFAULT_META["meta_image"])
      # works even with url
      meta_image.starts_with?("http") ? meta_image : image_url(meta_image)
    end
end