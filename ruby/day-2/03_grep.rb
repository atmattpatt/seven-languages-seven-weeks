class Grep
  def initialize(pattern)
    @pattern = Regexp.new(pattern)
  end

  def print_results
    files_matched = []

    hl = "\033[1;36m"
    bold = "\033[1m"
    reset = "\033[0m"

    ARGF.each_line do |line|
      if @pattern =~ line
        unless files_matched.include?(ARGF.filename)
          files_matched << ARGF.filename
          puts "#{bold}File:#{reset} #{ARGF.filename}"
        end

        colored = line.sub(@pattern) { |match| "#{hl}#{match}#{reset}" }

        puts "#{ARGF.lineno} : #{colored}"
      end
    end
  end
end

Grep.new(ARGV.shift).print_results
