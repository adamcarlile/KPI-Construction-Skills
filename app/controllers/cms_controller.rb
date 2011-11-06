require_dependency File.join('vendor/plugins/cms-engine/app/controllers/cms_controller')
class CMSController < ActionController::Base
  
  def url_for_page(page, extra_params = {})
    case page
      when Homepage
        view_page_url_with_extra_path_params(page, extra_params)
      when Hyperlink
        page.url
      when Folder
        view_page_url_with_extra_path_params(page.children.first, extra_params)
      else
        view_page_url_with_extra_path_params(page, extra_params)
    end
  end
  helper_method :url_for_page
  
end