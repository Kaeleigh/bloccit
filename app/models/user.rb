class User < ApplicationRecord
  #register inline callback
  before_save { self.email = email.downcase if email.present? }
  before_save :name_formatting

 # #validation func ensures name is present, max and min length
   validates :name, length: { minimum: 1, maximum: 100 }, presence: true
 # #validates password
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true
 # #validate email is present, unique, case insensitive, proper length
   validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 254 }

 # #sets and authenticates password
   has_secure_password

   def name_formatting
     if name
       formatted_name = []
       name.split.each do |letter|
         formatted_name << letter.capitalize
       end
       self.name = formatted_name.join(" ")
     end
   end
# ends the class   
end
