# AlzConnect

### Requirements for Mobile Applicaton

1. Flutter and dart installed in your system along with Android Studio
2. Dart Extension in VSCode
3. Flutter Extension in VSCode
4. Turn on the debugging mode on your mobile(preferably android device)

### Steps to run the Mobile Application

1. Run the following command in your desired folder
```sh
      flutter create appname-in-lowercase
```
2. Replace the common files provided in  [*"alzconnect_app"*](https://github.com/Khushi-M-0521/AlzConnect/alzconnect_app)  with those present in the created folder. You have to add the folder name "assets" to your folder.
3. Connect your mobile device to your created folder
4. Run the code by anyone of the following ways:
    - Run -> Run Without Debugging (or just Cntrl+F5)
    - In your terminal, under the created folder, run the following and choose your connected device. 
```sh
      flutter run
```


### Requirements for Web Application:

1. Create a virtual environment:
```sh
      python -m venv web
```
2. Install the needed dependencies:
(The python version used and recommended for this project is **3.10.11**)
```sh
      pip install flask flask-cors pymongo torch torchvision torchaudio
```

### Steps to run the Website Application

1. Add the provided(in [*"alzconnect_web"*](https://github.com/Khushi-M-0521/AlzConnect/alzconnect_web)) files/folders inside the venv folder.

2. Download the .pth file from [here](https://drive.google.com/file/d/1uIUiL-4AsnI-dMCN_JJ6tjouW2iznYx4/view?usp=drive_link) and add it under the venv folder.

3. Finally, run the flask website(in the terminal):
```sh
      python app.py
```