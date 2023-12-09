class TemporalLink < Link
  def expired?
    DateTime.now.utc.after? expiration_date
  end
end
