# ASLP
automatic speech language processing

**using paython and matlab to create noisy data and calculate energy of the audio**

## creatingNoiseData

traverse all the filename of the database. For each file:

```
import matlibplot #ploting like in MATLAB
import os #traverse
import wave #audio module
```

These will generate audio file with specified SNR. 
The waveform will be plot seperately. 


## energy

this is matlab file, realise the same function described above.
Matlab provide audio.read and audio.write function to process speech file.
