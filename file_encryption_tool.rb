#! /usr/bin/env ruby
               
# Global constants
CRYPT = ARGV.first
PROMPT = ">> "

# Global variable definitions
$action, $output, $input, $recipient = ""

def guise_wat_do()
        if CRYPT.eql? "decrypt"               
                $action = "--decrypt"
        elsif CRYPT.eql? "encrypt"        
                $action = "--encrypt"     
        else             
                puts "Argument must be either 'encrypt' or 'decrypt'"                       
                exit(1)    
        end
end

def get_encrypt_input()
        puts "What is the file you would like to encrypt?"      
        print PROMPT
        $input = STDIN.gets.chomp()
        if !File.exists? $input
                puts "Input file does not exist"
                exit(1)
        end
end

def get_decrypt_input()
        puts "What is the file you want to decrypt?"
        print PROMPT
        $input = STDIN.gets.chomp()
        if !File.exists? $input
                puts "Input file does not exist"
                exit(1)
        end
end

def get_decrypt_output()
        puts "What would you like to call the decrypted file?"
        print PROMPT
        $output = STDIN.gets.chomp()
end

def get_encrypt_output()
        puts "What would you like to call the encrypted file?"
        print PROMPT
        $output = STDIN.gets.chomp()
end

def get_recipient()
        puts "Please enter the email address of the recipient of the encrypted message"
        print PROMPT
        $recipient = STDIN.gets.chomp()
end

def you_can_do_it()
        if $action.eql? "--encrypt"                
                encrypting = `gpg2 --output #{$output} #{$action} --recipient #{$recipient} #{$input}`
        elsif $action.eql? "--decrypt"
                encrypting = `gpg2 --output #{$output} #{$action} #{$input}`
#	elsif $action.eql? "--genkey"
#		encrypting = 
        else
                puts "I fucked up with my control flow and you got here. My bad."
        end
end

def gen_key()
	# FIXME
	# http://ow.ly/pxMiQ && http://ow.ly/pxMnc
	# Generating keys non-interactively is meh.
	puts "Generating a key requires some input.\
	Please answer every question followed by <ENTER>"
	File.new("tempbatch.txt", "w")
	puts "Please enter the type of key you want (RSA, DSA):"
	keytype = gets.chomp()
	puts "Please enter the length of your key (>2048 Bit please!):"
	keylength = gets.chomp()
	puts "Please enter the type of the subkey:"
	subkeytype = gets.chomp
	puts "Please enter the length of your subkey:"
	subkeylength = gets.chomp()
	puts "Please enter your name:"
	realname = gets.chomp()
	puts "Please enter your comment:"
	keycomment = gets.chomp()
	puts "Please enter your email-address:"
	mailadress = gets.chomp
	puts "Please enter a date when the key should expire:"
	expiredate = gets.chomp

end

def export_key()
	puts "This will export your public key into a ASCII-file.\n
	How do you want to call the plaintext key?"
	outputname = gets.chomp()
	puts "Which key do you want to export? (If nil then the default key
	will be exported.)"
	key_value = gets.chomp()
end

# From here on out, this is the actual execution of the program.
guise_wat_do
if $action.eql? "--encrypt"       
        get_encrypt_input
        get_encrypt_output
        get_recipient
elsif $action.eql? "--decrypt"
        get_decrypt_input
        get_decrypt_output
end
you_can_do_it
