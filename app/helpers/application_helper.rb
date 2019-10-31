module ApplicationHelper
  def alert_for(flash_type){
    success: 'alert-success',
    error: 'alert-danger'
  }[flash_type.to_sym] || flash_type.to_s
  end

  def is_author? (author)
    return current_user == author ? true : false
  end
end
