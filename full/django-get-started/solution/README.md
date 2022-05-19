# Running the solution

This is the solution for Getting Started with Django. To run the solution:

1. Open the folder which contains the solution in Visual Studio Code
1. Open **helloproject/settings.py**
1. Add the following to the end of **settings.py**, replacing `<RANDOM_CHARACTERS>` with random characters

    ```python
    SECRET_KEY = "<RANDOM_CHARACTERS>"
    ```

1. Save the file by selecting **File** > **Save**
1. Open a terminal window by selecting **View** > **Terminal**
1. In the terminal window, run the following code to install the packages and run the solution:

    ```bash
    # Windows
    python3 -m venv venv
    .\venv\Scripts\activate.bat
    pip install -r requirements.txt
    python manage.py runserver

    # WSL, Linux or macOS
    python3 -m venv venv
    source ./venv/bin/activate
    pip install -r requirements.txt
    python manage.py runserver    
    ```
