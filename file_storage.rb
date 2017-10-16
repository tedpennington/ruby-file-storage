class FileStorage
  # Initialize and create instance vars for an array and a hash
  def initialize
    puts "initialized"
    @makes_arr = Array.new
    @modles_hash = Hash.new
    @final_hash = Hash.new
  end

  
  # Takes each line and pushes into an array, chomping the nl
  def read_makes
    File.readlines("car-makes.txt").each do |line|
      @makes_arr.push(line.chomp)
    end
    # puts "@makes_arr : #{@makes_arr}"
    # return @makes_arr


  end

  # Takes each line and puts first char into key and rest into value of hash
  def read_models
    File.readlines("car-models.txt").each do |line|
      @modles_hash[line[0,1]] = line.partition('=').last.chomp
    end
    # puts "@modles_hash: #{@modles_hash.inspect}"
    # return @modles_hash
  end

  def make_hash
    read_makes
    read_models
    puts "Array: #{@makes_arr} \nHash:#{@modles_hash.inspect}"
    # Loop through makes and models, and where matching, push to final hash.
    @makes_arr.each do |make|
      @modles_hash.each do |key, value|
      if make[0,1] === key then
        # puts "if block running true"
        @final_hash[make] = value
      end
    end
  end
  puts "@final_hash: #{@final_hash.inspect}"
  end
end

my_file = FileStorage.new

my_file.make_hash