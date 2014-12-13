# EE 102 Final Project Report

## Folder Structure
 - Plot files are in plot folder.
 - Code and sound files are in src folder.
 	- syn.m is the code for generating plots for answering questions.
 	- play.m is the play(freq, delay, hold, totalLength) function specified in the report.
 	- piece3.m is the script we use to generate the music.
 	- music.wav is the music generated.
## Team Members
 - Yu, Mengyuan (204151211)
 - Chen, Kolya (304163713)
 - Han, Xi (504136747)

## Response to the Questions
### Problem 1
**a**. The fundamental periods of the violin and the piano are the same at around $0.00227$ seconds ($\frac{1}{440}\text{s}$).  In one period, the shapes of the instruments are very different; the violin's shape has much more ups and downs than the piano's. The overall envelope of the piano's sound dampens fast as time goes on, while the violin's amplitude of sound attenuates much slowlier. See below for their plots.
![Figure 1.1][1]
![Figure 1.2][2]
![Figure 1.3][3]
![Figure 1.4][4]

**b**.	The fundamental frequency of both the piano and the violin is the same at $440\text{Hz}$. Their largest magnitude both lies at the fundamental frequency and all other maximas are integers multiples of the fundamental frequency's magnitude. However, the amplitudes of different harmonics are different for the two instruments.

**c**. The pitch is determined by the fundamental frequency. The timbre of a sound is primarily determined by harmonics in frequency domain and shape of the waveform in time domain. Part b shows that the amplitude distribution in frequency domain are different for the violin and the piano. Therefore, they have the same pitch but different timbres. 

### Problem 2
**a**. $\frac{1}{440}\text{s}$. (See the following figure)
![Figure 2(a)][5]

**b**. We changed $f_0$ to ${880}\text{Hz}$ which made the sound become a lot higher, the plot looks slightly different because at the time domain signal the wave is compressed by half (see the following figure). The pitch, defined by fundamental frequency, is twice as high. The timbre stays the same because the shape of the waveform and the amplitude distribution on frequency domain do not change.  
![Figure 2(b)][6]

### Problem 3
**a**. The maximum number of $k$ is given by
$$Nf_0 < \frac{1}{2}F_s.$$
Then substitute in numbers, we get $N=25$.

**b**. The pitch stays the same, because the fundamental frequency did not change at $440\text{Hz}$. The timbre changes a lot, because the amplitudes of their harmonics are different, producing a different sound. The plot in both the time and frequency domain looks vastly different. In the time domain the plot looks as if we added a bunch of different sounds together. In the frequency domain, the amplitudes of each harmonic are the same, while the previous signal has only a spike at the fundamental frequency. (see the following graph)
![Figure 3][7]

### Problem 4
**a**. See the following graphs.
![Figure 4a1][8]
![Figure 4a2][9]

**b**. The filter output y(t) is shown below, called "resonated signal". The sound changes greatly. The sound in part 3 is very irritating to the ear and contains much high-frequency noise, whereas the filtered sound was very crisp and clean. The pitch stays the same due to the same fundamental frequency. The timbre is different because the waveform shape changes and the amplitudes of harmonics are different. The graphs differ greatly as well. In the time domain, the function looks smoother than that of the original sound.  In the frequency domain, the magnitudes are no longer evenly distributed among all harmonic components. Instead, the higher the frequency is, the lower the amplitude is.
![Figure 4b][10]

### Problem 5
**a**. The sound sounds a lot more natural than the ones we heard before. The pitch does not change for the fundamental frequency remains the same at $440\text{Hz}$. The timbre is similar as the shape of the waveform does not change a lot compared to the original and the amplitudes of at different frequencies also change very little. In the time domain, the shape of the waveform remains relatively the same but the amplitude is decaying very fast compared to the unenveloped signal (comparing the time domain plot above and below). In the frequency domain, the amplitude distributions look very similar, as indicated by their similar timbre.
![Figure 5a][11]

**b**. The filtered signal is shown below. In frequency domain, the frequencies higher than the fitler threshold have been eliminated as expected.
![Figure 5b][12]

### Problem 6
**a**. See the graph below.
![Figure 6a][13]

**b**. We first write the function play(freq,delay,hold,totalTime) by applying the resonator, filter and envelope in the previous questions. In this function, freq corresponds to the different notes we use, delay is the time when the corresponding note is played,  and hold is the time that the note lasts. Therefore, we can use play to generate notes of specific length at specific time, and then add them together, forming the musical piece.


  [1]: http://www.seas.ucla.edu/~xih/102/img/analysis_01.png
  [2]: http://www.seas.ucla.edu/~xih/102/img/analysis_02.png
  [3]: http://www.seas.ucla.edu/~xih/102/img/analysis_03.png
  [4]: http://www.seas.ucla.edu/~xih/102/img/analysis_04.png
  [5]: http://www.seas.ucla.edu/~xih/102/img/syn_01.png
  [6]: http://www.seas.ucla.edu/~xih/102/img/syn_02.png
  [7]: http://www.seas.ucla.edu/~xih/102/img/syn_03.png
  [8]: http://www.seas.ucla.edu/~xih/102/img/syn_04.png
  [9]: http://www.seas.ucla.edu/~xih/102/img/syn_05.png
  [10]: http://www.seas.ucla.edu/~xih/102/img/syn_07.png
  [11]: http://www.seas.ucla.edu/~xih/102/img/syn_08.png
  [12]: http://www.seas.ucla.edu/~xih/102/img/syn_09.png
  [13]: http://www.seas.ucla.edu/~xih/102/img/piece3_01.png