data = read.csv("beat_data.txt")
data = data[,1] # Take only numbers, dont need whole table
n = length(data)
time = 1:n
weigh_in = 10:n # Weigh-in vector after ~10 entries
bpm_goal = rep(80, n)

n_real = length(weigh_in)
alpha = 0.05
a = mean(data[weigh_in])
s = sqrt(var(data[weigh_in]))
error = qt(1 - alpha / 2, df=n_real-1) * s / sqrt(n_real)
lower = a - error
upper = a + error

plot(time, data, type = "l", xaxt="n", xlab="Tid", ylab="BPM", main="BPM över tid")
lines(time, bpm_goal, col="blue")

# Draw confidence interval
bottom_left = c(weigh_in[1], lower)
top_right = c(tail(vector, n=1), upper)
rect(weigh_in[1], lower, tail(weigh_in, n=1), upper, density=15, col="red")
