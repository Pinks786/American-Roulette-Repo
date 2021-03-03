#The variables contain the number of pockets for each color.

green<- 2
black<- 18
red<- 18

#Chances that the ball lands in a green pocket
p_green<- p_green<- green/(green+black+red)
p_green
set.seed(1)
#the probability of the ball not landing in a green pocket
p_not_green <- 1-p_green
p_not_green

# In American roulette, the payout for winning on green is $17.
#This means that if you bet $1 and it lands on green, you get $17 as a prize.Create a model to predict the random variable `X`, your winnings from betting on green. Sample one time.
n=1
X<- sample(c(16,-1),n,prob=c(p_green,p_not_green))
# Print the value of `X` to the console
X
#Expected outcome of a bet that the ball will land in a green pocket
mu<- 17 * (p_green) + (-1)* (p_not_green)
mu
#The standard error of a random variable tells us the difference between a random variable and its expected value.
se<- abs(17-(-1))*sqrt((p_green)*(p_not_green))
se
#Now create a random variable that sums your winnings after betting on green 1,000 times.
set.seed(1)
n<- 1000
X<- sample(c(17,-1),n,replace=TRUE,prob=c(p_green,p_not_green))
S<- sum(X)
S

#Calculate the expected outcome of 1,000 spins if you win $17 when the ball lands on green and you lose $1 when the ball doesn't land on green
expected_S <- n*(17 * p_green +(-1)* (p_not_green))
expected_S
expected_S <- n*mu
expected_S
se_S<- sqrt(n)*se
se_S
