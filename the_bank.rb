# Create a class to structure our account data
class Account
	attr_accessor :name, :balance
	attr_reader :account_number

	def initialize(name, account_number, balance)
		@name = name
		@account_number = account_number
		@balance = balance
	end
	
	def deposit(amount)
		@balance += amount
	end	

	def withdrawal(amount)
		if amount > @balance
			return false
		else 
			@balance -= amount
			return true
		end		

	end	

end	




def main_menu

		if @count < 3
			puts "Welcome to Creighton Bank!"
			puts "Please choose from the following:"
			puts "---------------------------------"
			puts "1. Add a new account"
			puts "2. View an existing account"
			puts "3. Exit the System"


			option = gets.chomp.to_i

			if option == 1
				add_account
			elsif option == 2
				@count = 0
			 view_account	
			elsif option == 3
				puts "Thank you for stopping by!"
				exit
			else	

				if @count != 2
					puts "Please make a valid selection"
				end
				@count +=1
				main_menu
			end		
		else
			puts "You seem to be having trouble.  Please contact customer service."
			exit	
		end	

end	

def add_account
	puts "Please enter the name of the account holder: "
	name = gets.chomp.upcase
	puts "Enter the starting balance:"
	balance = gets.chomp.to_f
	account_number = @accounts.length

	new_account = Account.new(name,account_number,balance)

	@accounts.push(new_account)

	puts "Account Created!"
	puts "Name: #{new_account.name}"
	puts "Account Number: #{new_account.account_number}"
	puts "Balance: #{'%.2f' % (new_account.balance)}"

	main_menu
end



def view_account

	puts "Welcome to the Accounts Menu.  Please login!"
	puts "Please enter the name on the account: "
	name = gets.chomp.upcase
	puts "Please enter the account number: "
	account_number = gets.chomp.to_i
 
	found = false
	balance = 0

 	if @count < 3	
		@accounts.each do |a|
			if a.name == name  && a.account_number == account_number
				balance = a.balance
				found = true
			end	
		end	

			if found == false
				puts	"That account is not found, please try again."
				@count +=1
				view_account
			else
				@count = 0	
				accounts_menu(name,account_number,balance)
			end	
	else
		main_menu
	end			

end





def accounts_menu(name,account_number,balance)

	if @count < 3	
		puts "Welcome to your account, #{name}! "
		puts "Please choose from an option below:"
		puts "------------------------------------"
		puts "1. View balance"
		puts "2. Make a deposit"
		puts "3. Make a withdrawal"
		puts "4. Back to main menu"

		option = gets.chomp.to_i

		if option == 1
			puts "Your current balance is #{'%.2f' % (balance)}"
			accounts_menu(name,account_number,balance) 
		elsif option == 2
			make_deposit(name, account_number)
		elsif option == 3
			@count = 0
			make_withdrawal(name, account_number)
		elsif option == 4
		 main_menu	
		else
			if @count != 2
				puts "Not a valid option.  Please try again."
			end
			@count +=1
			accounts_menu(name,account_number,balance) 
		end	
	else
		main_menu
	end	
							
end	

def make_deposit(name, account_number)
	puts "How much would you like to deposit?"
	amount = gets.chomp.to_f

	balance = 0
	@accounts.each do |a|
		if a.name == name && a.account_number == account_number
			a.deposit(amount)
			balance = a.balance

		end	
	end	

	puts "Your deposit of #{amount} has been made.  Your new balance is #{balance}."
	accounts_menu(name,account_number,balance)

end	

def make_withdrawal(name, account_number)

	if @count < 3	
		puts "How much would you like to withdraw?"
		amount = gets.chomp.to_f

		balance = 0
		withdraw = false

		@accounts.each do |a|
			if a.name == name && a.account_number == account_number
				withdraw = a.withdrawal(amount)
				balance = a.balance
			end	
		end 
		
		if withdraw == false
			if @count !=2 
				puts "Insufficient funds. Your balance of #{balance} is less than your withdrawal amount of #{amount}. Please try again."
			end
				@count +=1
				make_withdrawal(name, account_number)	

		else
			puts "Your withdrawal of #{amount} has been made. Your new balance is #{balance}."
			accounts_menu(name,account_number,balance)
		end	
	else 
		main_menu	
	end	

end	



#--------------------------------------------------------------#
#Begin our program

@accounts =[]

system('clear')
@count = 0
main_menu