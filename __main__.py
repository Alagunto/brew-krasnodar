import os
import snowboydecoder


def detected_callback():
    os.system("""osascript -e 'display dialog "ПОШЁЛ НАХУЙ СО СВОИМ КРАСНОДАРОМ"' &""")
    os.system("""sleep 2 && osascript -e 'tell app "System Events" to sleep'""")


detector = snowboydecoder.HotwordDetector("krasnodar.pmdl", sensitivity=0.5, audio_gain=1)

print("Alive somewhat lmao")

detector.start(detected_callback)
