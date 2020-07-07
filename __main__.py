import os
import snowboydecoder


def detected_callback():
    print("say going down immediately")
    os.system("shutdown -s now")


detector = snowboydecoder.HotwordDetector("krasnodar.pmdl", sensitivity=0.5, audio_gain=1)

detector.start(detected_callback)
