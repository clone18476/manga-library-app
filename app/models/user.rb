class User < ActiveRecord::Base
    has_secure_password
    has_many :mangas

    validates :email, presence: true, uniqueness: true
end