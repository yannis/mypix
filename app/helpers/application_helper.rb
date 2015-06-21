module ApplicationHelper
  def devise_mapping
    Devise.mappings[:user]
  end

  def resource_name
    devise_mapping.name
  end

  def resource_class
    devise_mapping.to
  end

  def submit_or_cancel_form(f, text=nil)
    link = [f.submit(text, class: 'btn btn-success')]
    link << "or"
    link << link_to("cancel", (session[:return_to].nil? ? root_path : session[:return_to]), accesskey: 'ESC', title: "Cancel #{f.object_name} form", class: "cancel #{request.format == 'application/javascript' ? 'close_div' : ''}")
    link.join(' ').html_safe
  end

  def link_to_back(default=root_path, options={})
    link = link_to('<span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span> back'.html_safe, default, options)
  end
end
