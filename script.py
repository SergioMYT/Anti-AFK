import pyautogui
import time

def press():
    try:
        pyautogui.press('f13')
    except (KeyboardInterrupt, SystemExit):
        exit(0)
    except:
        pass
    

if __name__ == '__main__': 
    try:
        while True:
            press()
            time.sleep(45)
    except (KeyboardInterrupt, SystemExit):
        exit(0)