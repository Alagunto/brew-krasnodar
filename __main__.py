import os
import snowboydecoder


def detected_callback():
    os.system("""osascript -e 'display dialog "ПОШЁЛ НАХУЙ СО СВОИМ КРАСНОДАРОМ"' &""")
    os.system("""sleep 2 && pmset sleepnow && osascript -e 'display dialog "ОБОСРАЛСЯ? ЭТО КРАСНОДАР."'""")


detector = snowboydecoder.HotwordDetector("krasnodar.pmdl", sensitivity=0.5, audio_gain=1)

print("Привет, друг. Скажи вслух слово 'Краснодар'.")

detector.start(detected_callback)
