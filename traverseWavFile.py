import os


def traverse(f):
    fs = os.listdir(f)
    for f1 in fs:
        tem_path = os.path.join(f,f1)
        if not os.path.isdir(tem_path):
            #print('"*/'+f1+'"\n'"sil\n""sp\n""sp\n""sil\n"".")
           #,tem_path+'1'
            print(f1)
        else:
            traverse(tmp_path)


path = r'C:\ALSP\SpeechData123qaz\Clean\test\clean'
traverse(path)

wewewe87
