module NavigationHelper
  
  def render_global_nav
    pages = Page.find_by_title('Global nav').published_children_for_nav
    list_items = pages.map do |page|
      css_classes = []
      css_classes << 'first' if page == pages.first
      css_classes << 'last' if page == pages.last
      if page == @root_page
        css_classes << "current"
      end
      css_class = css_classes.join(' ') unless css_classes.empty?
      
      nav_content = content_tag(:span, h(page.nav_title), :class => 'title') + content_tag(:span, truncate(page.nav_subtitle, :length => 80), :class => 'subtitle')
      
      if page.nav_dropdown_partial
        content_tag('li', link_to(nav_content, url_for_page(page), :class => 'subnav-link') + render(:partial => page.nav_dropdown_partial, :locals => {:page => page}), :class => css_class)
      else
        content_tag('li', link_to(nav_content, url_for_page(page)), :class => css_class)
      end
    end
    content_tag('nav',content_tag('ul', "\n#{list_items.join("\n")}\n"), :id => "main-navigation")
  end

  def render_list_nav(parent = Page.find_by_title('Global nav'), depth = 1)
    return '' if parent.children_restricted? and !logged_in?
    pages = parent.published_children_for_nav
    return '' if pages.empty?
    list_items = pages.map do |page|
      current = @root_page == page || @page == page || (@page and @page.ancestors.include?(page) and !@page.top_level?)
      open = (current and page.published_children_for_nav.length > 0 and !page.archive?)      
      
      css_classes = []
      css_classes << 'current' if current
      css_classes << 'withsubnav' if open
      css_classes << 'last' if page == pages.last
      css_class = css_classes.join(' ') unless css_classes.empty?

      item_contents = link_to_page(page)
      if !page.children_restricted? or logged_in?
        item_contents << render_list_nav(page, depth+1) if open
      end
      '  '*depth + content_tag('li', item_contents, :class => css_class)
    end
    content_tag('ul', "\n#{list_items.join("\n")}\n", :class => "open-subnav")
  end
  
  def render_footer_nav
    pages = Page.find_by_title('Footer nav').published_children_for_nav
    list_items = pages.map do |page|
    content_tag('li', link_to(content_tag('span',h(page.nav_title)),url_for_page(page)))
    end
    content_tag('nav',content_tag('ul', "\n#{list_items.join('')}\n", :class => "clearfix"), :id => "footer_nav", :class => "clearfix")
  end

  def render_site_map(pages = Page.find_by_title('Global nav').published_children_for_nav, depth = 1)
    list_items = []
    pages.each do |page|
      html = link_to(page.nav_title, "/"+page.slug_path)
      if !page.archive? and page.published_children_for_nav.length > 0
        html << render_site_map(page.published_children_for_nav, depth + 1)
      end
      list_items << content_tag('li',html, :id => page.slug)
    end
    content_tag('ul', list_items.join("\n"), :id => (depth == 1 ? 'primaryNav' : nil))
  end
  
  def link_to_page(page, prefix = '')
    link_to(prefix + h(page.nav_title), url_for_page(page))
  end
  
  def page_list_item(page)
    content_tag('li', link_to_page(page), :class => (@page == page ? 'current' : nil))
  end

  def render_breadcrumb
    return '' if breadcrumbs.empty?
    elements = breadcrumbs.map do |crumb|
      if crumb.second
        link_to(crumb.first, crumb.second)
      else
        content_tag(:span, crumb.first)
      end
    end
  	content_tag(:nav, elements.join(''), :id => 'breadcrumb')
  end
      
end
