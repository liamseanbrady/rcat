module RCat
  class Application
    def initialize(argv)
      @params, @files = parse_options(argv)
      @display = RCat::Display.new(@params)
    end

    def run
      if @files.empty?
        @display.render(STDIN)
      else
        @files.each do |filename|
          File.open(filename) { |f| @display.render(f) }
        end
      end
    end

    def parse_options(argv)
      # ignore for now
    end
  end
end