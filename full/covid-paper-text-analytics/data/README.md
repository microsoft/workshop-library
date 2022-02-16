## Obtaining the Data

In this workshop, we will be analyzing COVID medical papers. First of all, we need to obtain the dataset which we will use. In this directory, there is a sample file **metadata.csv** that contains information on only 5 papers. You need to replace it with full dataset before continuing with the workshop. 

### About the Dataset

At the very beginning of COVID pandemic, a research challenge has been launched on [Kaggle](http://kaggle.com) to analyze scientific papers on the subject. The dataset behind this competition is called [CORD](https://www.semanticscholar.org/cord19), and it contains constantly updated corpus of everything that is published on topics related to COVID. About half of the papers are with full text, while the other half contains the metadata.

This dataset consists of the following parts:

* **Metadata file** [Metadata.csv](https://www.kaggle.com/allen-institute-for-ai/CORD-19-research-challenge?select=metadata.csv) contains most important information for all publications in one place. Each paper in this table has unique identifier `cord_uid` (which in fact does not happen to be completely unique, once you actually start working with the dataset). The information includes:
   - Title of publication
   - Journal
   - Authors
   - Abstract
   - Date of publication
   - doi
* **Full-text papers** in `document_parses` directory that contain structured text in JSON format, which greatly simplifies the analysis.
* **Pre-built Document Embeddings** that map `cord_uid`s to float vectors that reflect some overall semantics of the paper

In this workshop, we will deal with just paper abstracts, so we only need **metadata.csv** file.

### Getting the Data

The dataset is available on [Kaggle](http://kaggle.com), which is a well-known resource for running machine learning competitions. You can download **metadata.csv** file directly from there.

1. If you have not registered on Kaggle before, [do it](https://www.kaggle.com/account/login?phase=startRegisterTab). Otherwise, login.
1. Go to the [CORD Dataset Page](https://www.kaggle.com/allen-institute-for-ai/CORD-19-research-challenge?select=metadata.csv) and select **metadata.csv** file.
1. Click on the download icon to download the file on your local machine in the current directory.
1. Replace the sample **metadata.csv** file which is there. You may need to unzip the file if needed.

> Notice that `metadata.csv` file is rather large, more than 1 Gb. This may cause file processing to be slow at some times. You should not be surprised, as we are dealing with rather large amounts of real world data!

Once you do that, you can proceed with the workshop.
