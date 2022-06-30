# भाग 2: मॉडल का उपयोग करें

परीक्षित model के साथ इसे उपयोग करने के लिए हमारा ध्यान बदलने का समय है। हम इसे कस्टम विजन वेबसाइट में परीक्षण करके शुरू करेंगे। फिर हम पता लगाएंगे कि हम SDK का उपयोग करके model को कोड से कैसे कॉल कर सकते हैं।

## मॉडल का परीक्षण करें

चलो देखते हैं कि हमारा model कितना अच्छा काम करता है। उन छवियों का उपयोग करना महत्वपूर्ण है जो model को प्रशिक्षित करने के लिए उपयोग नहीं किए गए थे।आखिरकार, यदि model पहले से ही छवि को देख चुका है तो वह जवाब जानता होगा।

1. **Quick Test** चुनें 
1. **Browse local files** चुनें
1. **testing-images** पर नेविगेट करें और कुत्ते की छवियों में से एक का चयन करें
1. **Open** चुनें
1. **tag** और **probabiltiy score** पर ध्यान दें

## मॉडल प्रकाशित कारेंग

Custom Vision में एक model बनाने का लक्ष्य इसे विभिन्न अनुप्रयोगों में उपयोग करना है। Custom Vision वेबसाइट के बाहर से इसे एक्सेस करने के लिए इसे प्रकाशित करना आवश्यक है।

1. 'Performance' टैब में, **Publish** चुनें
1. **Model name** में **dogs** दर्ज करें
1. **Prediction resource** के लिए आपने पहले बनाए गए prediction कुंजी का चयन करें
1. **Publish** चुनें
1. Endpoint address देखने के लिए **Prediction URL** का चयन करें
1. **If you have an image file** के तहत ग्रे टेक्स्कोबॉक्स में मान कॉपी करें और इसे कहीं भी स्थानीय रूप से पेस्ट करें जहां आप इसे बाद में पा सकते हैं
1. **Got it** चुनें

## Obtain keys and values

किसी भी सेवा के साथ, हमें अपनी कॉल करने के लिए कुंजी और मूल्यों को इकट्ठा करने की आवश्यकता है। आप इन कुंजियों को एक टेक्स्ट फ़ाइल में कॉपी करना चाहेंगे;उनका उपयोग अगले चरण में किया जाएगा।

1. **Perforamce** स्क्रीन से, **Prediction URL** का चयन करें
1. URL को **If you have an image file** के तहत कॉपी करें;इसका उपयोग एंडपॉइंट बनाने के लिए किया जाएगा
1. **Prediction-Key** के लिए हेक्स मान की प्रतिलिपि बनाएँ। यह इस तरह का दिखाई देगा: *ba81ed4539CD46EC979A98569035A463*
1. विंडो को बंद करने के लिए **Got it** चुनें
1. Custom Vision इंटरफ़ेस के ऊपरी दाएं कोने में, सेटिंग्स के लिए **Gear** आइकन का चयन करें
1. **Project Id** का मान कॉपी करें

> टिप: **Project Id** स्क्रीन के बाईं ओर का मूल्य है।

### Endpoint value बनाएँ 

Custom Vision के लिए SDK आपके द्वारा कॉपी किए गए URL की तुलना में थोड़ा अलग URL का उपयोग करता है। आपके द्वारा कॉपी किया गया URL निम्नलिखित की तरह कुछ दिखाई देगा:

> `https://customvisionworkshop-prediction.cognitiveservices.azure.com/customvision/v3.0/Prediction/0dd3299b-6a41-40fe-ab06-dd20e886ccd4/classify/iterations/Iteration1/image`

Endpoint value बनाने के लिए, **azure.com** के बाद सबकुछ हटा दें। आपका Endpoint value इस तरह दिखना चाहिए:

> `https://customvisionworkshop-prediction.cognitiveservices.azure.com/`

## आवश्यक क्रेडेंशियल स्टोर करें

जब भी आप कोड लिख रहे हों तो किसी भी संवेदनशील मूल्यों, जैसे पासवर्ड, या कोई भी मूल्य जो बदल सकता है को कभी भी hard-code न करना एक अच्छा अभ्यास है। इससे सुरक्षा उल्लंघनों बन सकती हैं या ऐसा कोड बन सकता है जिसे सम्भालना मुश्किल हो। हमारे आवेदन को बनाने के लिए हम आम तौर पर स्वीकार्य सर्वोत्तम प्रथाओं का पालन करने जा रहे हैं। ऐसा करने के लिए हम [python_dotenv](https://github.com/theskumar/python-dotenv) नामित पुस्तकालय का उपयोग करेंगे, जो आपको टेक्स्ट फ़ाइल के साथ environment variables सेट करने की अनुमति देता है।

1. विजुअल स्टूडियो कोड पर लौटें
1. इस प्रोजेक्ट के रूट फ़ोल्डर में, **.env** नामित एक नई फ़ाइल बनाएं
1. प्लेसहोल्डर्स को बदलकर, निम्न मान जोड़ें

    ```bash
    ENDPOINT=<YOUR_ENDPOINT>
    KEY=<YOUR_PREDICTION_KEY>
    PROJECT_ID=<YOUR_PROJECT_ID>
    PUBLISHED_ITERATION_NAME=dogs
    ```

1. **File** > **Save** का चयन करके फ़ाइल को सहेजें

## पैकेज स्थापित करें

हम अपने प्रोजेक्ट का समर्थन करने के लिए दो python पैकेज का उपयोग करेंगे। पहला हमने पहले ही पेश किया है, **python-dotenv**। अगला है [Custom Vision client library (or SDK)](https://docs.microsoft.com/azure/cognitive-services/custom-vision-service/quickstarts/image-classification?tabs=visual-studio&pivots=programming-language-python&WT.mc_id=academic-49102-chrhar), जो आप भविष्यवाणियों के लिए उपयोग करेंगे।

1. **requirements.txt** नाम की एक नई फ़ाइल बनाएं
1. **requirements.txt** के अंदर, निम्न जोड़ें:

    ```bash
    python-dotenv
    azure-cognitiveservices-vision-customvision
    ```

1. **File** > **Save** का चयन करके फ़ाइल को सहेजें
1. **Terminal** > **New Terminal Window** का चयन करके विजुअल स्टूडियो कोड के अंदर एक नई टर्मिनल विंडो खोलें
1. एक नया python environment बनाएं और निम्न आदेश चलाकर संकुल को स्थापित करें:

    ```bash
    # On Windows
    python3 -m venv venv
    .\venv\Scripts\activate
    pip install -r requirements.txt

    # On Linux, WSL or macOS
    python3 -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt
    ```

1. पैकेज स्थापित हो जाएँगे।

## प्रोग्राम बनाएँ

सेटअप कार्य के साथ, यह आपका कोड जोड़ने का समय है! हम इसे कुछ वर्गों में तोड़ देंगे।

1. **predict.py** नाम की एक नई फ़ाइल बनाएं

### लाइब्रेरीज़ को आयात करें

अधिकांश python अनुप्रयोग आवश्यक लाइब्रेरीज़ को आयात करके शुरू होते हैं, और हमारा प्रोग्राम इसी पैटर्न का पालन करेगा।

1. **predict.py** के अंदर, आवश्यक लाइब्रेरीज़ को आयात करने के लिए निम्नलिखित जोड़ें:

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

### चर लोड करें

इससे पहले हम अपनी कुंजी और endpoint की तरह कुछ environment variables सेट करे थे। आइए उनको memory में लोड करें।

1.  **predict.py** के अंत में, environment variables को लोड करने के लिए निम्न कोड जोड़ें

    ```python
    # Load the key and endpoint values
    load_dotenv()
    
    # Set the values into variables
    key = os.getenv('KEY')
    endpoint = os.getenv('ENDPOINT')
    project_id = os.getenv('PROJECT_ID')
    published_name = os.getenv('PUBLISHED_ITERATION_NAME')
    ```

### भविष्यवाणी करें

अब हम अपनी भविष्यवाणी कर सकते हैं! हम परीक्षण फ़ोल्डर में छवियों में से एक का उपयोग करेंगे।

1. **predict.py** के अंत में, कुत्तों की नस्ल की भविष्यवाणी करने के लिए निम्नलिखित कोड जोड़ें

    ```python
    # Setup credentials for client
    credentials = ApiKeyCredentials(in_headers={'Prediction-key':key})
    
    # Create client, which will be used to make predictions
    client = CustomVisionPredictionClient(endpoint, credentials)
    
    # Open the test file
    with open('testing-images/american-staffordshire-terrier-10.jpg', 'rb') as image:
        # Perform the prediction
        results = client.classify_image(project_id, published_name, image.read())
    
        # Because there could be multiple predictions, we loop through each one
        for prediction in results.predictions:
            # Display the name of the breed, and the probability percentage
            print(f'{prediction.tag_name}: {(prediction.probability):.2%}')
    ```

## प्रोग्राम चलाएं

बनाए गए प्रोग्राम के साथ, चलो इसे चलाएं और देखें कि क्या होता है!

1. **File** > **Save All** का चयन करके सभी फ़ाइलों को सहेजें
1. **View** > **Terminal** का चयन करके विजुअल स्टूडियो कोड के अंदर टर्मिनल पर लौटें
1. प्रोग्राम निष्पादित करने के लिए निम्न आदेश चलाएं
    ```bash
    python predict.py
    ```

1. अब आपको निम्नलिखित आउटपुट दिखना चाहिए:

    ```bash
    american-staffordshire-terrier: 97.11%
    german-wirehaired-pointer: 1.46%
    australian-shepherd: 0.97%
    buggle: 0.46%
    shorkie: 0.00%
    ```

    > **ध्यान दें**: आपके प्रतिशत उपरोक्त प्रतिशत से बिल्कुल मेल नहीं भी खा सकते हैं

## सारांश

बधाई हो! आपने सफलतापूर्वक एक कस्टम विजन model बनाया है। आपके द्वारा बनाए गए model का उपयोग छवि प्रकारों को वर्गीकृत करने के लिए किया जा सकता है। आप किसी छवि में कुछ वस्तुओं का पता लगाने के लिए model भी बना सकते हैं। यदि आप अपने कौशल को बढ़ाना जारी रखना चाहते हैं:
- [Object detection with Custom Vision](https://docs.microsoft.com/learn/modules/detect-objects-images-custom-vision/?WT.mc_id=academic-49102-chrhar)
- [Creating custom models with TensorFlow](https://docs.microsoft.com/learn/paths/tensorflow-fundamentals/?WT.mc_id=academic-49102-chrhar)
