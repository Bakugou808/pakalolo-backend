class ApplicationController < ActionController::API
 
    def issue_token(user)
      
      JWT.encode({user_id: user.id}, ENV['SECRET'], ENV['ALG'])
    end

    def issue_token_on_signup(user)
        JWT.encode({user_id: user.id}, ENV['SECRET'], ENV['ALG'])
    end
   
    def current_user
      @user ||= User.find_by(id: user_id)
    end
  
    def token
      request.headers['Authorization']
    end
  
    def decoded_token
      begin
        JWT.decode(token, ENV['SECRET'], true, { :algorithm => ENV['ALG'] }) #Don't actually put your key here
      rescue JWT::DecodeError
        [{error: "Invalid Token"}]
      end
    end
  
    def user_id
      decoded_token.first['user_id']
    end
  
    def logged_in?
      !!current_user
    end

end
