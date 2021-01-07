module ApplicationHelper
  def article_color(word)
    case
    when word.article_der? 
      "badge-danger"
    when word.article_die? 
      "badge-success"
    when word.article_das? 
      "badge-warning"
    else
      ""
    end
  end
end
