
class File

  @@comment_chars = ["#", "\n"]
  
  # Reads a TSV file and transforms the contents to an array of hashes.
  #
  # Params:
  #
  #     :no_comment     Faster processing for files without comments
  #     :timer          Include a Util:Timer for extra output
  #
  def tabs(*params)
    timer = Util::Timer.start "parsing TSV file" if params.include?(:timer)
    rows = params.include?(:no_comments) ? to_a : to_a.select { |row| !@@comment_chars.include? row.chars.to_a[0] }
    header = rows.shift.tabs
    result = rows.map { |row| timer.tick if timer; Hash[header.zip row.tabs] }
    timer.stop if timer
    result
  end

  # Reads a two-column TSV file and returns a hash.
  #
  def tabs_map
    rows = to_a
    header = rows.shift
    header = rows.shift while @@comment_chars.include? header.chars.to_a[0]
    Hash[ rows.map { |a| a.tabs.first }.zip rows.map { |a| a.tabs.last } ]
  end

end

class String

  @@tabs = "\t"

  # Splits a tab separated string and strips the pieces.
  #
  def tabs
    split(@@tabs).map(&:strip)
  end

end
