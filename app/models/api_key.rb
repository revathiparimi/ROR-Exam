class ApiKey < ActiveRecord::Base
	
	def generate_access_token
 	 	
 	 	begin
 	 		if (self.class.exists?(user_id: $id))
				a = self.class.where("user_id = ?", $id).first	 	   		
				a.access_token = SecureRandom.hex
				a.save!
	 	   	else
	 	   		self.class.create :access_token => SecureRandom.hex, :user_id => $id
 		   	end	
  		end while self.class.exists?(access_token: access_token)
	end

end