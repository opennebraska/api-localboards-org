module DashboardHelper
  def api_key
    if current_user
      "<a href='/api_keys'>Edit/View/Create My Keys</a>".html_safe
    else
      "<a href='/users/sign_up'>Request A Key</a>".html_safe
    end
  end 
end
