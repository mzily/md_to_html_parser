class Header
  attr_reader :md

  def initialize(md)
    @md = md
  end

  def to_html
    lines.map do |line|
      hashes = count_hashmarks(line)
      write_header(hashes, line)
    end.join(" ")
  end

  def lines
    md.split "\n"
  end

  def write_header(hashes, line)
    start = hashes

    if hashes > 0
      start += 1 while line[start] == " "
      "<h#{hashes}>#{line[start..-1]}</h#{hashes}>"
    else
      line
    end
  end

  def count_hashmarks(line)
    i = 0
    i += 1 while line[i] == "#"
    i
  end
end
