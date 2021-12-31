# भाग ०: उपकरण को स्थापित और कॉन्फ़िगर करना

किसी भी परियोजना के साथ, कुछ उपकरणों की आवश्यकता होगी। विशेष रूप से आपको एक कोड संपादक, एक Azure अंशदान, और Custom Vision के लिए कुछ कुंजियों की आवश्यकता होगी।

## संपादक स्थापित करना

Visual Studio Code एक open source कोड संपादक है जिसका उपयोग किसी भी प्रोग्रामिंग भाषा के साथ लगभग किसी भी परियोजना प्रकार को बनाने के लिए किया जा सकता है। यदि आपके पास पहले से ही Visual Studio Code स्थापित नहीं है, तो आप इसे यहाँ जाके स्थापित कर सकते हैं। [code.visualstudio.com](https://code.visualstudio.com)
आपको [Pylance extension](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance) की भी आवश्यकता होगी जो Python लिखते समय अतिरिक्त कार्यक्षमता प्रदान करेगा।

## शुरुआती परियोजना प्राप्त करना

एक शुरुआती परियोजना प्रदान की गई है जिसमें कार्यशाला की छवियां और समाधान code शामिल हैं। परियोजना प्राप्त करने के लिए: 

1. यहाँ जाए [https://github.com/microsoft/workshop-library/](https://github.com/microsoft/workshop-library/)
2. **Use this template** को चुनकर अपने GitHub खाते में repository की एक प्रति बनाएं।
3. नए repository का **workshop-library** नाम दें।
4. जब नया repository खुलता है, तो **Code** चुनें।
5. **Local** टैब और फिर **Copy** बटन को चुनें।

    ![Copy icon](/custom-vision-workshop/images/copy.png)

1. Terminal या कमांड विंडो खोलें और निम्न को निष्पादित करें और \<URL\> को आपके URL की प्रति जो पिछले कदम में प्राप्त की गयी उससे बदल दें।

    ```bash
    # Windows
    git clone <URL>
    cd workshop-library\custom-vision-workshop
    code .

    # Linux, WSL or macOS
    git clone <URL>
    cd workshop-library\custom-vision-workshop
    code .
    ```

## छात्रों के लिए Azure के साथ नामांकन करना

छात्रों के लिए Azure 12 महीनों तक उपयोग किए जाने वाले $ 100 US जितने मुफ्त क्रेडिट प्रदान करता है और Custom Vision समेत अनेक मेजबान सेवाएं प्रदान करता है! यदि आपके पास पहले से ही एक Azure अंशदान नहीं हो, तो आप अपने पाठशाला के ई-मेल पते का उपयोग करके [Azure for Students](https://azure.microsoft.com/free/students) में नामांकन करा सकते हैं। यदि आपका ई-मेल पता काम नहीं करता है, तो कृपया अपने प्रशिक्षक को एक कोड के लिए पूछें।

## कुंजियाँ बनाना

Custom Vision का उपयोग करने के लिए, आपको दो कुंजियों की आवश्यकता होगी:

- एक प्रशिक्षण कुंजी, model बनाने के लिए
- एक भविष्यवाणी कुंजी, model के आधार पर भविष्यवाणियां करने के लिए

हम Azure Portal का उपयोग करके इन कुंजियों को बनाएंगे।

1. यहाँ जाए [portal.azure.com](https://portal.azure.com)
2. **Create a resource** को चुनें
3. **Custom Vision** को खोजें और enter दबाएं
4. **Custom Vision** को सेवाओं की सूची में से चुनें
5. **Create** चुनें
6. **Create Options** के लिए **Both** चूना गया हैं वह सुनिश्चित करें
7. **Project Details** के अंतर्गत निम्नलिखित को configure करें:
    1. **Subscription** के लिए अपने Azure for Students अंशदान को चुनें
    2. **Resource Group** के लिए **Create new** चुनकर, नाम के लिए **custom-vision** enter करें और **OK** चुनें
8. **Instance Details** के अंतर्गत निम्नलिखित को configure करें:
    1. **Region** के लिए आप के पास के एक क्षेत्र का चयन करें
    2. **Name** के लिए, एक अनोखा नाम प्रदान करें जैसे की **custom-vision-your-name**, और **your-name** को आपके नाम से बदल दें
9. **Training pricing tier** एवं **Prediction pricing tier** दोनों के लिए **Free F0** चुनें
10. **Review + create** चुनें
11. **Create** चुनें

## सारांश

अब आपके पास Custom Vision model बनाने और उपयोग करने के लिए सभी आवश्यक उपकरण हैं। अगला कदम है [अपने model की प्रशिक्षण](./train.hi.md)। 
