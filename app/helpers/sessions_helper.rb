module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def log_in_dev(developer)
    session[:developer_id] = developer.id
  end
  
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end
  
  def current_dev
    if (developer_id = session[:developer_id])
      @current_dev ||= Developer.find_by(id: developer_id)
    elsif (developer_id = cookies.signed[:developer_id])
      developer = Developer.find_by(id: developer_id)
      if developer && developer.authenticated?(cookies[:remember_token])
        log_in_dev developer
        @current_dev = developer
      end
    end
  end
        
  def logged_in?
    !current_user.nil?
  end
  
  def logged_in_dev?
    !current_dev.nil?
  end
  
  # Remembers a user in a persistent session.
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
  
  def remember_dev(dev)
    dev.remember
    cookies.permanent.signed[:developer_id] = dev.id
    cookies.permanent[:remember_token] = dev.remember_token
  end
  
  
  # Forgets a persistent session.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
  
  def forget_dev(developer)
    developer.forget
    cookies.delete(:developer_id)
    cookies.delete(:remember_token)
  end
  
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
  
  def log_out_dev
    forget_dev(current_dev)
    session.delete(:developer_id)
    @current_dev = nil
  end
end

