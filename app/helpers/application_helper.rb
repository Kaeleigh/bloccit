module ApplicationHelper
  #method defined with two arguments (array of errors and block)
  def form_group_tag(errors, &block)
    css_class = 'form-group'
    css_class << ' has-error'if errors.any?
  #helper method called, builds HTML/CSS to display form element
    content_tag :div, capture(&block), class: css_class
  end

  def avatar_url(user)
     gravatar_id = Digest::MD5::hexdigest(user.email).downcase
     "http://gravatar.com/avatar/#{gravatar_id}.png?s=48"
  end
end
