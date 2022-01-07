# Βήμα 2: Χρήση του μοντέλου

Με το μοντέλο εκπαιδευμένο ήρθε η ώρα να το χρησιμοποιήσουμε. Θα ξεκινήσουμε δοκιμάζοντάς το από την ιστοσελίδα του Custom Vision. Έπειτα, θα εξερευνήσουμε πώς μπορούμε να καλέσουμε το μοντέλο μέσω κώδικα χρησιμοποιώντας ένα SDK.

## Δοκιμή του μοντέλου

Ας δούμε πώς δουλεύει το μοντέλο. Είναι σημαντικό να χρησιμοποιήσουμε εικόνες που δεν είχαν χρησιμοποιηθεί κατά την εκπαίδευση του μοντέλου. Εξάλλου, αν το μοντέλο έχει ήδη δει την εικόνα είναι λογικό να ξέρει την απάντηση.

1. Επιλέξτε **Quick Test**
1. Επιλέξτε **Browse local files**
1. Πηγαίντε στον φάκελο **testing-images** και επιλέξτε μία από τις φωτογραφίες σκύλων
1. Επιλέξτε **Open**
1. Παρατηρήστε τα σκορ **tag** & **probability** 

## Δημοσίευση του μοντέλου

Ο σκοπός της δημιουργίας ενός μοντέλου στο Custom Vision είναι να το χρησιμοποιήσετε σε διάφορες εφαρμογές. Για να έχετε πρόσβαση σε αυτό εκτός της ιστοσελίδας του Custom Vision πρέπει να το κάνετε δημόσιο.

1. Στην καρτέλα 'Performance', επιλέξτε **Publish**
1. Στο **Model name** εισάγετε **dogs**
1. Στο **Prediction resource** επιλέξτε το κλειδί πρόβλεψης (prediction key) που δημιουργήσατε νωρίτερα.
1. Επιλέξτε **Publish**
1. Επιλέξτε **Prediction URL** για να δείτε την διεύθυνση endpoint
1. Αντιγράψτε την τιμή στό γκρι πλαίσιο κάτω από το **If you have an image file** και κάντε το επικόλληση κάπου τοπικά ώστε να μπορείτε να το βρείτε αργότερα
1. Επιλέξτε **Got it**

## Αποκτήστε κλειδιά και τιμές

Όπως σε κάθε υπηρεσία, θα πρέπει να συγκεντρώσετε τα κλειδιά και τις τιμές για να κάνουμε την κλήση του μοντέλου. Θα πρέπει να αντιγράψετε αυτά τα κλειδιά σε ένα αρχείο κειμένου, καθώς θα τα χρειαστείτε σε λίγο

1. Στην οθόνη **Performance**, επιλέξτε **Prediction URL**
1. Αντιγράψτε τον σύνδεσμο κάτω από το **If you have an image file**: αυτό θα χρειαστεί στη δημιουργία του endpoint.
1. Αντιγράψτε την δεκαεξαδική τιμή **Prediction-Key**. Θα μοιάζει με: *ba81ed4539cd46ec979a98569035a463*
1. Επιλέξτε **Got it** για να κλείσετε το παράθυρο 
1. Στο πάνω δεξιά μέρος της οθόνης, επιλέξτε το **Γρανάζι** για να μπείτε στις ρυθμίσεις
1. Αντιγράψτε την τιμή **Project Id** 

> Συμβουλή: Το **Project Id** είναι η τιμή στο αριστερό μέρος της οθόνης

### Δημιουργία του endpoint

Το SDK για το Custom Vision χρησιμοποιεί ένα λίγο διαφορετικό URL από αυτό που αντιγράψατε προηγουμένως. Το URL που αντιγράψατε θα μοιάζει με το παρακάτω:

> `https://customvisionworkshop-prediction.cognitiveservices.azure.com/customvision/v3.0/Prediction/0dd3299b-6a41-40fe-ab06-dd20e886ccd4/classify/iterations/Iteration1/image`

Για να δημιουργήσετε το endpoint, σβήστε τα πάντα μετά το **azure.com**. Τώρα το endpoint θα μοιάζει κάπως έτσι:

> `https://customvisionworkshop-prediction.cognitiveservices.azure.com/`

## Αποθήκευση των απαραίτητων διαπιστευτηρίων

Όταν γράφετε κώδικα, η καλύτερη πρακτική είναι να μην γράφετε μέσα στον κώδικα ευαίσθητες πληροφορίες, όπως κωδικούς, ή τιμές που ενδεχομένως θα αλλάξουν στο μέλλον. Αυτό μπορεί να οδηγήσει σε κενά ασφαλείας ή σε κομμάτια κώδικα που θα είναι δύσκολα στην συντήρηση. Στην δημιουργία της εφαρμογής μας θα ακολουθήσουμε τις κοινώς αποδεκτές τακτικές. Για να το πετύχουμε αυτό, θα χρησιμοποιήσουμε τη βιβλιοθήκη [python_dotenv](https://github.com/theskumar/python-dotenv), που σας επιτρέπει να χρησιμοποιήσετε μεταβλητές πριβάλλοντας από ένα αρχείο κειμένου.

1. Επιστρέψτε στο Visual Studio Code
1. Στον ριζικό φάκελο του project, δημιουργήστε ένα νέο αρχείο με το όνομα **.env**
1. Εισάγετε τις ακόλουθες τιμές, αντικαθιστώντας τις τιμές στα εισαγωτικά

    ```bash
    ENDPOINT=<YOUR_ENDPOINT>
    KEY=<YOUR_PREDICTION_KEY>
    PROJECT_ID=<YOUR_PROJECT_ID>
    PUBLISHED_ITERATION_NAME=dogs
    ```

1. Αποθηκεύστε το αρχείο επιλέγοντας **File** > **Save** (ή με Ctrl + S)

## Εγκατάσταση των πακέτων

Θα χρησιμοποιήσουμε 2 πακέτα Python στο project μας. Το πρώτο που έχετε ήδη δει, είναι το **python-dotenv**. Το δεύτερο είναι το [Custom Vision client library (ή SDK)](https://docs.microsoft.com/azure/cognitive-services/custom-vision-service/quickstarts/image-classification?tabs=visual-studio&pivots=programming-language-python&WT.mc_id=academic-49102-chrhar), που θα χρησιμοποιήσετε για να κάνετε τις προβλέψεις.

1. Δημιουργήστε ένα νέο αρχείο κειμένου με όνομα **requirements.txt**
1. Μέσα στο **requirements.txt**, προσθέστε τα ακόλουθα:

    ```bash
    python-dotenv
    azure-cognitiveservices-vision-customvision
    ```

1. Αποθηκεύστε το αρχείο επιλέγοντας **File** > **Save**
1. Ανοίξτε ένα νέο τερματικό μέσα στο Visual Studio Code επιλέγοντας **Terminal** > **New Terminal Window**
1. Δημιουργήστε ένα νέο περιβάλλον Python και εγκαταστήστε τα ακόλουθα πακέτα με την ακόλουθη εντολή:

    ```bash
    # Στα Windows
    python3 -m venv venv
    .\venv\Scripts\activate
    pip install -r requirements.txt

    # Στα Linux, WSL & macOS
    python3 -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt
    ```

1. Θα πραγματοποιηθεί εγκατάσταση των πακέτων

## Δημιουργία του προγράμματος

Με όλη την διαδικασία της εγκατάστασης να έχει ολοκληρωθεί, ήρθε η ώρα να γράψετε κώδικα! Θα σπάσουμε την διαδικασία σε μερικά κομμάτια.

- Δημιουργήστε ένα νέο αρχείο με όνομα **predict.py**

### Import the libraries

Όπως και οι περισσότερες εφαρμογές Python εκκινούν με την εισαγωγή των απαραίτητων βιβλιοθηκών, έτσι και η δική μας θα ακολουθήσει το ίδιο μοτίβο.

- Μέσα στο **predict.py**, προσθέστε τον παρακάτω κώδικα για να εισάγετε τις απαραίτητες βιβλιοθήκες:

    ```python
    # Prediction client
    from azure.cognitiveservices.vision.customvision.prediction import CustomVisionPredictionClient
    # Key class for azure
    from msrest.authentication import ApiKeyCredentials
    # dotenv to load key
    from dotenv import load_dotenv
    # Import os to read environment variables
    import os
    ```

### Φορτώστε τις μεταβλητές

Προηγουμένως, δημιουργήσαμε κάποιες μεταβλητές περιβάλλοντος όπως το κλειδί και το endpoint. Ας τις φορτώσουμε στην μνήμη.

- Στο τέλος του **predict.py**, προσθέστε το ακόλουθο κομμάτι κώδικα για να φορτώσετε τις μεταβλητές περιβάλλοντος.

    ```python
    # Φόρτωση των μεταβλητών περιβάλλοντος
    load_dotenv()
    
    # Ανάθεση των τιμών στις μεταβλητές
    key = os.getenv('KEY')
    endpoint = os.getenv('ENDPOINT')
    project_id = os.getenv('PROJECT_ID')
    published_name = os.getenv('PUBLISHED_ITERATION_NAME')
    ```

### Εκτέλεση της πρόβλεψης

Πλέον μπορούμε να προχωρήσουμε στην πρόβλεψη! Θα χρησιμοποιήσουμε μία από τις εικόνες στον φάκελο testing-images.

- Στο τέλος του **predict.py**, προσθέστε τον ακόλουθο κώδικα για να εκτελέσετε την πρόβλεψη της ράτσας του σκύλου

    ```python
    # Setup credentials for client
    credentials = ApiKeyCredentials(in_headers={'Prediction-key':key})
    
    # Create client, which will be used to make predictions
    client = CustomVisionPredictionClient(endpoint, credentials)
    
    # Άνοιγμα του test file
    with open('testing-images/american-staffordshire-terrier-10.jpg', 'rb') as image:
        # Perform the prediction
        results = client.classify_image(project_id, published_name, image.read())
    
        # Because there could be multiple predictions, we loop through each one
        for prediction in results.predictions:
            # Display the name of the breed, and the probability percentage
            print(f'{prediction.tag_name}: {(prediction.probability):.2%}')
    ```

## Εκτέλεση του προγράμματος

Αφού δημιουργήσαμε το πρόγραμμα, ας το τρέξουμε να δούμε τι συμβαίνει!

1. Αποθηκεύστε όλα τα αρχεία επιλέγοντας **File** > **Save All**
1. Επιστρέψτε στο τερματικό εντός του Visual Studio Code επιλέγοντας **View** > **Terminal**
1. Τρέξτε την ακόλουθη εντολή για να εκτελέσετε το πρόγραμμα

    ```bash
    python predict.py
    ```

1. Τώρα θα πρέπει να δείτε το ακόλουθο αποτέλεσμα:

    ```bash
    american-staffordshire-terrier: 97.11%
    german-wirehaired-pointer: 1.46%
    australian-shepherd: 0.97%
    buggle: 0.46%
    shorkie: 0.00%
    ```

    > **Σημείωση**: Τα ποσοστά μπορεί να διαφέρουν από τα παραπάνω

## Σύνοψη

Συγχαρητήρια! Έχετε δημιουργήσει επιτυχώς ένα μοντέλο Custom Vision. Το μοντέλο που έχετε δημιουργήσει μπορεί να χρησιμοποιηθεί για την κατηγοριοποίηση εικόνων. Μπορείτε επίσης να δημιουργήσετε μοντέλα για να ανιχνεύσετε συγκεκριμένα αντικείμενα σε μία εικόνα. Αν θέλετε να εξελιχθείτε περαιτέρω:

- [Ανίχνευση αντικειμένων με το Custom Vision](https://docs.microsoft.com/learn/modules/detect-objects-images-custom-vision/?WT.mc_id=academic-49102-chrhar)
- [Δημιουργία προσαρμοσμένων μοντέλων με το TensorFlow](https://docs.microsoft.com/learn/paths/tensorflow-fundamentals/?WT.mc_id=academic-49102-chrhar)
