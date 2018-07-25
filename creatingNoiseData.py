# Engineer: Dake Song
# Creating Time: 12/07/2018
# Project: Creating Noisy Data
import wave
import numpy as np
import matplotlib.pyplot as plt
import os

def traverse(f):
    fs = os.listdir(f)
    for f1 in fs:
        tem_path = os.path.join(f,f1)
        if not os.path.isdir(tem_path):
		   #Generate MLF file
           #print('"*/'+f1+'"\n'"sil\n""sp\n""sp\n""sil\n"".") 
		   #Generate list of MFCC
           #,tem_path+'1'
            print(f1)
        else:
            traverse(tmp_path)
	return f1 
path = r'C:\ALSP\SpeechData\Clean\test\clean'
traverse(path)
for f in f1:
	#Read clean speech data 
	f = wave.open(f,'rb')
	#f = wave.open(f,'rb')  #write mode
	params = f.getparams()
	nchannels, sampwidth, framerate, nframes = params[:4]
	strData = f.readframes(nframes)#read speech data in string 
	waveData = np.fromstring(strData,dtype=np.int16)#convert string to int
	waveData = waveData*1.0/(max(abs(waveData)))#wave Amplitude normalization
	#plot the waveform
	time = np.arange(0,nframes)*(1.0 / framerate)
	plt.figure(1)
	plt.subplot(311)
	plt.plot(time,waveData)
	plt.ylabel("Amplitude")
	plt.title("FAI_812A.wav Clean Waveform")
	plt.grid(True)


	#white gaussian noise function
	def wgn(x, snr):
			 snr = 10 ** (snr / 10.0)      #snr to linear scale
			 xpower = np.sum(x**2)/len(x)
			 npower = xpower/snr
			 return np.random.randn(len(x)) * np.sqrt(npower)
	#plot noisy signal SNR=10
	x = waveData
	n = wgn(x , 10.0)
	x = np.array(x)
	n = np.array(n)
	voice_withnoise10= x + n
	plt.subplot(312)
	plt.plot(time,voice_withnoise10)
	plt.ylabel("Amplitude")
	plt.title("FAI_812A.wav Noisy Waveform (SNR =10)")
	#Creating Noisy data at SNR10
	#f = Wave_write.setnframes(voice_withnoise10)


	#plot noisy signal SNR=20
	p = waveData
	m = wgn(p , 20.0)
	p = np.array(p)
	m = np.array(m)
	voice_withnoise20= p + m
	plt.subplot(313)
	plt.plot(time,voice_withnoise20)
	plt.xlabel("Time(s)")
	plt.ylabel("Amplitude")
	plt.title("FAI_812A.wav Noisy Waveform (SNR =20)")
	#Creating Noisy data at SNR20
	#f = Wave_write.setnframes(voice_withnoise20)


	#following is the energy calculation
	Ec = (1/len(waveData))*sum(waveData**2)
	snr = 10 ** (snr / 10.0)
	Nn = Ec / snr
	NoiseSigma = sqrt(Nn)
	plt.figure(2)
	plt.plot(Ec)
	plt.show()
