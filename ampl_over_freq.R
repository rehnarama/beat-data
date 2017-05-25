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

freqs = 1:20000

high_amp = highpass(freqs, R_high, C_high)
low_amp = lowpass(freqs, R_low, C_low)

high_freq = 100
low_freq = 300

band_amp_lower = high_amp[high_freq] * low_amp[high_freq]
band_amp_upper = low_amp[low_freq] * high_amp[low_freq]

layout(matrix(c(1, 1, 2, 3), 2, 2, byrow = TRUE))

plot(freqs, high_amp * low_amp, type = "l", main="Bandpass-filter", xlab="Frekvens (Hz)", ylab="F�rst�rkning", log="x")
lines(c(high_freq, high_freq), c(0, band_amp_lower), col="blue") # Highlight switch frequencies
lines(c(low_freq, low_freq), c(0, band_amp_upper), col="blue") # Highlist switch frequencies
axis(1, at=high_freq) # Make sure label is drawn at switch frequency
axis(1, at=low_freq) # Make sure label is drawn at switch frequency

plot(freqs, high_amp, type = "l", main="H�gpass-filter", xlab="Frekvens (Hz)", ylab="F�rst�rkning", log="x")
lines(c(high_freq, high_freq), c(0, high_amp[high_freq]), col="blue") # Highlight switch frequencies
axis(1, at=high_freq) # Make sure label is drawn at switch frequency

plot(freqs, low_amp, type = "l", main="L�gpass-filter", xlab="Frekvens (Hz)", ylab="F�rst�rkning", log="x")
lines(c(low_freq, low_freq), c(0, low_amp[low_freq]), col="blue") # Highlist switch frequencies
axis(1, at=low_freq) # Make sure label is drawn at switch frequency