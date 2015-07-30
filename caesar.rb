
def generate_alphabet
  alphabets = [('A'..'Z'), ('a'..'z')]
  alphas = []
  alphabets.each do |cases|
   cases.each do |char|
      alphas  <<  char
    end
  end
  return alphas
end


def lowercase?(c)
	return c >= 'a' && c <= 'z'
end
class Caesar
	@@alpha_letters = generate_alphabet
	@@uppers = @@alpha_letters.slice(0, 25)
	@@lowers = @@alpha_letters.slice(26, -1)

	def cipher(input_string, n)
		tokenized = input_string.split("")
		shifted = tokenized.map {|letter| @@alpha_letters.include?(letter) ? @@alpha_letters[ (@@alpha_letters.find_index(letter)  + n) %  @@alpha_letters.length] : letter}
		lowercase = tokenized.map {|x| lowercase? x}
		ciphered = shifted.map.with_index {|char, i| lowercase[i]? char.downcase : char.upcase}
		return ciphered.join('')
	end
end


kaizar  = Caesar.new
puts kaizar.cipher("What a string!", 5)