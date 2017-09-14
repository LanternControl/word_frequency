require 'pry'

class Wordfreq
  STOP_WORDS = ['a', 'an', 'and', 'are', 'as', 'at', 'be', 'by', 'for', 'from',
    'has', 'he', 'i', 'in', 'is', 'it', 'its', 'of', 'on', 'that', 'the', 'to',
    'were', 'will', 'with']

  def initialize(filename)

    @@diction = File.read(filename).downcase.gsub(/[^a-z0-9\s]/i, ' ').split(' ') - STOP_WORDS
    @@new_array  = Hash.new 0
    # ^^^^ cleaned this up
    # @@diction = @@diction - STOP_WORDS
    # diction.delete_if {|word| STOP_WORDS.include?(word)}
    @@diction.each do |word|
          if word != '' then @@new_array[word] += 1
          end
          @@ordered_results = @@new_array.sort_by{|keys, values| values}.reverse
        end
  end

  def frequency(word)
    @@diction.count(word)

  end

  def frequencies
    @@new_array

  end

  def top_words(number)
    @@ordered_results.first(number)
  end

  def print_report

  end
end
end

if __FILE__ == $0
  filename = ARGV[0]
  if filename
    full_filename = File.absolute_path(filename)
    if File.exists?(full_filename)
      wf = Wordfreq.new(full_filename)
      wf.print_report
    else
      puts "#{filename} does not exist!"
    end
  else
    puts "Please give a filename as an argument."
  end

end
