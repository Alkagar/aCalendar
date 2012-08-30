class User < ActiveRecord::Base
    attr_accessible :email, :login, :name, :password

    validates :name, :password, :email, :presence => true
    validates :name, :length => { :in => 5..40 }
    validates :login, :length => { :in => 5..40 }
    validates :password, :length => { :in => 8..40 } 
    validates :email, :uniqueness => true
    validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

    def self.encrypt(password)
        Digest::SHA1.hexdigest(password)
    end

    def hashed_password=(password)
        self.password = User.encrypt(password)
    end

    def self.authenticate(login, password)
        user = find(:first, :conditions=>["login = ?", login])
        return nil if user.nil?
        return user if User.encrypt(password) == user.password
        nil
    end
end

