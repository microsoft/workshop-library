## COVID Paper Exploration Workshop

## Stage 1: Desired Results 

This workshop explores the use of [Azure Text Analytics](https://azure.microsoft.com/services/cognitive-services/text-analytics/?WT.mc_id=academic-49822-dmitryso) and [Text Analytics for Health](https://docs.microsoft.com/azure/cognitive-services/language-service/text-analytics-for-health/overview/?WT.mc_id=academic-49822-dmitryso) to get some insights from a large corpus of COVID medical papers. 

1. Students will be skilled at:
   - Understanding modern Natural Language Processing (NLP) techniques and the use of AI in dealing with textual data
   - Using Azure Cognitive Services and specifically Text Analytics
   - Working in Jupyter Notebooks in Codespaces, VS Code or locally.
   - Data processing using Python toolchain: Pandas, Numpy
   - Different means of data visualizations: Chord diagrams, Sankey diagrams

1. Students will be able to independently use their learning to:
   - Process volumes of any medical texts to extract some insights
   - Apply this technique to the texts in a different problem domain. The level of semantic understanding of text is limited by Text Analytics service.

## Stage 2: Evidence

As a result of the workshop, students should produce visual insights into a large corpus of medical texts that shows:
 
 - Which medications are mostly discussed and why
 - How strategies of COVID treatment changed over time
 - How symptoms are related to different diagnoses
 - Which medications are often used together

## Stage 3: Learning Plan

Workshop milestones:

1. [Obtain the dataset from Kaggle](data/README.md)
1. Open [`COVIDPaperExploration.ipynb`](COVIDPaperExploration.ipynb) notebook in Jupyter using [any of the proposed methods](https://soshnikov.com/education/how-to-execute-notebooks-from-github/) and do some initial data exploration.
1. [Register for Microsoft Azure if needed](https://azure-for-academics.github.io/getting-azure/) and create Text Analytics cloud resource.
1. Run a subset of paper abstracts through [Text Analytics for Health](https://docs.microsoft.com/azure/cognitive-services/language-service/text-analytics-for-health/overview/?WT.mc_id=academic-49822-dmitryso) cognitive service
1. Build data visualizations to show visual insights into text corpus.
