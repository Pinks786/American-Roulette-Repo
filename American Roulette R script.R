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
#What is the probability that you end up winning money if you bet on green 100 times?
n<- 100
X<- sample(c(17,-1),n,replace=TRUE,prob=c(p_green,p_not_green))
avg<-n*(17*p_green+(-1)*p_not_green)
avg
se<- sqrt(n)* abs(17-(-1))*sqrt(p_green*p_not_green)
se
1-pnorm(0,avg,se)
#Create a Monte Carlo simulation that generates 10,000 outcomes of , the sum of 100 bets. 
B<-100000
set.seed(1)
S <- replicate(B,{
  X<-sample(c(17,-1),n,replace=TRUE,prob=c(p_green,p_not_green))
  sum(X)
})
mean(S)
sd(S)
# Calculate the proportion of outcomes in the vector `S` that exceed $0
mean(S>0)

#Now create a random variable that contains your average winnings per bet after betting on green 10,000 times.
B<- 10000
n<1000
X<- sample(c(17,-1),n,replace=TRUE,prob=c(p_green,p_not_green))
mean(X)

# Create a vector called `X` that contains the outcomes of `n` bets
n<- 10000
X<- sample(c(17,-1),n,replace=TRUE,prob=c(p_green,p_not_green))
X[1:10]
#a random variable that contains your average winnings per bet after betting on green 10,000 times.
Y<- mean(X)
Y 
#What is the expected value of , the average outcome per bet after betting on green 10,000 times?
(17*(p_green))+((-1)*(p_not_green))
(abs(17-(-1))*sqrt(p_green*p_not_green))/sqrt(n)
# Given this average and standard error, determine the probability of winning more than $0. Print the result to the console.
1-pnorm(0,avg,se)
