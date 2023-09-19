# WordCloud

## OBJECTIVE :
>Creatig a word cloud from the definition of ["Big Data"](https://en.wikipedia.org/wiki/Big_data) as provided by Wikipedia.

## OVERVIEW:

### INPUT - WEB SCRAPPING 
For this project, the *definition* of “Big Data” along with its *characteristics* has been used to generate a word could after removing certain stop words.
To establish a precise model for model comparison we have only used the *introduction, definition and characteristics* of Big Data as provided in the aforementioned article from Wikipedia.
We have not used any information on “Architecture”, “Applications” etc for this analysis.

### DATA CLEANING:
We have converted the data into a text corpus after removing Stopwords and unnecessary text resulting from scrapping Wikipedia like:
![image](https://github.com/anurima-saha/WordCloud/assets/142840970/2d695c71-4da2-44df-860d-cc7943c232e6)

### PACKAGES USED -

- tm
-  NLP
-  rvest
-  RColorBrewer
-  SnowballC
-  Stringr
-  worldcloud
  
### FINAL OUTPUT -
The worldcloud is saved in form a *png* file.
![image](https://github.com/anurima-saha/WordCloud/assets/142840970/0c365952-3fb2-4bb8-87cd-c2c6dea17969)





