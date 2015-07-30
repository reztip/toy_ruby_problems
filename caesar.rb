
def generate_alphabet
  alphabets = [('A'..'Z'), ('a'..'z')]
  i = 0
  alphas = {}
  alphabets.each do |cases|
   cases.each do |char|
   	alphas[char] = i
   	i+=1
   end
  end
  return alphas
end

class Caesar
	@@alpha_hash = generate_alphabet

end