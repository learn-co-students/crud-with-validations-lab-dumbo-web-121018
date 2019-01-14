class Song < ActiveRecord::Base
  validates :title, presence:true
  validate :no_repeat
  validate :year_included
  validate :year_has_occurred
  validates :artist_name, presence:true

  def no_repeat
    if Song.where(title: self.title, artist_name: self.artist_name, release_year: self.release_year).any?
      errors.add(:title, "No duplicates.")
    end
  end

  def year_included
    if self.released && self.release_year == nil
      errors.add(:release_year, "Release year needed if released.")
    end
  end

  def year_has_occurred
    @now = Date.today
    if self.release_year && @now.year < self.release_year
      errors.add(:release_year, "That year hasn't happened yet.")
    end
  end

end
