class PrivateLink < Link
  def check_password(password)
    password == self.password
  end
end
