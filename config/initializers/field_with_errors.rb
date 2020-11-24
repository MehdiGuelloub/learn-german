 ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  if html_tag =~ /^<label/
    # div around label screws up styles, so don't add it.
    html_tag
  else
    # default behavior
    "<div class=\"field_with_errors\">#{html_tag}</div>".html_safe
  end
end
