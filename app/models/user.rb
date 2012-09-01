class User < ActiveRecord::Base
    attr_accessible :email, :login, :name, :password, :password_confirmation, :autologin

    validates :name, :length => { :in => 5..40 }, :presence => true

    validates :login, :length => { :in => 5..40 }, :presence => true

    validates :password, :length => { :in => 8..40 }, :presence => true
    validates :password, :confirmation => true
    validates :password_confirmation, :presence => true

    validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, :uniqueness => true, :presence => true


    def self.encrypt(password)
        Digest::SHA1.hexdigest(password)
    end

    def self.authenticate(login, password)
        user = User.where(:login => login, :password => password)
        if user.nil? 
            return user
        else
            return user.first
        end
    end
end
