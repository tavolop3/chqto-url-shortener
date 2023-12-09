class EphemeralLink < Link
  def unusable?
    accesses_count >= 1
  end
end
