lowpass = function(freq, R, C) {
  R_sq = R * R
  C_sq = C * C
  omega = 2 * pi * freq
  omega_sq = omega * omega
  
  return(1 / sqrt(1 + omega_sq * R_sq * C_sq))
}

highpass = function(freq, R, C) {
  R_sq = R * R
  C_sq = C * C
  omega = 2 * pi * freq
  omega_sq = omega * omega
  
  return(omega * R * C / sqrt(1 + omega_sq * R_sq * C_sq))
}

R_high = 150 * 10 ^ (3)
C_high = 10 * 10 ^ (-9)

R_low = 560 * 10 ^ (3)
C_low = 1 * 10 ^ (-9)

freqs = 1:5000

high_amp = highpass(freqs, R_high, C_high)
low_amp = lowpass(freqs, R_low, C_low)

layout(matrix(c(1, 1, 2, 3), 2, 2, byrow = TRUE))
plot(freqs, high_amp * low_amp, type = "l", main="Bandpass-filter", xlab="Frekvens (Hz)", ylab="Förstärkning")
plot(freqs, high_amp, type = "l", main="Högpass-filter", xlab="Frekvens (Hz)", ylab="Förstärkning")
plot(freqs, low_amp, type = "l", main="Låspass-filter", xlab="Frekvens (Hz)", ylab="Förstärkning")